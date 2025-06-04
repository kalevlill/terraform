output "container_name_output" {
  description = "Der Name des erstellten Containers"
  value       = var.container_name
}

output "container_external_port" {
  description = "Der externe Port, unter dem der Container erreichbar ist"
  value       = var.external_port
}

output "html_content_used" {
  description = "Der HTML-Inhalt, der für die index.html im Container verwendet wurde"
  value       = var.nginx_html_content
}
