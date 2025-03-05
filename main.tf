# Retrieve EKS cluster details
data "aws_eks_cluster" "eks-cluster" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "eks-cluster" {
  name = module.eks.cluster_name
}



module "vpc" {
  source = "./modules/vpc"

  vpc_name            = var.vpc_name
  vpc_cidr_block      = var.vpc_cidr_block
  vpc_private_subnets = var.vpc_private_subnets
  vpc_public_subnets  = var.vpc_public_subnets
}


module "eks" {
  source = "./modules/eks"

  k8s_name                       = var.k8s_name
  k8s_version                    = var.k8s_version
  cluster_endpoint_public_access = var.cluster_endpoint_public_access

  eks_instance_types = var.eks_instance_types
  eks_min_size       = var.eks_min_size
  eks_max_size       = var.eks_max_size
  eks_desired_size   = var.eks_desired_size

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
}


module "application" {
  source       = "./modules/application"
  image_url    = var.image_url
  replica_count = var.replica_count  
  cluster_endpoint  = data.aws_eks_cluster.eks-cluster.endpoint
  cluster_ca_cert   = data.aws_eks_cluster.eks-cluster.certificate_authority[0].data
  cluster_token     = data.aws_eks_cluster_auth.eks-cluster.token
  application_namespace = var.application_namespace
}

module "datadog" {
  source          = "./modules/datadog"
  eks_cluster_id  = module.eks.cluster_id
  datadog_api_key = var.datadog_api_key
  datadog_app_key = var.datadog_app_key
  app_name = var.app_name
  datadog_namespace = module.application.application_namespace
}

