terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.31"
    }
  }

}

module "aws_provider" {
  source     = "../providers/aws"
  aws_region = var.aws_region
}
