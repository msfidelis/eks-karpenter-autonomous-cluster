# resource "helm_release" "prometheus" {
#   name             = "prometheus"
#   chart            = "kube-prometheus-stack"
#   repository       = "https://prometheus-community.github.io/helm-charts"
#   namespace        = "prometheus"
#   create_namespace = true

#   version = "45.8.0"

#   set {
#     name  = "fullnameOverride"
#     value = "prometheus"
#   }

#   values = [
#     "${file("./helm/prometheus/values.yaml")}"
#   ]


#   depends_on = [
#     aws_eks_cluster.eks_cluster,
#     kubernetes_config_map.aws-auth,
#     aws_eks_fargate_profile.prometheus
#   ]
# }