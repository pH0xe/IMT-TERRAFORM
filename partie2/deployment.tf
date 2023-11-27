module "vote_deployment" {
  source = "./modules/deployment-vote-result"

  name = "vote"
  labels = {
    app = "vote"
  }
  replicas = 1
  match_labels = {
    app = "vote"
  }
  container_name      = "vote"
  container_image     = "dockersamples/examplevotingapp_vote"
  container_port      = 80
  container_port_name = "vote"
}

module "result_deployment" {
  source = "./modules/deployment-vote-result"

  name = "result"
  labels = {
    app = "result"
  }
  replicas = 1
  match_labels = {
    app = "result"
  }
  container_name      = "worker"
  container_image     = "dockersamples/examplevotingapp_result"
  container_port      = 80
  container_port_name = "result"

}
