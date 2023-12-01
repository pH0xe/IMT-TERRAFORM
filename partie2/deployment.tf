module "worker_deployment" {
  source = "./modules/deployment"

  metadata_labels_app = "worker"
  metadata_name       = "worker"

  replicas                     = 1
  selector_match_labels_app    = "worker"
  template_metadata_labels_app = "worker"

  container_image = "dockersamples/examplevotingapp_worker"
  container_name  = "worker"
}

module "db_deployment" {
  source = "./modules/deployment"

  metadata_labels_app = "db"
  metadata_name       = "db"

  replicas                  = 1
  selector_match_labels_app = "db"

  template_metadata_labels_app = "db"

  container_image = "postgres:15-alpine"
  container_name  = "postgres"
  container_env = [
    {
      name  = "POSTGRES_USER"
      value = "postgres"
    },
    {
      name  = "POSTGRES_PASSWORD"
      value = "postgres"
    }
  ]
  container_port = {
    container_port = 5432
    name           = "postgres"
  }
  volume_mount = {
    name       = "db-data"
    mount_path = "/var/lib/postgresql/data"
  }

  volume = "db-data"
}

module "redis_deployment" {
  source = "./modules/deployment"

  metadata_labels_app = "redis"
  metadata_name       = "redis"

  replicas                  = 1
  selector_match_labels_app = "redis"

  template_metadata_labels_app = "redis"

  container_image = "redis:alpine"
  container_name  = "redis"
  container_port = {
    container_port = 6379
    name           = "redis"
  }
  volume_mount = {
    name       = "redis-data"
    mount_path = "/data"
  }

  volume = "redis-data"
}

module "vote_deployment" {
  source = "./modules/deployment"

  metadata_labels_app = "vote"
  metadata_name       = "vote"

  replicas                  = 1
  selector_match_labels_app = "vote"

  template_metadata_labels_app = "vote"

  container_image = "dockersamples/examplevotingapp_vote"
  container_name  = "vote"
  container_port = {
    container_port = 80
    name           = "vote"
  }
}

module "result_deployment" {
  source = "./modules/deployment"

  metadata_labels_app = "result"
  metadata_name       = "result"

  replicas                  = 1
  selector_match_labels_app = "result"

  template_metadata_labels_app = "result"

  container_image = "dockersamples/examplevotingapp_result"
  container_name  = "result"
  container_port = {
    container_port = 80
    name           = "result"
  }

}
