variable "owner"{
  type = string 
}

variable "env"{
  type = string 
}

variable "region"{
  type = string
}

variable "ecr_name" {
  description = "Nombre del repositorio ECR."
  type        = string
}