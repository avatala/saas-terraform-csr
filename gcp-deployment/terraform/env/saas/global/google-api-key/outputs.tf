output "google_api_key" {
  value     = module.google_api_key.api_key
  sensitive = true
}