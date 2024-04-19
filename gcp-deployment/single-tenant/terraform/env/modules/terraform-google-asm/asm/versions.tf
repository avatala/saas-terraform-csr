# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


terraform {
  required_version = ">= 0.14.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-kubernetes-engine:asm/v24.0.0"
  }

  provider_meta "google-beta" {
    module_name = "blueprints/terraform/terraform-google-kubernetes-engine:asm/v24.0.0"
  }
}
