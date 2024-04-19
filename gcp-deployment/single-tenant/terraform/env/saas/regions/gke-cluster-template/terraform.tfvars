# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
Terraform remote state
*****************************************/

project_state_bucket          = "${TF_STATE_BUCKET_NAME}"

service_project_prefix_path   = "gcp-deployment/terraform/env/single-tenant/resource-hierarchy/projects/${_CUSTOMER_NAME}-service-projects"

host_project_prefix_path      = "gcp-deployment/terraform/env/${PREFIX}/resource-hierarchy/projects/host-projects"

network_state_bucket          = "${TF_STATE_BUCKET_NAME}"

network_prefix_path           = "gcp-deployment/terraform/env/${PREFIX}/global/networking/vpc"

vpn_state_bucket              = "${TF_STATE_BUCKET_NAME}"

vpn_prefix_path               = "gcp-deployment/terraform/env/${PREFIX}/global/networking/cloudvpn"

/******************************************
  GKE Cluster Details
*****************************************/

main_vpc_gke_private_clusters = {
  main_vpc_gke_private_cluster_01 = {
    name                             = "${_CUSTOMER_NAME}-saas-tenant-cluster-us-ct1-01"
    region                           = "${_CUSTOMER_REGION}"
    subnetwork                       = "${_CUSTOMER_NAME}-saas-tenant-gke-us-ct1-subnet"
    ip_range_pods                    = "${_CUSTOMER_NAME}-saas-tenant-gke-us-ct1-subnet-pod"
    ip_range_services                = "${_CUSTOMER_NAME}-saas-tenant-gke-us-ct1-subnet-svc"
    create_service_account           = false
    regional                         = true
    http_load_balancing              = true
    network_policy                   = false
    gce_pd_csi_driver                = true
    horizontal_pod_autoscaling       = true
    enable_private_endpoint          = true
    enable_private_nodes             = true
    master_ipv4_cidr_block           = "${_MASTER_IP}"
    remove_default_node_pool         = true
    maintenance_recurrence           = "FREQ=WEEKLY;BYDAY=FR,SA,SU"
    maintenance_start_time           = "2023-07-16T21:00:49Z"
    maintenance_end_time             = "2023-07-19T01:00:49Z"
    release_channel                  = "STABLE"
    datapath_provider                = "ADVANCED_DATAPATH"
    cluster_resource_labels = {
      environment = "dev",
      createdby   = "terraform",
      purpose     = "apps"
      tenant      = "${_CUSTOMER_NAME}"
    }
    enable_binary_authorization  = "PROJECT_SINGLETON_POLICY_ENFORCE"
    master_global_access_enabled = true
    master_authorized_networks = [
      {
        cidr_block   = "10.137.189.0/24"
        display_name = ""
      }
    ]
    node_pools = [
      {
        name               = "${_CUSTOMER_NAME}-saas-tenant-pool-01"
        machine_type       = "${_MACHINE_TYPE}"
        node_locations     = "${_ZONE}"
        image_type         = "COS_CONTAINERD"
        autoscaling        = true
        min_count          = "${_MIN_COUNT}"
        max_count          = "${_MAX_COUNT}"
        enable_secure_boot = true
        disk_size_gb       = 50
        disk_type          = "pd-standard"
        auto_upgrade       = true
        auto_repair        = false
        spot               = false
        initial_node_count = "${_NODE_COUNT}"
        max_pods_per_node  = 30
        boot_disk_kms_key  = "${_KMS_KEY_PATH}"
        accelerator_count  = "${_ACCELERATOR_COUNT}"
        accelerator_type   = "${_ACCELERATOR_TYPE}"
      }
    ]
    node_pools_labels = {
      "${_CUSTOMER_NAME}-saas-tenant-pool-01" = {
        environment = "dev",
        createdby   = "terraform",
        nodegroup   = "${_CUSTOMER_NAME}-saas-tenant-pool-01",
        tenant      = "${_CUSTOMER_NAME}"
      }
    }
  }
}
