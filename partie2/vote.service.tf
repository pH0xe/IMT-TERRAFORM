module "vote_service" {
  source = "./modules/k8s-services/"
  
  metadata_name = "vote"
  label_app = "vote"
  port_name = "vote-service"
  port = 5000
  target_port = 80
  node_port = 31000
}
