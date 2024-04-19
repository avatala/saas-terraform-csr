# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
 Standalone Project Creation
*****************************************/


module "standalone_projects" {
  source                         = "../../../modules/terraform-google-project-factory/fabric-project-folder"
  for_each                       = var.standalone_projects
  name                           = each.value.project_name
  prefix                         = each.value.prefix
  parent                         = each.value.folder_id
  billing_account                = each.value.billing_account
  activate_apis                  = each.value.activate_apis
  default_logging_retention_days = each.value.default_logging_retention_days
  labels                         = each.value.labels
}
