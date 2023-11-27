resource "kubernetes_deployment" "redis" {
  metadata {
    name = "redis"
    labels = {
      "key" = "redis"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
      "key" = "redis"
      }
    }

    template{
      metadata {
        labels = {
        "key" = "redis"
        }
      }
      spec {
        container {
          image = "redis:alpine"
          name  = "redis"

          port {
            container_port = 6379
            name = "redis"
          }
          volume_mount {
            mount_path = "/data"
            name = "redis-data"
          }
        }
        volume {
          name = "redis-data"
          empty_dir {}
        }
      }
    }
  }
}
