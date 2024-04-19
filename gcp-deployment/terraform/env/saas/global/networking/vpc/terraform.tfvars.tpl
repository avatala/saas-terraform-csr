# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Terraform remote state
 *****************************************/

project_state_bucket = "TF_BUCKET_NAME"

host_project_prefix_path = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"

project_name_prefix_path = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/service-projects"

anthos_hub_vpc = {
  anthos_hub_vpc_01 = {
    network_name = "PREFIX_NAME-main-vpc"
    routing_mode = "GLOBAL"
    description  = "main vpc of the Host project"
  }
}

apigee-admin-pool-vpc = {
  apigee-admin-pool-vpc_01 = {
    pool_network_name    = "PREFIX_NAME-pool-vpc"
    pool_routing_mode    = "GLOBAL"
    pool_vpc_description = "pool vpc of the Host project"
  }
}
