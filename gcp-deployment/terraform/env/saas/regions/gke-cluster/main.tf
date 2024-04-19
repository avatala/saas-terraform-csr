# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  GKE Cluster Details
*****************************************/

module "main_vpc_gke_private_clusters" {
  source                       = "../../../modules/terraform-google-kubernetes-engine/beta-private-cluster"
  for_each                     = var.main_vpc_gke_private_clusters
  network_project_id           = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  project_id                   = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_id"]
  name                         = each.value.name
  resource_usage_export_dataset_id = data.terraform_remote_state.bigquery_dataset.outputs.output_bigquery_dataset["dataset_id"]
  region                       = each.value.region
  network                      = data.terraform_remote_state.vpc_network.outputs.anthos_hub_vpc.anthos_hub_vpc_01["network_name"]
  subnetwork                   = each.value.subnetwork
  ip_range_pods                = each.value.ip_range_pods
  ip_range_services            = each.value.ip_range_services
  create_service_account       = each.value.create_service_account
  regional                     = each.value.regional
  http_load_balancing          = each.value.http_load_balancing
  network_policy               = each.value.network_policy
  gce_pd_csi_driver            = each.value.gce_pd_csi_driver
  horizontal_pod_autoscaling   = each.value.horizontal_pod_autoscaling
  enable_private_endpoint      = each.value.enable_private_endpoint
  enable_private_nodes         = each.value.enable_private_nodes
  master_ipv4_cidr_block       = each.value.master_ipv4_cidr_block
  remove_default_node_pool     = each.value.remove_default_node_pool
  maintenance_recurrence       = each.value.maintenance_recurrence
  maintenance_start_time       = each.value.maintenance_start_time
  maintenance_end_time         = each.value.maintenance_end_time
  release_channel              = each.value.release_channel
  cluster_resource_labels      = merge(
    each.value.cluster_resource_labels,
    tomap(
      { 
        "mesh_id" = "proj-${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_number"]}"
      }
    )
  )
  enable_binary_authorization  = each.value.enable_binary_authorization
  master_global_access_enabled = each.value.master_global_access_enabled
  master_authorized_networks   = each.value.master_authorized_networks
  node_pools                   = each.value.node_pools
  node_pools_labels            = each.value.node_pools_labels
  //node_pools_taints            = each.value.node_pools_taints
  datapath_provider            = each.value.datapath_provider
}
