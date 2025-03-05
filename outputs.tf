# EKS Cluster Outputs
output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "cluster_ca_cert" {
  description = "The cluster CA certificate for authentication"
  value       = module.eks.cluster_ca_cert
}





# Application Outputs
output "my-fastapi-app_name" {
  description = "The name of the deployed tracing application"
  value       = module.application.my-fastapi-app_name
}

output "application_service_url" {
  description = "The URL for the FastAPI application"
  value       = module.application.app_service_url
}




# Datadog Outputs
output "datadog_status" {
  description = "Status of the Datadog agent deployment"
  value       = module.datadog.datadog_agent_status
}

output "datadog_service" {
  description = "The Kubernetes service name for Datadog"
  value       = module.datadog.datadog_service
}


