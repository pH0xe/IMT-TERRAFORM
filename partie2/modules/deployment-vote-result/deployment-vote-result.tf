variable "name" {
  type = string
}

variable "labels" {
  type = map(any)
}

variable "replicas" {
  type = number
}

variable "match_labels" {
  type = map(any)
}

variable "container_name" {
  type = string
}

variable "container_image" {
  type = string
}

variable "container_port" {
  type = number
}

variable "container_port_name" {
  type = string
}

resource "kubernetes_deployment_v1" "deplt" {
  metadata {
    name   = var.name
    labels = var.labels
  }
  spec {
    replicas = var.replicas
    selector {
      match_labels = var.match_labels
    }
    template {
      metadata {
        labels = var.labels
      }
      spec {
        container {
          name  = var.container_name
          image = var.container_image
          port {
            container_port = var.container_port
            name           = var.container_port_name
          }
        }
      }
    }
  }
}
