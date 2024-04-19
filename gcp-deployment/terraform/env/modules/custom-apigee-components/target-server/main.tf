resource "apigee_target_server" "example" {
  environment_name = var.env_name
  name = var.name
  host = var.target_host
  port = var.port
  is_enabled = var.enable_server
  ssl_enabled = var.ssl_enabled
}