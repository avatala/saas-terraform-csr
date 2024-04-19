# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
locals {
  service_project_local = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_id"]

  host_project_local = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]

  gke_cluster_name = data.terraform_remote_state.gke_cluster.outputs.main_vpc_gke_private_clusters.main_vpc_gke_private_cluster_01.name
  gke_cluster_advertisement_ranges = data.terraform_remote_state.gke_cluster.outputs.main_vpc_gke_private_clusters.main_vpc_gke_private_cluster_01["master_ipv4_cidr_block"] 
  
  main_vpc_name = data.terraform_remote_state.vpc_network.outputs.anthos_hub_vpc.anthos_hub_vpc_01["network_name"]
  pool_vpc_name = data.terraform_remote_state.vpc_network.outputs.apigee-admin-pool-vpc.apigee-admin-pool-vpc_01["network_name"]

  main_vpn_name = data.terraform_remote_state.vpn.outputs.router_name_gke
  pool_vpn_name = data.terraform_remote_state.vpn.outputs.router_name_pool

  tunnel_vpn_main_name = data.terraform_remote_state.vpn.outputs.tunnel_name_gke["remote-0"]
  tunnel_vpn_pool_name = data.terraform_remote_state.vpn.outputs.tunnel_name_pool["remote-0"]

  setup_cmds = <<-EOT
  export GKE_PEERING_NAME=$(gcloud container clusters describe ${local.gke_cluster_name} --region ${var.region} --project=${local.service_project_local} --format='value(privateClusterConfig.peeringName)') && gcloud compute networks peerings update $GKE_PEERING_NAME --network=${local.main_vpc_name} --export-custom-routes --no-export-subnet-routes-with-public-ip --project=${local.host_project_local} && gcloud compute networks peerings update servicenetworking-googleapis-com --network=${local.pool_vpc_name} --export-custom-routes --no-export-subnet-routes-with-public-ip --project=${local.host_project_local} && export IP=`gcloud compute addresses describe worker-pool-range --global --project=${local.host_project_local} | grep address:| awk '{print $2}'` &&gcloud compute routers update-bgp-peer 	${local.pool_vpn_name} --peer-name=${local.tunnel_vpn_pool_name} --region=${var.region} --advertisement-mode=CUSTOM --set-advertisement-ranges=$IP/24 --project=${local.host_project_local} && gcloud compute routers update-bgp-peer ${local.main_vpn_name} --peer-name=${local.tunnel_vpn_main_name} --region=${var.region} --advertisement-mode=CUSTOM --set-advertisement-ranges=${local.gke_cluster_advertisement_ranges} --project=${local.host_project_local} && gcloud container clusters update ${local.gke_cluster_name} --enable-master-authorized-networks --region ${var.region} --master-authorized-networks=$IP/24 --project=${local.service_project_local}
  EOT
}

/******************************************
Worker-pool configuration
 *****************************************/
module "cloud_build_worker_pool" {
  source                = "../../../modules/worker_pool"
  for_each              = var.cloud_build_worker_pool
  project_id            = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  region                = var.region
  network_project_id    = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  network               = data.terraform_remote_state.vpc_network.outputs.apigee-admin-pool-vpc.apigee-admin-pool-vpc_01.network["id"]
  pool_name             = each.value.pool_name
  disk_size_gb          = each.value.disk_size_gb
  machine_type          = each.value.machine_type
  no_external_ip_bool   = each.value.no_external_ip_bool
}

resource "null_resource" "setup" {
  triggers = merge({
    setup_cmds = local.setup_cmds
  })
 lifecycle {
    create_before_destroy = true
  }
  provisioner "local-exec" {
    when    = create
    command = self.triggers.setup_cmds
  }
 depends_on = [
   module.cloud_build_worker_pool
 ]
}