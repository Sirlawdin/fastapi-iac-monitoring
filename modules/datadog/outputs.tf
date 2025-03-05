output "datadog_agent_status" {
  description = "Datadog agent deployment status"
  value       = helm_release.datadog.status
}

output "datadog_namespace" {
  description = "Namespace where Datadog agent is deployed"
  value       = helm_release.datadog.namespace
}

output "datadog_cluster_name" {
  description = "EKS Cluster Name for Datadog monitoring"
  value       = var.eks_cluster_id
}





output "datadog_helm_release" {
  description = "The name of the Helm release for Datadog"
  value       = "helm_release.datadog.name"
}

output "datadog_service" {
  description = "The Kubernetes service name for Datadog"
  value       = "datadog.default.svc.cluster.local"
}

output "datadog_apm_dashboard_url" {
  description = "URL to access Datadog APM dashboard"
  value       = data.datadog_dashboard.default_apm.url
}



