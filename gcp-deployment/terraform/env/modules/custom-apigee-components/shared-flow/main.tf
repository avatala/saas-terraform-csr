resource "apigee_shared_flow" "shared_flow" {
  name = var.name
  bundle = var.bundle
  bundle_hash = filebase64sha256("${var.bundle}")
}
resource "apigee_shared_flow_deployment" "example" {
  shared_flow_name = var.name
  environment_name = var.env_name
  revision = apigee_shared_flow.shared_flow.revision
}

