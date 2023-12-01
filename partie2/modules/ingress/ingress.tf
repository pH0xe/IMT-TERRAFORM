variable "metadata_name" {
  type        = string
  description = "value of metadata.name"
}

variable "service_name" {
  type        = string
  description = "value of spec.default_backend.service.name"
}

variable "service_port" {
  type        = number
  description = "value of spec.default_backend.service.port.number"
}

resource "kubernetes_ingress_v1" "ingress" {
  metadata {
    name = var.metadata_name
  }
  spec {
    default_backend {
      service {
        name = var.service_name
        port {
          number = var.service_port
        }
      }
    }
  }
}
