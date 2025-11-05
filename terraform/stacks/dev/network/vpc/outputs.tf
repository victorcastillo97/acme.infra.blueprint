output "vpc_id"{
    value = module.vpc.vpc_id
}

output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "IDs public subnets"
}

output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "IDs private subnets"
}
