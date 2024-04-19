# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

project_state_bucket = "TF_BUCKET_NAME"
host_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"

network_state_bucket ="TF_BUCKET_NAME"
network_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/global/networking/vpc"


vpc_connectors = [{
  region        = "REGION_NAME"
  name          = "PREFIX_NAME-vpc-connect"
  ip_cidr_range = "10.160.0.0/28"
  machine_type  = "f1-micro"
  min_instances = 2
  max_instances = 3
}]
