# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

project_state_bucket        = "${_TF_STATE_BUCKET_NAME}"
host_project_prefix_path    = "gcp-deployment/terraform/env/${_PREFIX}/resource-hierarchy/projects/host-projects"

apigee_devs = {
${_PREFIX}-dev = {
    email = "${_CUSTOMER_EMAIL}"
    first_name = "${_CUSTOMER_NAME}"
    last_name = "user"
    username = "${_CUSTOMER_EMAIL}"
}
}

apigee_dev_apps = {
${_CUSTOMER_NAME}-app = {
callback_url = "https://apigee-saas.${_PREFIX}.${ADMIN_DOMAIN}/oauth/coderesponse"
}
}

