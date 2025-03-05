output "app_service_name" {
  description = "The name of the Kubernetes service for the application"
  value       = kubernetes_service.app_service.metadata[0].name
}

output "app_service_url" {
  description = "The external LoadBalancer URL for the application"
  value       = "http://${kubernetes_service.my-fastapi-app-service.status[0].load_balancer[0].ingress[0].hostname}:${var.application_port}"
}


output "app_image_url" {
  description = "The Docker image URL used for the application"
  value       = var.image_url
}
