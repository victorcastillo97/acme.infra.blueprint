variable "remote_state_bucket" {
  type        = string
  description = "Bucket S3 del state remoto de networking."
}

variable "remote_state_key_network" {
  type        = string
  description = "Key del state remoto de networking."
}

variable "remote_state_region" {
  type        = string
  description = "Región del bucket S3 de networking."
}

variable "cluster_name" {
  type        = string
  description = "Nombre del clúster EKS."
}