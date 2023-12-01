variable "metadata_name" {
  type        = string
  description = "value of metadata.name"
}

variable "metadata_labels_app" {
  type        = string
  description = "value of metadata.labels.app"
}

variable "selector_app" {
  type        = string
  description = "value of spec.selector.app"
}

variable "service_port" {
  type        = number
  description = "value of spec.ports.port"
}

variable "target_port" {
  type        = number
  description = "value of spec.ports.target_port"
}

variable "port_name" {
  type        = string
  description = "value of spec.ports.name"
}

variable "service_type" {
  type        = string
  description = "value of spec.type"
}

variable "node_port" {
  type        = number
  description = "value of spec.ports.node_port"
  default     = 0
}

resource "kubernetes_service_v1" "service" {
  metadata {
    name = var.metadata_name
    labels = {
      app = var.metadata_labels_app
    }
  }

  spec {
    selector = {
      app = var.selector_app
    }
    type = var.service_type
    port {
      name        = var.port_name
      port        = var.service_port
      target_port = var.target_port
      node_port   = var.node_port == 0 ? null : var.node_port
    }
  }
}
