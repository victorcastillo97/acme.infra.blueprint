module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = var.cluster_name
  kubernetes_version = "1.33"

  # Endpoint como ya lo venías usando
  endpoint_public_access  = true
  endpoint_private_access = true

  enable_cluster_creator_admin_permissions = true

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  # Addons básicos + Pod Identity Agent (antes de cómputo)
  addons = {
    coredns = {}
    kube-proxy = {}
    metrics-server = {}
    vpc-cni = {
      before_compute = true
    }
  }

  # Un node group simple (t3.large) como ya lo tenías
  eks_managed_node_groups = {
    workers-node = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      instance_types = ["t3.large"]

      min_size     = 1
      max_size     = 2
      desired_size = 2
    }
  }

}
