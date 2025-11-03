
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.4.0"

  # VPC Basic Details
  name               = var.vpc_name
  cidr               = var.vpc_cidr_block
  azs                = var.vpc_availability_zones
  public_subnets     = var.vpc_public_subnets
  private_subnets    = var.vpc_private_subnets

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  tags     = var.tags

  # Additional Tags to Subnets
  public_subnet_tags = {
    Type = "Public Subnets"
    "kubernetes.io/role/elb"                 = 1
    "kubernetes.io/cluster/${var.vpc_name}"  = "shared"
  }

  private_subnet_tags = {
    Type = "private-subnets"
    "kubernetes.io/role/internal-elb"        = 1
    "kubernetes.io/cluster/${var.vpc_name}"  = "shared"
  }
}
