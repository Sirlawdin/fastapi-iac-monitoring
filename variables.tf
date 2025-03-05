variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}


variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-west-2"
}

#VPC Variables
variable "vpc_name" {}
variable "vpc_cidr_block" {}
variable "vpc_private_subnets" {}
variable "vpc_public_subnets" {}



#EKS Variables
variable "k8s_name" {}
variable "k8s_version" {}
variable "eks_instance_types" {}
variable "eks_min_size" {}
variable "eks_max_size" {}
variable "eks_desired_size" {}
variable "cluster_endpoint_public_access" {}
variable "vpc_id" {}
variable "subnet_ids" {}


#Application Variables
variable "image_url" {}
variable "image_tag" {}
variable "replica_count" {}
variable "application_namespace" {}
variable "application_port" {}


#Datadog Variables
variable "datadog_api_key" {}
variable "datadog_app_key" {}
variable app_name {}