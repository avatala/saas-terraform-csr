# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

project_state_bucket = "TF_BUCKET_NAME"
host_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"

/******************************************
  Public DNS Zone Details
*****************************************/

dns_public_zones = {
  dns_public_zone_01 = {
    name        = "PREFIX_NAME-enterprise-public-zone"
    description = "This zone is used for public records."
    domain      = "FULL_ENTERPRISE_SUB_DOMAIN."
    labels = {
      organization = "saas",
      createdby    = "terraform",
      zone         = "public"
    }
  }
  dns_public_zone_02 = {
    name        = "PREFIX_NAME-freemium-public-zone"
    description = "This zone is used for public records."
    domain      = "FULL_FREEMIUM_SUB_DOMAIN."
    labels = {
      organization = "saas",
      createdby    = "terraform",
      zone         = "public"
    }
  }
  dns_public_zone_03 = {
    name        = "PREFIX_NAME-public-zone"
    description = "This zone is used for public records."
    domain      = "CUSTOMER_DOMAIN.PREFIX_NAME.FULL_ADMIN_DOMAIN."
    labels = {
      organization = "saas",
      createdby    = "terraform",
      zone         = "public"
    }
  }
}
