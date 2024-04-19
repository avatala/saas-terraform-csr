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
service_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/service-projects"

host_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"

network_state_bucket = "TF_BUCKET_NAME"
network_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/global/networking/vpc"

vpn_state_bucket="TF_BUCKET_NAME"
vpn_prefix_path="gcp-deployment/terraform/env/PREFIX_NAME/global/networking/cloudvpn"

gke_state_bucket="TF_BUCKET_NAME"
gke_prefix_path="gcp-deployment/terraform/env/PREFIX_NAME/regions/gke-cluster"

region = "REGION_NAME"

cloud_build_worker_pool = {
    cloud_build_worker_pool_01 = {
        pool_name               = "PREFIX_NAME-private-worker-pool"
        disk_size_gb            = "100"
        machine_type            = "e2-standard-4"
        no_external_ip_bool     = false
    }
}