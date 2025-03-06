module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.k8s_name
  cluster_version = var.k8s_version

  bootstrap_self_managed_addons = false
  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  # Optional
  cluster_endpoint_public_access = var.cluster_endpoint_public_access

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true


  eks_managed_node_groups = {
    initial = {
      instance_types = var.eks_instance_types[0]
      min_size     = var.eks_min_size 
      max_size     = var.eks_max_size 
      desired_size = var.eks_desired_size
      iam_role_arn   = aws_iam_role.eks_worker_role.arn 
    }
  }


  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  tags = {
    Environment = "proof-of-concept"
    Application   = "python App"
  }
}


resource "aws_iam_role" "eks_worker_role" {
  name = "eksWorkerRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "eks_worker_policy" {
  role       = aws_iam_role.eks_worker_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}
