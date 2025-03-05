variable "vpc_name" {
    description = "VPC name"
    type = string
    default = "eks-vpc"
}

# variable "aws_region" {
#   type    = string
#   default = "us-west-2"
# }


variable "vpc_cidr_block" {
    description = "VPC CIDR block"
    type = string
    default = "10.0.0.0/16"
}

variable "vpc_private_subnets" {
    description = "VPC private subnets (comma separated)"
    type = list(string)
    default = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ] 
}

variable "vpc_public_subnets" {
    description = "VPC public subnets (comma separated)"
    type = list(string)
    default = [ "10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24" ] 
}


