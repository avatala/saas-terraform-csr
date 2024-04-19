# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
/*****************************************
Backend setup commands
******************************************/

locals {
  
  host_project_id     = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
}



resource "null_resource" "setup" {


  provisioner "local-exec" {
    environment = {
       _CUSTOMER_NAME = "${_CUSTOMER_NAME}"
       host_project_id = local.host_project_id
       _ENTERPRISE_SUB_DOMAIN = "${ENTERPRISE_SUB_DOMAIN}"
       _PREFIX                = "${PREFIX}"
   }
    when    = create
    command = "bash backend-setup.sh"
  }
  depends_on = [
    module.backend
  ]
}