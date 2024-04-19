# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

host_project_state_bucket    = "${TF_STATE_BUCKET_NAME}"
host_project_prefix_path     = "gcp-deployment/terraform/env/${PREFIX}/resource-hierarchy/projects/host-projects"
mig_state_bucket             = "${TF_STATE_BUCKET_NAME}"
mig_prefix_path              = "gcp-deployment/terraform/env/single-tenant/regions/${_CUSTOMER_NAME}-mig"
cloud_armor_state_bucket     = "${TF_STATE_BUCKET_NAME}"
cloud_armor_prefix_path      = "gcp-deployment/terraform/env/${PREFIX}/global/cloud-armor/security-policy"


lb = {

  /** GLOBAL configuration **/
  region ="${_CUSTOMER_REGION}"
  
  /** Prefix-name used for lb proxy and forwarding rule **/
  name = "${_CUSTOMER_NAME}-lb"

  /** IAP Configuration **/
  iap_oauth2_client_id = ""
  iap_oauth2_client_secret = ""

  /** HealthCheck configuration **/
  hc_request_path = "/health"
  hc_port ="80"
  
}

tenant_name = "${_CUSTOMER_NAME}-tenant"

client_id = "${FIREBASE_CLIENT_ID}"

client_secret = "${FIREBASE_CLIENT_SECRET}"

user_managed_replication = {
    secret-kms-1 = [
      {
        location     = "${_CUSTOMER_REGION}"
        kms_key_name = "${_KMS_KEY_PATH}"
      },
    ]
}