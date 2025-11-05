

variable "name" {
  description = "Nombre del repositorio ECR (único por región/cuenta)."
  type        = string
}

variable "image_tag_mutability" {
  description = "Mutable o IMMUTABLE."
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Habilita escaneo de imágenes al subir."
  type        = bool
  default     = true
}

variable "force_delete" {
  description = "Permite borrar el repo aunque tenga imágenes."
  type        = bool
  default     = true
}

variable "encryption_type" {
  description = "Tipo de cifrado: AES256 o KMS."
  type        = string
  default     = "AES256"
}


variable "lifecycle_policy_json" {
  description = "JSON de la política de ciclo de vida (opcional)."
  type        = string
  default     = null
}


