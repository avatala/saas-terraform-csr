data "google_secret_manager_secret_version" "github_token" {
  project = var.project_id
  secret  = "GITHUB-TOKEN"
}

data "google_secret_manager_secret_version" "github_org" {
  project = var.project_id
  secret  = "GITHUB-ORG"
}

/******************************************
  Remote state for Api Key
 *****************************************/

data "terraform_remote_state" "api_key" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.api_key_prefix_path
 }
}

/******************************************
  Remote state for Secret manager
 *****************************************/

data "terraform_remote_state" "secret_manager" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.secrets_prefix_path
 }
}