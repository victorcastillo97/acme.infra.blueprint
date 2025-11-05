data "terraform_remote_state" "networking" {
  backend = "s3"
  config = {
    bucket         = var.remote_state_bucket
    key            = var.remote_state_key_network
    region         = var.remote_state_region
  }
}

module "eks_cluster" {
  source              = "../../../../modules/eks/cluster"
  cluster_name  = var.cluster_name
  vpc_id     = data.terraform_remote_state.networking.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.networking.outputs.private_subnets
}
