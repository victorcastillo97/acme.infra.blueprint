output "role_arn" {
  value       = aws_iam_role.load_balancer_controller.arn
  description = "ARN del rol IAM para el AWS Load Balancer Controller."
}
