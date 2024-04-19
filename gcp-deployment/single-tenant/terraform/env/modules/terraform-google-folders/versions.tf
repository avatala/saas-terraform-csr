# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

terraform {
  required_version = ">= 0.13.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.45, < 4.2.1"
    }
  }
  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-folders/v3.0.0"
  }
}