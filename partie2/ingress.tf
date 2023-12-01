module "vote-ingress" {
  source        = "./modules/ingress"
  metadata_name = "vote-ingress"
  service_name  = "vote"
  service_port  = 5000
}

module "result-ingress" {
  source        = "./modules/ingress"
  metadata_name = "result-ingress"
  service_name  = "result"
  service_port  = 5001
}
