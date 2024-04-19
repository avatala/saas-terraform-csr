# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

terraform {
  required_version = ">=0.13.0"
  required_providers {
    google = ">= 3.43, < 5.0"
  }
  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-vm:instance_template/v7.4.0"
  }
}
