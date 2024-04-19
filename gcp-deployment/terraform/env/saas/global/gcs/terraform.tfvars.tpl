# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

project_state_bucket = "TF_BUCKET_NAME"
host_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"


#region     = "REGION_NAME"
gcs_buckets = [
  {
    name             = "PREFIX_NAME-prod-data-us-ct1-02-gcs-test"
    kms_key_path       = "KMS_KEY"
    retention_policy = null
    lifecycle_rule = { action = { type = "Delete", storage_class = "" }
    condition = { age = 90, created_before = "", with_state = "ANY", matches_storage_class = [], num_newer_versions = null, custom_time_before = "", days_since_custom_time = null, days_since_noncurrent_time = null, noncurrent_time_before = "" } }
    versioning = true
    public_access_prevention = "enforced"
  },
  {
    name             = "PREFIX_NAME-terraform-state-us-ct1-02-gcs-test"
    kms_key_path       = "KMS_KEY"
    retention_policy = null
    lifecycle_rule = { action = { type = "Delete", storage_class = "" }
    condition = { age = 90, created_before = "", with_state = "ANY", matches_storage_class = [], num_newer_versions = null, custom_time_before = "", days_since_custom_time = null, days_since_noncurrent_time = null, noncurrent_time_before = "" } }
    versioning = true
    public_access_prevention = "enforced"
  },
  {
    name             = "PREFIX_NAME-cdn-us-ct1-storage"
    kms_key_path       = "KMS_KEY"
    retention_policy = null
    lifecycle_rule = { action = { type = "Delete", storage_class = "" }
    condition = { age = 90, created_before = "", with_state = "ANY", matches_storage_class = [], num_newer_versions = null, custom_time_before = "", days_since_custom_time = null, days_since_noncurrent_time = null, noncurrent_time_before = "" } }
    versioning = true
    public_access_prevention = "enforced"
  },
  {
    name             = "PREFIX_NAME-config-us-ct1-storage"
    kms_key_path       = "KMS_KEY"
    retention_policy = null
    lifecycle_rule = { action = { type = "Delete", storage_class = "" }
    condition = { age = 90, created_before = "", with_state = "ANY", matches_storage_class = [], num_newer_versions = null, custom_time_before = "", days_since_custom_time = null, days_since_noncurrent_time = null, noncurrent_time_before = "" } }
    versioning = true
    public_access_prevention = "enforced"
  },
  {
    name             = "PREFIX_NAME-onboarding-bucket"
    kms_key_path       = "KMS_KEY"
    retention_policy = null
    lifecycle_rule = { action = { type = "Delete", storage_class = "" }
    condition = { age = 90, created_before = "", with_state = "ANY", matches_storage_class = [], num_newer_versions = null, custom_time_before = "", days_since_custom_time = null, days_since_noncurrent_time = null, noncurrent_time_before = "" } }
    versioning = true
    public_access_prevention = "enforced"
  },
  {
    name             = "PREFIX_NAME-offboarding-bucket"
    kms_key_path       = "KMS_KEY"
    retention_policy = null
    lifecycle_rule = { action = { type = "Delete", storage_class = "" }
    condition = { age = 90, created_before = "", with_state = "ANY", matches_storage_class = [], num_newer_versions = null, custom_time_before = "", days_since_custom_time = null, days_since_noncurrent_time = null, noncurrent_time_before = "" } }
    versioning = true
    public_access_prevention = "enforced"
  },
  {
    name             = "PREFIX_NAME-rolling-update-bucket"
    kms_key_path       = "KMS_KEY"
    retention_policy = null
    lifecycle_rule = { action = { type = "Delete", storage_class = "" }
    condition = { age = 90, created_before = "", with_state = "ANY", matches_storage_class = [], num_newer_versions = null, custom_time_before = "", days_since_custom_time = null, days_since_noncurrent_time = null, noncurrent_time_before = "" } }
    versioning = true
    public_access_prevention = "enforced"
  },
  {
    name             = "PREFIX_NAME-tcp-config-us-ct1-storage"
    kms_key_path       = "KMS_KEY"
    retention_policy = null
    lifecycle_rule = { action = { type = "Delete", storage_class = "" }
    condition = { age = 90, created_before = "", with_state = "ANY", matches_storage_class = [], num_newer_versions = null, custom_time_before = "", days_since_custom_time = null, days_since_noncurrent_time = null, noncurrent_time_before = "" } }
    versioning = false
    public_access_prevention = "enforced"
  },
  {
    name             = "PREFIX_NAME-cloud-function-us-ct1-storage"
    kms_key_path       = "KMS_KEY"
    retention_policy = null
    lifecycle_rule = { action = { type = "Delete", storage_class = "" }
    condition = { age = 90, created_before = "", with_state = "ANY", matches_storage_class = [], num_newer_versions = null, custom_time_before = "", days_since_custom_time = null, days_since_noncurrent_time = null, noncurrent_time_before = "" } }
    versioning = false
    public_access_prevention = "enforced"
  }
]





