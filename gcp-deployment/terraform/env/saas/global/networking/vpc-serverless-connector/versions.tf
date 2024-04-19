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
      version = ">= 3.62"
    }
    google-beta = {
      version = ">= 3.62"
    }
    null = {
      version = ">= 2.1.0"
    }
  }
}