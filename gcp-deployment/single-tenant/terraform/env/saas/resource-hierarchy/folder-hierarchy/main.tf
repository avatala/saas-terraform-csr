# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


/******************************************
 Service Folder Creation
*****************************************/

module "service_folders" {
  source                         = "../../../modules/terraform-google-folders/"
  for_each                       = var.service_folders
  parent                         = "${each.value.parent_type}/${each.value.parent_id}"
  names                          = each.value.names 
}