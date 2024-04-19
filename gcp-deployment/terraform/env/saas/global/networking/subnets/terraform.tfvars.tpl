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
host_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"
network_state_bucket = "TF_BUCKET_NAME"
network_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/global/networking/vpc"

/******************************************
  Subnet Details
*****************************************/

anthos_hub_subnets = {
  subnet_01 = {
    subnets = [
      {
        subnet_name           = "PREFIX_NAME-tenant-gke-us-ct1-subnet"
        subnet_ip             = "10.128.0.0/24"
        subnet_region         = "REGION_NAME"
        subnet_private_access = true
        subnet_flow_logs      = false
        description           = "This is the primary subnet for REGION_NAME region."
      }
    ]
    secondary_ranges = {
      PREFIX_NAME-tenant-gke-us-ct1-subnet = [
        {
        range_name    = "PREFIX_NAME-tenant-gke-us-ct1-subnet-pod"
        ip_cidr_range = "10.129.0.0/16"
      },

      {
        range_name    = "PREFIX_NAME-tenant-gke-us-ct1-subnet-svc"
        ip_cidr_range = "10.130.0.0/16"
      }

      ]
    }
  },
}


apigee_admin_subnets  = {
subnet_02 = {
    subnets = [
      {
        subnet_name           = "PREFIX_NAME-tenant-pool-us-ct1-subnet"
        subnet_ip             = "10.131.0.0/24"
        subnet_region         = "REGION_NAME"
        subnet_private_access = true
        subnet_flow_logs      = false
        description           = "This is the primary subnet for REGION_NAME region."
      }
    ]
    secondary_ranges = {
      PREFIX_NAME-tenant-pool-us-ct1-subnet = [
        {
        range_name    = "PREFIX_NAME-tenant-pool-us-ct1-subnet-pod"
        ip_cidr_range = "10.132.0.0/16"
      },

      {
        range_name    = "PREFIX_NAME-tenant-pool-us-ct1-subnet-svc"
        ip_cidr_range = "10.133.0.0/16"
      }

      ]
    }
  }
}