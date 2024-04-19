# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


terraform {
  required_version = ">=0.13"

  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.10.0, < 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.10"
    }
  }
  provider_meta "google-beta" {
    module_name = "blueprints/terraform/terraform-google-kubernetes-engine:beta-private-cluster/v21.1.0"
  }
}
