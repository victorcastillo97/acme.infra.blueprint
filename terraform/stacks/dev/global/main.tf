module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = var.domain_name
  zone_id      = data.aws_route53_zone.this.zone_id

  validation_method = "DNS"          # Deja que el módulo cree los CNAME en Route53
  subject_alternative_names = var.subject_alternative_names
  wait_for_validation       = var.wait_for_validation

  tags = var.tags
}