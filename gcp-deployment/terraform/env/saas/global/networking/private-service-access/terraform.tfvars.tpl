# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
Private Service Access Details
*****************************************/

project_state_bucket = "TF_BUCKET_NAME"
host_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"

network_state_bucket ="TF_BUCKET_NAME"
network_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/global/networking/vpc"

main_vpc_private_service_access = {
  main_vpc_private_service_access_01 = {
    name                  = "PREFIX_NAME-prod-main-vpc-psa"
    address               = "10.10.0.0"
    prefix_length         = 16
    labels = {
      environment = "prod",
      createdby   = "terraform"
    }
    reserved_peering_ranges = ["PREFIX_NAME-prod-main-vpc-psa"]
  }
}