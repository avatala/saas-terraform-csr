# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
Terraform remote state
*****************************************/

project_state_bucket     = "${TF_STATE_BUCKET_NAME}"
host_project_prefix_path = "gcp-deployment/terraform/env/${PREFIX}/resource-hierarchy/projects/host-projects"
tenant_folder_prefix_path = "gcp-deployment/terraform/env/single-tenant/resource-hierarchy/folders/${_CUSTOMER_NAME}-service-folders"
/******************************************
Oraganization details
*****************************************/

org_id               = "${_ORG_ID}"
billing_id           = "${BILLING_ID}"
default_network_tier = "PREMIUM"