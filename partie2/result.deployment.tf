resource "kubernetes_deployment_v1" "result" {
  metadata {
    name = "result"
    labels = {
      app = "result"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "result"
      }
    }
    template {
      metadata {
        labels = {
          app = "result"
        }
      }
      spec {
        container {
          image = "dockersamples/examplevotingapp_result"
          name  = "worker"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}
