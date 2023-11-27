resource "kubernetes_deployment_v1" "vote" {
  metadata {
    name = "vote"
    labels = {
      app = "vote"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "vote"
      }
    }
    template {
      metadata {
        labels = {
          app = "vote"
        }
      }
      spec {
        container {
          name  = "vote"
          image = "dockersamples/examplevotingapp_vote"
          port {
            container_port = 80
            name           = "vote"
          }
        }
      }
    }
  }
}
