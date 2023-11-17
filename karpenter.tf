resource "kubectl_manifest" "karpenter_provisioner" {
    yaml_body = templatefile(
        "${path.module}/files/karpenter/node_pool.yml.tpl",{
        EKS_CLUSTER         = var.cluster_name,
        CAPACITY_TYPE       = var.karpenter_capacity_type
        INSTANCE_FAMILY     = var.karpenter_instance_family
        INSTANCE_SIZES      = var.karpenter_instance_sizes
        AVAILABILITY_ZONES  = var.karpenter_availability_zones
        CPU_LIMIT           = var.karpenter_cpu_limit
        MEMORY_LIMIT        = var.karpenter_memory_limit
    })

  depends_on = [
    helm_release.karpenter
  ]
}

resource "kubectl_manifest" "karpenter_template" {
    yaml_body = templatefile(
        "${path.module}/files/karpenter/ec2_node_class.yml.tpl",{
        EKS_CLUSTER         = var.cluster_name,
        LAUNCH_TEMPLATE     = format("%s-template", var.cluster_name)
        KARPENTER_NODE_ROLE = aws_iam_role.eks_nodes_roles.name
        EKS_SECURITY_GROUP  = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
    })

  depends_on = [
    helm_release.karpenter
  ]
}

