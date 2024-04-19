# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
module "acm" {
  source                    = "../../../modules/terraform-google-acm"
  hub_project_id            = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  cluster_name              = data.terraform_remote_state.gke_cluster.outputs.main_vpc_gke_private_clusters.main_vpc_gke_private_cluster_01.name
  sync_repo                 = var.sync_repo
  sync_branch               = var.sync_branch
  enable_feature_acm        = true # if you are enable this feature for the first time make it true else false
  policy_dir                = var.policy_dir
  secret_type               = var.secret_type
  source_format             = var.source_format
  depends_on                = [null_resource.asm_setup]
  gcp_service_account_email = data.terraform_remote_state.service_account.outputs.service_accounts_acm["email"]
}

  resource "null_resource" "sleep" {
    
    provisioner "local-exec" {
      when    = create
      command = "sleep 300"
    }
    depends_on = [
      module.acm
    ]
  }