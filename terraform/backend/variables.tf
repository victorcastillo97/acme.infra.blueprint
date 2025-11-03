variable "s3_bucket_name" { 
  type = string
}

variable "dynamodb_table_name" { 
  type = string
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = ""
}

variable "aws_profile" {
  description = "AWS Profile"
  type        = string
  default     = ""
}

variable "kms_alias" {
  type        = string
  description = "Alias para la CMK de KMS (ej. alias/tfstate)"
  default     = "alias/tfstate"
}
