# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

terraform {
  required_version = ">= 0.13.0"

  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 3.0"
    }
  }

  provider_meta "google-beta" {
    module_name = "blueprints/terraform/terraform-google-network:routes-beta/v5.1.0"
  }
}
