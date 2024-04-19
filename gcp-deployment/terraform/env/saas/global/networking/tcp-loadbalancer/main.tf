# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
# ------------------------------------------------------------------------------
# CREATE THE LOAD BALANCER
# ------------------------------------------------------------------------------
module "lb" {
  source                     = "../../../../modules/terraform-google-tcp-lb/"
  project                    = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  name                       = var.lb["name"]
  freemium_static_ip         = var.lb["freemium_static_ip"]
  enterprise_static_ip       = var.lb["enterprise_static_ip"]
  mig_id                     = data.terraform_remote_state.mig.outputs.mig_self_link
  hc_port                    = var.lb["hc_port"]
  application_port           = var.lb["application_port"]
}
