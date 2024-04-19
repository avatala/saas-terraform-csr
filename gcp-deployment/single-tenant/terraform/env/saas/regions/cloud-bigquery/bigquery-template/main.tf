# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


/******************************************
  Details of Cloud Bigquery Dataset
 *****************************************/

data "terraform_remote_state" "service_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.service_project_prefix_path
 }
}


module "saas_bigquery_dataset" {
  source                     = "../../../../modules/terraform-google-bigquery/"
  for_each                   = var.saas_bigquery_dataset
  project_id                 = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  dataset_id                 = each.value.dataset_id
  description                = each.value.description
  location                   = each.value.location
  delete_contents_on_destroy = each.value.delete_contents_on_destroy
  dataset_labels             = each.value.dataset_labels
  encryption_key             = each.value.encryption_key
}
