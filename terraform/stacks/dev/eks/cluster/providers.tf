provider "aws" {
  region = var.region
  
  default_tags {
    tags = {
      owner = var.owner
      env   = var.env
    }
  }
}