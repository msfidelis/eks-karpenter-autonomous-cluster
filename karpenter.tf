resource "kubectl_manifest" "karpenter_provisioner" {
    yaml_body = templatefile(
        "${path.module}/files/karpenter/provisioner.yml.tpl",{
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
        "${path.module}/files/karpenter/template.yml.tpl",{
        EKS_CLUSTER         = var.cluster_name,
        LAUNCH_TEMPLATE     = format("%s-template", var.cluster_name)
    })

  depends_on = [
    helm_release.karpenter
  ]
}

