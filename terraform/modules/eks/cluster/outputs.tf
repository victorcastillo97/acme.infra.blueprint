output "cluster_name" {
  value       = module.eks.cluster_name
  description = "Nombre del cluster."
}

output "oidc_provider_arn" {
  value       = module.eks.oidc_provider_arn
  description = "ARN del OIDC provider del cluster."
}

output "oidc_provider" {
  value       = module.eks.oidc_provider
  description = "Identificador del OIDC provider (sin ARN), usado en condiciones IRSA."
}
