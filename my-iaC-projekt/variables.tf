variable "nginx_image" {
  type    = string
  default = "nginx:alpine"
}

variable "app_image" {
  type    = string
  default = "hello-world"
}

variable "container_ports" {
  type    = list(number)
  default = [8080, 8081]
}

variable "enable_logging" {
  type    = bool
  default = true
}

variable "container_names" {
  type = map(string)
  default = {
    nginx = "nginx_container"
    app   = "app_container"
  }
}
