# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
Terraform remote state
*****************************************/

project_state_bucket      = "${TF_STATE_BUCKET_NAME}"

host_project_prefix_path  = "gcp-deployment/terraform/env/${PREFIX}/resource-hierarchy/projects/host-projects"

network_state_bucket      = "${TF_STATE_BUCKET_NAME}"

network_prefix_path       = "gcp-deployment/terraform/env/${PREFIX}/global/networking/vpc"
region                    = "${_CUSTOMER_REGION}"

/******************************************
  Subnet Details
*****************************************/

subnets = {
  subnet_01 = {
    subnets = [
      {
        subnet_name           = "${_CUSTOMER_NAME}-saas-tenant-gke-us-ct1-subnet"
        subnet_ip             = "${_SUBNET_IP}"
        subnet_region         = "${_CUSTOMER_REGION}"
        subnet_private_access = true
        subnet_flow_logs      = false
        description           = "This is the primary subnet for us-central1 region."
      }
    ]
    secondary_ranges = {
      "${_CUSTOMER_NAME}-saas-tenant-gke-us-ct1-subnet" = [
        {
        range_name    = "${_CUSTOMER_NAME}-saas-tenant-gke-us-ct1-subnet-pod"
        ip_cidr_range = "${_POD_RANGE}"
      },

      {
        range_name    = "${_CUSTOMER_NAME}-saas-tenant-gke-us-ct1-subnet-svc"
        ip_cidr_range = "${_SVC_RANGE}"
      }

      ]
    }
  }
}
