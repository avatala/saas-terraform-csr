# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/* GLOBAL */
project_state_bucket = "TF_BUCKET_NAME"
host_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"
network_state_bucket = "TF_BUCKET_NAME"
network_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/global/networking/vpc"
region               = "REGION_NAME"
router_asn_gke       = 64518
router_asn_pool      = 64522
/* VPN Config */
vpn_name_gke       = "PREFIX_NAME-main-vpc-vpn-gateway"
vpn_name_pool      = "PREFIX_NAME-pool-vpc-vpn-gateway"
secret_key_phrase0 = "ivOQwN8Mnhmfc77Pinyma6uKFvK0e9i4" #change it