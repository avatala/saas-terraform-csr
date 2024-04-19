# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

data "terraform_remote_state" "host_project_id" {
 backend = "gcs"
 config = {
   bucket = var.project_state_bucket
   prefix = var.host_project_prefix_path
 }
}

/******************************************
	GCS Bucket configuration
 *****************************************/

module "gcs" {
  source                   = "../../../modules/cloud-storage"
  project_id               = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  location                 = "REGION_NAME"
  count                    = length(var.gcs_buckets)
  name                     = var.gcs_buckets[count.index].name
  retention_policy         = var.gcs_buckets[count.index].retention_policy
  kms_key_path             = var.gcs_buckets[count.index].kms_key_path
  lifecycle_rule           = var.gcs_buckets[count.index].lifecycle_rule
  versioning               = var.gcs_buckets[count.index].versioning
  public_access_prevention = var.gcs_buckets[count.index].public_access_prevention
}

resource "google_storage_bucket_object" "default" {
  name       = "freemium/default.conf"
  source     = "./default.conf"
  bucket     = "PREFIX_NAME-config-us-ct1-storage"
  depends_on = [module.gcs]
}

resource "google_storage_bucket_object" "default_enterprise" {
  name       = "enterprise/default-enterprise.conf"
  source     = "./default-enterprise.conf"
  bucket     = "PREFIX_NAME-config-us-ct1-storage"
  depends_on = [module.gcs]
}

resource "google_storage_bucket_object" "tcp_bucket" {
  name       = "tcp.conf"
  source     = "./tcp.conf"
  bucket     = "PREFIX_NAME-tcp-config-us-ct1-storage"
  depends_on = [module.gcs]
}

resource "google_storage_bucket_object" "cloud_function" {
  name       = "function-source.zip"
  source     = "./function-source.zip"
  bucket     = "PREFIX_NAME-cloud-function-us-ct1-storage"
  depends_on = [module.gcs]
}