
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = var.remote_state_bucket
    key    = var.remote_state_key_network
    region = var.remote_state_region
  }
}

data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = var.remote_state_bucket
    key    = var.remote_state_key_eks
    region = var.remote_state_region
  }
}


# --- IAM para LBC (usa el módulo que ya creamos)
module "lbc_iam" {
  source            = "../../../../modules/eks/lb-controller-iam"
  oidc_provider_arn = data.terraform_remote_state.eks.outputs.oidc_provider_arn
  oidc_provider     = data.terraform_remote_state.eks.outputs.oidc_provider
}

# --- Despliegue del controlador + ingress (usa TU módulo eks-ingress)
module "eks_lb_controller" {
  source      = "../../../../modules/eks/lb-controller"
  cluster_name = data.terraform_remote_state.eks.outputs.cluster_name
  vpc_id       = data.terraform_remote_state.network.outputs.vpc_id
  lbc_role_arn = module.lbc_iam.role_arn
}
