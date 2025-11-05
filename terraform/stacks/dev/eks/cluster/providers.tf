provider "aws" {
  region = var.region
  
  default_tags {
    tags = {
      owner = var.tag_owner
      env   = var.tag_env
    }
  }
}