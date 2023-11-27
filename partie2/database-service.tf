resource "kubernetes_service_v1" "db" {
  metadata {
    name = "db"
    labels = {
      "key" = "db"
    }
  }
  spec {
    type="ClusterIP"
    selector = {
      App = "db"
    }
    port {
      name = "db-service"
      port        = 5432
      target_port = 5432
    }
  }
}