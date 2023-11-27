resource "kubernetes_service_v1" "redis" {
  metadata {
    name = "redis"
    labels = {
      "key" = "redis"
    }
  }
  spec {
    
    selector = {
      App = "redis"
    }
    port {
      name = "redis"
      port        = 6379
      target_port = 54637932
    }
  }
}