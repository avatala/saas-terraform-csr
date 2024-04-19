# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
project_state_bucket = "${TF_STATE_BUCKET_NAME}"

host_project_prefix_path = "gcp-deployment/terraform/env/${PREFIX}/resource-hierarchy/projects/host-projects"

service_project_prefix_path = "gcp-deployment/terraform/env/single-tenant/resource-hierarchy/projects/${_CUSTOMER_NAME}-service-projects"

dns_state_bucket = "${TF_STATE_BUCKET_NAME}"

public_dns_prefix_path = "gcp-deployment/terraform/env/${PREFIX}/global/cloud-dns/public-dns"

lb_state_bucket  = "${TF_STATE_BUCKET_NAME}"
lb_prefix_path = "gcp-deployment/terraform/env/${PREFIX}/global/networking/tcp-lb"