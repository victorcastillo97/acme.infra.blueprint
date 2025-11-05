# ServiceAccount con IRSA para el ALB controller
resource "kubernetes_service_account_v1" "aws_load_balancer_controller" {
  metadata {
    name      = var.lbc_service_account_name
    namespace = var.lbc_namespace
    annotations = {
      "eks.amazonaws.com/role-arn" = var.lbc_role_arn
    }
  }
}

# aws-load-balancer-controller
resource "helm_release" "aws_load_balancer_controller" {
  name             = "aws-load-balancer-controller"
  repository       = "https://aws.github.io/eks-charts"
  chart            = "aws-load-balancer-controller"
  namespace        = var.lbc_namespace
  create_namespace = false

  set {
    name  = "clusterName"
    value = var.cluster_name
  }

  set {
    name  = "serviceAccount.create"
    value = false
  }

  set {
    name  = "serviceAccount.name"
    value = kubernetes_service_account_v1.aws_load_balancer_controller.metadata[0].name
  }

  set {
    name  = "vpcId"
    value = var.vpc_id
  }

  depends_on = [kubernetes_service_account_v1.aws_load_balancer_controller]
}

## ingress-nginx (ClusterIP)
#resource "helm_release" "nginx_ingress" {
#  name             = var.nginx_release_name
#  repository       = "https://kubernetes.github.io/ingress-nginx"
#  chart            = "ingress-nginx"
#  version          = var.nginx_chart_version
#  namespace        = var.nginx_namespace
#  create_namespace = true
#
#  set {
#    name  = "service.type"
#    value = "ClusterIP"
#  }
#}