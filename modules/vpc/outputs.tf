output "vpc_id" {
  value = module.eks-vpc-module.vpc_id
}

output "private_subnets" {
  value = module.eks-vpc-module.private_subnets
}

output "public_subnets" {
  value = module.eks-vpc-module.public_subnets
}
