# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


project_state_bucket = "TF_BUCKET_NAME"
host_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"

network_state_bucket = "TF_BUCKET_NAME"
network_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/global/networking/vpc"

/******************************************
  Private DNS Zone Details
*****************************************/

dns_private_zones = {
  dns_private_zone_01 = {
    name        = "PREFIX_NAME-enterprise-private-zone"
    description = "This zone is used for private records."
    //domain      = ""
    domain = "FULL_ENTERPRISE_SUB_DOMAIN."
    labels = {
      organization = "saas",
      createdby    = "terraform",
      zone         = "private"
    }
    recordsets = []
  }
  dns_private_zone_02 = {
    name        = "PREFIX_NAME-freemium-private-zone"
    description = "This zone is used for private records."
    domain      = "FULL_FREEMIUM_SUB_DOMAIN."
    labels = {
      organization = "saas",
      createdby    = "terraform",
      zone         = "private"
    }
    recordsets = []
  }
}

