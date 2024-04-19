# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
Terraform remote state
*****************************************/

project_state_bucket         = "${TF_STATE_BUCKET_NAME}"

service_project_prefix_path  = "gcp-deployment/terraform/env/single-tenant/resource-hierarchy/projects/${_CUSTOMER_NAME}-service-projects"

host_project_prefix_path     = "gcp-deployment/terraform/env/${PREFIX}/resource-hierarchy/projects/host-projects"
anthos_project_prefix_path   = "gcp-deployment/terraform/env/${PREFIX}/resource-hierarchy/projects/service-projects"

users                       = ["user:${_VENDOR_EMAIL_ID}"]