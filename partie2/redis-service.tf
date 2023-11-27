resource "kubernetes_service_v1" "redis" {
  metadata {
    name = "redis"
    labels = {
      app = "redis"
    }
  }
  spec {
    
    selector = {
      app = "redis"
    }
    port {
      name = "redis"
      port        = 6379
      target_port = 6379
    }
  }
}