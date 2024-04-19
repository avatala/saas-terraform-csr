# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

terraform {
  backend "gcs" {
    bucket = "TF_BUCKET_NAME"             # TERRAFORM STATE FILES STORE IN THIS BUCKET
    prefix = "gcp-deployment/terraform/env/PREFIX_NAME/global/cloud-dns/private-dns" # STATE FILES STORED IN THIS PATH UNDER THE BUCKET SPECIFIED ABOVE
  }
}
