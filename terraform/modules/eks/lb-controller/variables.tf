variable "cluster_name" {
  type        = string
  description = "Nombre del cluster EKS para el aws-load-balancer-controller."
}

variable "vpc_id" {
  type        = string
  description = "VPC ID del cluster, usado por el aws-load-balancer-controller."
}

variable "lbc_role_arn" {
  type        = string
  description = "ARN del rol IAM (IRSA) para el aws-load-balancer-controller."
}

variable "lbc_namespace" {
  type        = string
  default     = "kube-system"
  description = "Namespace donde vive el aws-load-balancer-controller."
}

variable "lbc_service_account_name" {
  type        = string
  default     = "aws-load-balancer-controller"
  description = "ServiceAccount del ALB controller."
}

#variable "nginx_namespace" {
#  type        = string
#  default     = "ingress-nginx"
#  description = "Namespace para ingress-nginx."
#}

#variable "nginx_release_name" {
#  type        = string
#  default     = "nginx-ingress-controller"
#  description = "Release name de ingress-nginx."
#}

#variable "nginx_chart_version" {
#  type        = string
#  default     = "4.11.2"
#  description = "Versión del chart de ingress-nginx."
#}
