# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Terraform remote state
 *****************************************/

project_state_bucket = "TF_BUCKET_NAME"
service_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/service-projects"

dataset_state_bucket = "TF_BUCKET_NAME"
dataset_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/regions/cloud-bigquery/bigquery"
