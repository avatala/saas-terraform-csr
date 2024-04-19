# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

host_project_state_bucket    = "TF_BUCKET_NAME"
host_project_prefix_path   = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"
mig_state_bucket          = "TF_BUCKET_NAME"
mig_prefix_path            = "gcp-deployment/terraform/env/PREFIX_NAME/regions/tcp-mig"
map_cert_state_bucket     = "TF_BUCKET_NAME"
map_cert_prefix_path       = "gcp-deployment/terraform/env/PREFIX_NAME/global/certificate-map"

lb = {
  freemium_static_ip ="PREFIX_NAME-freemium-ip"
  enterprise_static_ip ="PREFIX_NAME-enterprise-ip"
  name = "PREFIX_NAME-lb" 
  hc_port = "80"
  application_port = "APP_PORT"
}