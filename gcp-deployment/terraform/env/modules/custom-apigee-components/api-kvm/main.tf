resource "apigee_environment_kvm" "example" {
  environment_name = var.env_name
  name = var.name
  entry = var.entry
}
