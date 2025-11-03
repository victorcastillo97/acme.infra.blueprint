locals {
  vpc_name     = "${var.owner}-${var.env}-networking"
  common_tags = {
    owner                  = var.owner
    environment            = var.env
  }
}

module "vpc" {
  source                  = "../../../modules/networking/vpc"
  vpc_name                = local.vpc_name
  vpc_cidr_block          = var.vpc_cidr_block
  vpc_availability_zones  = var.vpc_availability_zones
  vpc_public_subnets      = var.vpc_public_subnets
  vpc_private_subnets     = var.vpc_private_subnets
  tags                    = local.common_tags
}
