variable "k8s_name" {
  description = "The name of the EKS cluster"
  type        = string
  default = "pof-cluster"
}

variable "k8s_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.18"
  
}

variable "eks_instance_types" {
  description = "The instance types for the EKS cluster"
  type        = list(string)
  default     = ["t3.micro", "t3.small", "t3.medium"]
}

variable "eks_min_size" {
  description = "The minimum size of the EKS cluster"
  type        = number
  default     = 1
}

variable "eks_max_size" {
    description = "The maximum size of the EKS cluster"
    type        = number
    default     = 2
}

variable "eks_desired_size" {
    description = "The desired size of the EKS cluster"
    type        = number
    default     = 1
}

variable "cluster_endpoint_public_access" {
  type    = bool
  default = true
}


variable "vpc_id" {
  description = "VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "Private subnets for the EKS cluster"
  type        = list(string)
}
