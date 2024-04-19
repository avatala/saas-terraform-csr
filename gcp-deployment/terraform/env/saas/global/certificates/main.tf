# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
module "certificate_manager" {
  source       = "../../../modules/terraform-google-certificate-manager-module/"
  for_each     = var.certificate_manager
  project_id   = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  dnsauth_name = each.value.dnsauth_name
  domain       = each.value.domain
  managed_zone = each.value.managed_zone
  cert_name    = each.value.cert_name
  cert_domain  = each.value.cert_domain
}
