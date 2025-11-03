output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "VPC ID"
}

output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "IDs subredes públicas"
}

output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "IDs subredes privadas"
}

output "nat_public_ips" {
  value       = module.vpc.nat_public_ips
  description = "EIPs del/los NAT GW"
}