# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
module "freemium_certificate_manager_map" {
  source              = "../../../modules/terraform-google-certificate-map-modules/"
  project_id          = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  cert_map_name       = var.freemium_certificate_manager_map["cert_map_name"]
  cert_map_labels     = var.freemium_certificate_manager_map["cert_map_labels"]
  cert_map_name_entry = var.freemium_certificate_manager_map["cert_map_name_entry"]
  certificates        = [data.terraform_remote_state.certificates.outputs.certificates.certificate_manager_01["certificates"]]
}

module "enterprise_certificate_manager_map" {
  source              = "../../../modules/terraform-google-certificate-map-modules/"
  project_id          = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  cert_map_name       = var.enterprise_certificate_manager_map["cert_map_name"]
  cert_map_labels     = var.enterprise_certificate_manager_map["cert_map_labels"]
  cert_map_name_entry = var.enterprise_certificate_manager_map["cert_map_name_entry"]
  certificates        = [data.terraform_remote_state.certificates.outputs.certificates.certificate_manager_02["certificates"]]
}