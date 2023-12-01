module "vote_service" {
  source = "./modules/services/"

  metadata_labels_app = "vote"
  metadata_name       = "vote"

  service_type = "NodePort"

  port_name    = "vote-service"
  service_port = 5000
  target_port  = 80
  node_port    = 31000

  selector_app = "vote"
}

module "result_service" {
  source = "./modules/services"

  metadata_labels_app = "result"
  metadata_name       = "result"

  service_type = "NodePort"

  port_name    = "result-service"
  service_port = 5001
  target_port  = 80
  node_port    = 31001

  selector_app = "result"
}

module "redis_service" {
  source = "./modules/services"

  metadata_labels_app = "redis"
  metadata_name       = "redis"

  service_type = "ClusterIP"

  port_name    = "redis-service"
  service_port = 6379
  target_port  = 6379

  selector_app = "redis"
}

module "db_service" {
  source = "./modules/services"

  metadata_labels_app = "db"
  metadata_name       = "db"

  service_type = "ClusterIP"

  port_name    = "db-service"
  service_port = 5432
  target_port  = 5432

  selector_app = "db"
}
