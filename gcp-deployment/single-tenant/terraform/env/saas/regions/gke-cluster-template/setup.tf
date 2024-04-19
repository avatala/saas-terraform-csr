# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
/*****************************************
Workerpool setup commands
******************************************/

locals {
  
  host_project_id     = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]

  service_project_id  = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]

  main_vpc_name       = data.terraform_remote_state.vpc_network.outputs.anthos_hub_vpc.anthos_hub_vpc_01["network_name"]

  pool_vpc_name       = data.terraform_remote_state.vpc_network.outputs.apigee-admin-pool-vpc.apigee-admin-pool-vpc_01["network_name"]

  main_vpn_name       = data.terraform_remote_state.vpn.outputs.router_name_gke

  tunnel_vpn_main_name = data.terraform_remote_state.vpn.outputs.tunnel_name_gke["remote-0"]
  
  setup_cmds = <<-EOT
    gcloud compute networks peerings update $(gcloud container clusters describe ${_CUSTOMER_NAME}-saas-tenant-cluster-us-ct1-01 --region ${_CUSTOMER_REGION} --project=${local.service_project_id} --format='value(privateClusterConfig.peeringName)') --network=${local.main_vpc_name} --export-custom-routes --no-export-subnet-routes-with-public-ip --project=${local.host_project_id} && gcloud compute routers update-bgp-peer ${local.main_vpn_name} --peer-name=${local.tunnel_vpn_main_name} --region=${_PRE_REQ_REGION} --add-advertisement-ranges=${_MASTER_IP} --project=${local.host_project_id} && gcloud container clusters update ${_CUSTOMER_NAME}-saas-tenant-cluster-us-ct1-01 --enable-master-authorized-networks --region ${_CUSTOMER_REGION} --master-authorized-networks=$(gcloud compute addresses describe worker-pool-range --global --project=${local.host_project_id} | grep address:| awk '{print $2}')/24 --project=${local.service_project_id}
  EOT
}


resource "null_resource" "setup" {
  triggers = merge({
    setup_cmds = local.setup_cmds
  })

  provisioner "local-exec" {
    when    = create
    command = self.triggers.setup_cmds
  }
  depends_on = [
    module.main_vpc_gke_private_clusters
  ]

}