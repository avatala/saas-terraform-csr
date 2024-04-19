# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

terraform {
  required_version = ">= 0.13"
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 3.53"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 3.53"
    }
  }

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-sql-db:private_service_access/v8.0.0"
  }

  provider_meta "google-beta" {
    module_name = "blueprints/terraform/terraform-google-sql-db:private_service_access/v8.0.0"
  }

}
