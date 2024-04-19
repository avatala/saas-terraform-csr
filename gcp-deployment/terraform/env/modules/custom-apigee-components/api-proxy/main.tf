resource "apigee_proxy" "api_proxy" {
  name = var.name
  bundle = var.bundle
  bundle_hash = filebase64sha256("${var.bundle}")
}
resource "apigee_proxy_deployment" "example" {
  proxy_name = var.name
  environment_name = var.env_name
  revision = apigee_proxy.api_proxy.revision
}
