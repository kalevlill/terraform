module "nginx" {
  source = "./modules/container_service"

  providers = {
    docker = docker
  }

  image           = var.nginx_image
  container_name  = var.container_names["nginx"]
  internal_port   = 80
  external_port   = var.container_ports[0]
  network_name    = docker_network.app_net.name
}

module "app" {
  source = "./modules/container_service"

  providers = {
    docker = docker
  }

  image           = var.app_image
  container_name  = var.container_names["app"]
  internal_port   = 80
  external_port   = var.container_ports[1]
  network_name    = docker_network.app_net.name
}

resource "docker_network" "app_net" {
  name = local.network_name
}
