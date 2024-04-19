# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

project_state_bucket = "TF_BUCKET_NAME"
host_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"

# ------------------------------------------------------------------------------
# cloud_function tfvars
# ------------------------------------------------------------------------------

function_name                 = "master-PREFIX_NAME-cloud-function"
region                        = "REGION_NAME"
function_description          = "HTTPS Cloud Function for symbol_trigger"
runtime                       = "nodejs18"
entrypoint                    = "performAction"
bucket_name                   = "PREFIX_NAME-cloud-function-us-ct1-storage"
object_name                   = "function-source.zip"
min_instance_count            = "1"
max_instance_count            = "10"
function_memory               = "512Mi"
function_timeout              = "540"
available_cpu                 = "1"
ingress_settings              = "ALLOW_INTERNAL_AND_GCLB"
service_account_email         = "PREFIX_NAME-cloudrun-sa@PREFIX_NAME-admin-host.iam.gserviceaccount.com"
authentication                = "allAuthenticatedUsers"
role                          = "roles/cloudfunctions.invoker"