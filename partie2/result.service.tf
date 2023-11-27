module "result_service" {
  source = "./modules/k8s-services/"
  
  metadata_name = "result"
  label_app = "result"
  port_name = "result-service"
  port = 5001
  target_port = 80
  node_port = 31001
}
