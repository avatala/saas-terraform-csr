# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

project_state_bucket = "TF_BUCKET_NAME"
service_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/service-projects"

gke_state_bucket = "TF_BUCKET_NAME"
gke_prefix_path = "gcp-deployment/terraform/env/PREFIX_NAME/regions/gke-cluster"

service_account_state_bucket = "TF_BUCKET_NAME"
service_account_prefix_path = "gcp-deployment/terraform/env/PREFIX_NAME/global/iam/service-accounts"

network_state_bucket = "TF_BUCKET_NAME"
network_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/global/networking/vpc"

host_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"

/* GLOBAL */
region     = "REGION_NAME"
channel    = "" #Anthos CPR channel version

/*ACM */
sync_repo   = "https://source.developers.google.com/p/TEMP_SEED_PROJECT_ID/r/APP_REPO_NAME"
sync_branch = "_TERRAFORM_CODE_BRANCH_NAME"
policy_dir  = "/multi-tenant/"
secret_type = "gcpserviceaccount"
source_format = "hierarchy"
# gcp_service_account_email = "PREFIX_NAME-anthos-acm-sa@PREFIX_NAME-freemium-prj.iam.gserviceaccount.com"
