resource "aws_iam_policy" "load_balancer_controller" {
  name        = "AmazonEKSLoadBalancerControllerPolicyTF"
  path        = "/"
  description = "Policy for load balancer controller on EKS"
  policy      = file("${path.module}/iam_policy.json")
}

resource "aws_iam_role" "load_balancer_controller" {
  name = "AmazonEKSLoadBalancerControllerRoleTF"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = ""
        Effect = "Allow"
        Action = "sts:AssumeRoleWithWebIdentity"
        Principal = {
          Federated = var.oidc_provider_arn
        }
        Condition = {
          StringEquals = {
            "${var.oidc_provider}:sub" = "system:serviceaccount:kube-system:aws-load-balancer-controller"
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "load_balancer_controller" {
  name       = "AmazonEKSLoadBalancerControllerRoleTF"
  roles      = [aws_iam_role.load_balancer_controller.name]
  policy_arn = aws_iam_policy.load_balancer_controller.arn
}
