# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
 
/******************************************
	Module for VPC Serverless Connector
 *****************************************/

module "serverless-connector" {
  source          = "../../../../modules/vpc-serverless-connector/"
  project_id      = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  vpc_connectors  = var.vpc_connectors
  network         = data.terraform_remote_state.vpc_network.outputs.anthos_hub_vpc.anthos_hub_vpc_01["network_name"]
}