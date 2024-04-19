resource "random_string" "api-key-suffix" {
  length           = 5
  special          = false
  numeric          = false
  upper            = false
}

resource "google_apikeys_key" "api-key" {
  name         = "infra-webhook-api-key-${random_string.api-key-suffix.id}"
  display_name = "Infra webhook API key"
  project      = var.project_id
  restrictions {
    api_targets {
      service = "cloudbuild.googleapis.com"
    }
  }
}