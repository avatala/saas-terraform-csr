# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

# ------------------------------------------------------------------------------
# GCS Bucket configuration for Terraform State management
# ------------------------------------------------------------------------------

terraform {
  backend "gcs" {
    bucket = "TF_BUCKET_NAME"
    prefix = "gcp-deployment/terraform/env/PREFIX_NAME/global/initial-cloud-build"
  }
}
