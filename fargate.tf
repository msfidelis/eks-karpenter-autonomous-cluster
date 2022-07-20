resource "aws_eks_fargate_profile" "kube_system" {
  cluster_name           = aws_eks_cluster.eks_cluster.name
  fargate_profile_name   = "kube-system"
  pod_execution_role_arn = aws_iam_role.eks_fargate_role.arn
    subnet_ids = [
      aws_subnet.private_subnet_1a.id,
      aws_subnet.private_subnet_1b.id,
      aws_subnet.private_subnet_1c.id
    ]

  selector {
    namespace = "kube-system"
  }
}