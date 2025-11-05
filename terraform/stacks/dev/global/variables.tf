variable "region" {
  description = "Región AWS donde se emitirá el certificado (debe coincidir con la región del ALB/EKS)."
  type        = string
}

variable "domain_name" {
  description = "Dominio principal para el certificado (ej: *.midominio.com o app.midominio.com)."
  type        = string
}

variable "zone_id" {
  description = "Hosted Zone ID de Route 53 donde se crearán los registros de validación DNS."
  type        = string
}

# Alternativas/SANs opcionales (normalmente no necesitas si usas wildcard *.midominio.com)
variable "subject_alternative_names" {
  description = "Lista de SANs adicionales para el certificado."
  type        = list(string)
  default     = []
}

variable "wait_for_validation" {
  description = "Esperar hasta que el certificado quede 'Issued' antes de terminar el apply."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags opcionales para el certificado."
  type        = map(string)
  default     = {}
}

# Si prefieres resolver la zone por nombre (descomenta el data source en main.tf)
# variable "zone_name" {
#   description = "Nombre de la Hosted Zone (ej: midominio.com.) — termina en punto."
#   type        = string
#   default     = null
# }
