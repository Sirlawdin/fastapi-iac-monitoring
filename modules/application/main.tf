resource "kubernetes_deployment" "my-fastapi-app" {
  depends_on = [helm_release.datadog_agent] # Ensures Datadog is deployed first
  metadata {
    name = "my-fastapi-app"
    labels = {
      app = "my-fastapi-app"
    }
  }

  spec {
    replicas = var.replica_count
    selector {
      match_labels = {
        app = "my-fastapi-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "my-fastapi-app"
        }
      }

      spec {
        container {
          name  = "app"
          image = var.image_url

          # Datadog APM Integration
          env {
            name  = "DD_SERVICE"
            value = "fastapi-tracing"
          }

          env {
            name  = "DD_ENV"
            value = "production"
          }

          env {
            name  = "DD_TRACE_AGENT_HOSTNAME"
            value = "datadog-agent"
          }

          env {
            name  = "DD_TRACE_DEBUG"
            value = "true"
          }

          port {
            container_port = var.application_port
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "my-fastapi-app-service" {
  metadata {
    name = "my-fastapi-app-service"
  }

  spec {
    selector = {
      app = "my-fastapi-app"
    }

    port {
      protocol    = "TCP"
      port        = var.application_port
      target_port = var.application_port
    }

    type = "LoadBalancer"
  }
}
