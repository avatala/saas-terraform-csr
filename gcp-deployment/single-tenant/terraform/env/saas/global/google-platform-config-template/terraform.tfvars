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
host_project_prefix_path     = "gcp-deployment/terraform/env/${PREFIX}/resource-hierarchy/projects/host-projects"
tenant_id_prefix_path        = "gcp-deployment/terraform/env/single-tenant/global/networking/${_CUSTOMER_NAME}-backend"
client_id = "${FIREBASE_CLIENT_ID}"

client_secret = "${FIREBASE_CLIENT_SECRET}"
