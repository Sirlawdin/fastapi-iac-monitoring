variable "image_url" {
  description = "Docker image URL for the application"
  type        = string
  default     = "sirlawdin/trace-fast-api"
}

variable "replica_count" {
  description = "Number of application replicas"
  type        = number
  default     = 2
}

variable "cluster_endpoint" {
  description = "EKS API Server Endpoint"
  type        = string
}

variable "cluster_ca_cert" {
  description = "EKS Cluster CA Certificate"
  type        = string
}

variable "cluster_token" {
  description = "Authentication Token for Kubernetes"
  type        = string
}

variable "application_port" {
  description = "Application port"
  type        = number
  default     = 8000
  
}


