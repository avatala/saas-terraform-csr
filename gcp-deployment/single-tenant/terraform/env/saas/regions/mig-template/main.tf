# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/**************************************
     Terraform code
*******************************************/

module "instance_template" {
  source     = "../../../modules/terraform-google-instance_template"
  name       = var.mig_template["name"]
  project_id = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  network    = data.terraform_remote_state.vpc_network.outputs.anthos_hub_vpc.anthos_hub_vpc_01.network_self_link

  subnetwork           = var.mig_template["subnetwork"]
  disk_encryption_key  = var.mig_template["disk_encryption_key"]
  machine_type         = var.mig_template["machine_type"]
  source_image_project = var.mig_template["source_image_project"]
  source_image_family  = var.mig_template["source_image_family"]
  source_image         = var.mig_template["source_image"]
  tags                 = var.mig_template["network_tags"]
  startup_script       = file("./scripts/nginx.sh")
  service_account = {
    email  = "${PREFIX}-mig-sa@${data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]}.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }

}

module "mig" {
  source              = "../../../modules/terraform-google-mig"
  mig_name            = var.mig_template["mig_name"]
  project_id          = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  region              = var.mig_template["region"]
  instance_template   = module.instance_template.self_link
  autoscaling_enabled = var.mig_template["autoscaling_enabled"]
  min_replicas        = var.mig_template["min_replicas"]
  max_replicas        = var.mig_template["max_replicas"]
  autoscaler_name     = var.mig_template["autoscaler_name"]
  health_check_name   = var.mig_template["health_check_name"]
  health_check        = var.mig_template["health_check"]
  named_ports         = var.mig_template["named_ports"]
}