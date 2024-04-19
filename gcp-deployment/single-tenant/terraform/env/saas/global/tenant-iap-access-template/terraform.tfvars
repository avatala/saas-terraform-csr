# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
project_state_bucket        = "${TF_STATE_BUCKET_NAME}"

host_project_prefix_path    = "gcp-deployment/terraform/env/${PREFIX}/resource-hierarchy/projects/host-projects"

users                       = ["user:${_CUSTOMER_EMAIL}"]