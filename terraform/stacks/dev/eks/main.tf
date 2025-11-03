
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  # ----- Identidad del cluster -----
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  # ----- Red (conecta a tu VPC del otro módulo) -----
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets  # Nodos solo en subredes privadas

  # ----- Acceso al endpoint de la API de Kubernetes -----
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access_cidrs = var.api_cidrs

  # ----- Addons core gestionados por EKS -----
  cluster_addons = {
    coredns = {
      resolve_conflicts_on_create = "OVERWRITE"
      resolve_conflicts_on_update = "OVERWRITE"
    }
    vpc-cni = {
      resolve_conflicts_on_create = "OVERWRITE"
      resolve_conflicts_on_update = "OVERWRITE"
    }
    kube-proxy = {
      resolve_conflicts_on_create = "OVERWRITE"
      resolve_conflicts_on_update = "OVERWRITE"
    }
    aws-ebs-csi-driver = {
      resolve_conflicts_on_create = "OVERWRITE"
      resolve_conflicts_on_update = "OVERWRITE"
    }
  }

  # ----- Nodo(s) administrados por EKS -----
  eks_managed_node_groups = {
    node-group = {
      instance_types = ["t3.micro"]
      min_size       = 1
      max_size       = 2
      desired_size   = 1

      tags = { Environment = "tutorial" }
    }
  }

  manage_aws_auth_configmap = true
}
