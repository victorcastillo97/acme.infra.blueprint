variable "cluster_name" {
  type        = string
  description = "Nombre del clúster EKS."
}

variable "vpc_id" {
  type        = string
  description = "ID de la VPC existente donde vivirá el clúster."
}

variable "subnet_ids" {
  type        = list(string)
  description = "IDs de subredes (privadas o mixtas) donde se ubicarán los nodos del clúster."
}
