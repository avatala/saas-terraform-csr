# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

terraform {
  required_version = ">= 0.13"
  required_providers {

    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-bigquery:scheduled_queries/v5.4.2"
  }
}
