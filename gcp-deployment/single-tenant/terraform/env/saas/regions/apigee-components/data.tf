data "google_service_account_access_token" "default" {
  provider               = google
  target_service_account = "saas-cloudbuild-sa@${_TEMP_SEED_PROJECT_ID}.iam.gserviceaccount.com"
  scopes                 = ["cloud-platform"]
}

data "terraform_remote_state" "host_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.host_project_prefix_path
 }
}