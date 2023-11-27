terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.23.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
  credentials = file(var.credentials_file)
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate,
  )
}
