output "cluster_name" {
  value       = module.eks_cluster.cluster_name
  description = "Nombre del cluster"
}

output "oidc_provider_arn" {
  value       = module.eks_cluster.oidc_provider_arn
  description = "ARN del OIDC provider del cluster"
}

output "oidc_provider" {
  value       = module.eks_cluster.oidc_provider
  description = "OIDC provider (sin ARN)"
}
