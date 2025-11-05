output "lbc_service_account_name" {
  value       = kubernetes_service_account_v1.aws_load_balancer_controller.metadata[0].name
  description = "Nombre del ServiceAccount del ALB controller."
}

output "lbc_namespace" {
  value       = var.lbc_namespace
  description = "Namespace del ALB controller."
}