# resource "helm_release" "kube_green" {
#     namespace           = "kube-green"
#     create_namespace    = true

#     name                = "kube-green"
#     chart               = "./charts/kube-green"

#     set {
#         name    = "image.repository"
#         value   = "kubegreen/kube-green"
#     }

#     set {
#         name    = "image.tag"
#         value   = "0.5.1"
#     }

#     depends_on = [
#         aws_eks_cluster.eks_cluster,
#         kubernetes_config_map.aws-auth,
#         aws_eks_fargate_profile.karpenter
#     ]

# }