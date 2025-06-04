variable "container_name" {
  description = "Name des Containers"
  type        = string
  default     = "my-flex-nginx-container"
}

variable "external_port" {
  description = "Externer Port, unter dem der Container erreichbar ist"
  type        = number
}

variable "nginx_html_content" {
  description = "HTML-Inhalt für die index.html im Container"
  type        = string
  default     = "<h1>Hello from Terraform!</h1><p>Container: my-flex-nginx-container</p>"
}
