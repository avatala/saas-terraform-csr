data "terraform_remote_state" "tenant_folder_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.tenant_folder_prefix_path
 }
}