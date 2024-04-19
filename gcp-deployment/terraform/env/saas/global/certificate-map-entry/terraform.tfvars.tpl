# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

project_state_bucket = "TF_BUCKET_NAME"
host_project_prefix_path   = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"
certificates_state_bucket = "TF_BUCKET_NAME"
certificates_prefix_path   = "gcp-deployment/terraform/env/PREFIX_NAME/global/certificates"

freemium_certificate_manager_map = {
  cert_map_name = "PREFIX_NAME-freemium-cert-map"
  cert_map_labels = {
                      "terraform" : true,
                      "acc-test" : true, 
                    }
  cert_map_name_entry = "PREFIX_NAME-freemium-cert-map-entry"
}

enterprise_certificate_manager_map = {
  cert_map_name = "PREFIX_NAME-enterprise-cert-map"
  cert_map_labels = {
                      "terraform" : true,
                      "acc-test" : true, 
                    }
  cert_map_name_entry = "PREFIX_NAME-enterprise-cert-map-entry"
}