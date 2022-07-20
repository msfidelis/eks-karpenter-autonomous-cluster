resource "aws_iam_instance_profile" "karpenter" {
  name = "KarpenterNodeInstanceProfile-${var.cluster_name}"
  role = aws_iam_role.eks_nodes_roles.name
}

resource "aws_eks_fargate_profile" "karpenter" {
  cluster_name           = aws_eks_cluster.eks_cluster.name
  fargate_profile_name   = "karpenter"
  pod_execution_role_arn = aws_iam_role.eks_fargate_role.arn
    subnet_ids = [
      aws_subnet.private_subnet_1a.id,
      aws_subnet.private_subnet_1b.id,
      aws_subnet.private_subnet_1c.id
    ]

  selector {
    namespace = "karpenter"
  }

  depends_on = [
    aws_eks_fargate_profile.kube_system,
    data.aws_lambda_invocation.coredns_fix
  ]
}

resource "helm_release" "karpenter" {
    namespace        = "karpenter"
    create_namespace = true

    name       = "karpenter"
    repository = "https://charts.karpenter.sh"
    chart      = "karpenter"
    version    = "v0.13.1"

    set {
        name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
        value = aws_iam_role.karpenter_role.arn
    }

    set {
        name  = "clusterName"
        value = var.cluster_name
    }

    set {
        name  = "clusterEndpoint"
        value = aws_eks_cluster.eks_cluster.endpoint
    }

    set {
        name  = "aws.defaultInstanceProfile"
        value = aws_iam_instance_profile.karpenter.name
    }

    depends_on = [
        aws_eks_cluster.eks_cluster,
        kubernetes_config_map.aws-auth,
        aws_eks_fargate_profile.karpenter
    ]

}