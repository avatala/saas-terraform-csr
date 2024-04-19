# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
project_state_bucket         = "${TF_STATE_BUCKET_NAME}"

service_project_prefix_path  = "gcp-deployment/terraform/env/single-tenant/resource-hierarchy/projects/${_CUSTOMER_NAME}-service-projects"

anthos_project_prefix_path  = "gcp-deployment/terraform/env/${PREFIX}/resource-hierarchy/projects/service-projects"

gke_state_bucket             = "${TF_STATE_BUCKET_NAME}"

gke_prefix_path              = "gcp-deployment/terraform/env/single-tenant/regions/${_CUSTOMER_NAME}-gke-cluster"

service_account_state_bucket = "${TF_STATE_BUCKET_NAME}"

service_account_prefix_path = "gcp-deployment/terraform/env/${PREFIX}/global/iam/service-accounts"

/* GLOBAL */
region     = "${_CUSTOMER_REGION}"
channel    = "" #Anthos CPR channel version

/*ACM */
sync_repo   = "https://source.developers.google.com/p/${SEED_PROJECT_ID}/r/${CSR_APP_REPO_NAME}"
sync_branch = "${_CUSTOMER_NAME}"
policy_dir  = "/${_CUSTOMER_NAME}/"
secret_type = "gcpserviceaccount"
source_format = "hierarchy"
