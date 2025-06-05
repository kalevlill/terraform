output "nginx_container_id" {
  value = module.nginx.container_id
}

output "app_container_endpoint" {
  value = "http://localhost:${var.container_ports[1]}"
}
