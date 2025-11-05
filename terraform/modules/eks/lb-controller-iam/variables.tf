variable "oidc_provider_arn" {
  type        = string
  description = "ARN del OIDC provider del cluster (para IRSA)."
}

variable "oidc_provider" {
  type        = string
  description = "Identificador del OIDC provider (p.ej. oidc.eks.<region>.amazonaws.com/id/XXXX)."
}
