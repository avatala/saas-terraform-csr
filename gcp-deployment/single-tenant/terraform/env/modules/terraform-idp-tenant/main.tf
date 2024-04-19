resource "google_identity_platform_tenant" "tenant" {
  project               = var.project_id
  display_name          = var.tenant_name
  allow_password_signup = true
}