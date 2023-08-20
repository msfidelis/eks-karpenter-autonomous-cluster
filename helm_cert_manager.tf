resource "helm_release" "cert" {
    namespace        = "cert-manager"
    create_namespace = true

    name       = "cert-manager"
    repository = "https://charts.jetstack.io"
    chart      = "cert-manager"
    version    = "v1.12.0"

    set {
        name  = "installCRDs"
        value = true
    }

    set {
        name  = "prometheus.enabled"
        value = true
    }

    set {
        name  = "webhook.securePort"
        value = 10260
    }
    
    set {
        name  = "webhook.timeoutSeconds"
        value = 10
    }

    depends_on = [
        aws_eks_cluster.eks_cluster,
        kubernetes_config_map.aws-auth,
        aws_eks_fargate_profile.cert_manager
    ]

}