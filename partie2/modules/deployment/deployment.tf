variable "metadata_name" {
  type        = string
  description = "value of metadata.name"
}

variable "metadata_labels_app" {
  type        = string
  description = "value of metadata.labels.app"
}

variable "replicas" {
  type        = number
  description = "value of spec.replicas"
}

variable "selector_match_labels_app" {
  type        = string
  description = "value of spec.selector.match_labels.app"
}

variable "template_metadata_labels_app" {
  type        = string
  description = "value of spec.template.metadata.labels.app"
}

variable "container_name" {
  type        = string
  description = "value of spec.template.spec.container.name"
}

variable "container_image" {
  type        = string
  description = "value of spec.template.spec.container.image"
}

variable "container_port" {
  type = object({
    container_port = number
    name           = string
  })
  description = "value of spec.template.spec.container.port"
  default     = null
}

variable "container_env" {
  type = list(object({
    name  = string
    value = string
  }))
  description = "value of spec.template.spec.env"
  default     = []
}

variable "volume_mount" {
  type = object({
    mount_path = string
    name       = string
  })
  description = "value of spec.template.spec.volume_mount"
  default     = null
}

variable "volume" {
  type        = string
  description = "value of spec.template.spec.volume"
  default     = null
}

resource "kubernetes_deployment_v1" "deplt" {
  metadata {
    name = var.metadata_name
    labels = {
      app = var.metadata_labels_app
    }
  }
  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        app = var.selector_match_labels_app
      }
    }
    template {
      metadata {
        labels = {
          app = var.template_metadata_labels_app
        }
      }
      spec {
        container {
          name  = var.container_name
          image = var.container_image

          dynamic "port" {
            for_each = var.container_port != null ? [var.container_port] : []
            content {
              container_port = port.value.container_port
              name           = port.value.name
            }
          }

          dynamic "env" {
            for_each = var.container_env
            content {
              name  = env.value.name
              value = env.value.value
            }
          }

          dynamic "volume_mount" {
            for_each = var.volume_mount != null ? [var.volume_mount] : []
            content {
              name       = volume_mount.value.name
              mount_path = volume_mount.value.mount_path
            }
          }
        }

        dynamic "volume" {
          for_each = var.volume != null ? [var.volume] : []
          content {
            name = volume.value
            empty_dir {}
          }
        }

      }
    }
  }
}
