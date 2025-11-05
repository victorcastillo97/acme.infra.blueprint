output "repository_name" {
  value       = aws_ecr_repository.this.name
  description = "Nombre del repositorio ECR."
}

output "repository_arn" {
  value       = aws_ecr_repository.this.arn
  description = "ARN del repositorio ECR."
}

output "repository_url" {
  value       = aws_ecr_repository.this.repository_url
  description = "URL del repositorio ECR (para docker push/pull)."
}
