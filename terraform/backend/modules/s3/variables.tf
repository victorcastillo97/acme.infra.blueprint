variable "s3_bucket_name" { 
  type = string
}

variable "kms_alias" {
  type        = string
  description = "Alias para la CMK de KMS (ej. alias/tfstate)"
  default     = "alias/tfstate"
}