terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_container" "service" {
  name  = var.container_name
  image = var.image

  ports {
    internal = var.internal_port
    external = var.external_port
  }

  networks_advanced {
    name = var.network_name
  }
}
