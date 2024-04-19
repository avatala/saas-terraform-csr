# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
Terraform remote state
*****************************************/
 # STATE FILES STORED IN THIS PATH UNDER THE BUCKET SPECIFIED ABOVE

project_state_bucket = "TF_BUCKET_NAME"
service_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/service-projects"
host_project_prefix_path= "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"

network_state_bucket = "TF_BUCKET_NAME"
network_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/global/networking/vpc"

bigquery_dataset_state_bucket = "TF_BUCKET_NAME"
bigquery_dataset_prefix_path = "gcp-deployment/terraform/env/PREFIX_NAME/regions/cloud-bigquery/bigquery"

/******************************************
  GKE Cluster Details
*****************************************/

main_vpc_gke_private_clusters = {
  main_vpc_gke_private_cluster_01 = {
    name                       = "PREFIX_NAME-tenant-cluster-us-ct1-01"
    region                     = "REGION_NAME"
    subnetwork                 = "PREFIX_NAME-tenant-gke-us-ct1-subnet"
    ip_range_pods              = "PREFIX_NAME-tenant-gke-us-ct1-subnet-pod"
    ip_range_services          = "PREFIX_NAME-tenant-gke-us-ct1-subnet-svc"
    create_service_account     = false
    regional                   = true
    http_load_balancing        = true
    network_policy             = false
    gce_pd_csi_driver          = true
    horizontal_pod_autoscaling = true
    enable_private_endpoint    = true
    enable_private_nodes       = true
    master_ipv4_cidr_block     = "10.100.1.128/28"
    remove_default_node_pool   = true
    maintenance_recurrence     = "FREQ=WEEKLY;BYDAY=FR,SA,SU"
    maintenance_start_time     = "2023-07-16T21:00:49Z"
    maintenance_end_time       = "2023-07-19T01:00:49Z"
    release_channel            = "STABLE"
    datapath_provider          = "ADVANCED_DATAPATH"
    cluster_resource_labels = {
      environment  = "dev",
      createdby    = "terraform",
      purpose      = "apps"
    }
    enable_binary_authorization  = "PROJECT_SINGLETON_POLICY_ENFORCE"
    master_global_access_enabled = false
    master_authorized_networks = [
      {
        cidr_block   = "10.143.210.0/24"
        display_name = ""
      }
    ]
    node_pools = [
      {
        name               = "PREFIX_NAME-tenant-pool-01"
        machine_type       = "e2-standard-4"
        node_locations     = "ZONE_NAME"
        image_type         = "COS_CONTAINERD"
        autoscaling        = true
        min_count          = 5
        max_count          = 10
        enable_secure_boot = true
        disk_size_gb       = 50
        disk_type          = "pd-standard"
        auto_upgrade       = true
        auto_repair        = false
        spot               = false
        initial_node_count = 5
        service_account    = "PREFIX_NAME-gke-sa@PREFIX_NAME-freemium-prj.iam.gserviceaccount.com"
        max_pods_per_node  = 110
        boot_disk_kms_key  = "KMS_KEY_PATH"
      }
    ]
    node_pools_labels = {
      saas-tenant-pool-01 = {
        environment  = "dev",
        createdby    = "terraform",
        nodegroup    = "node-pool-01",
        deployment   = "common",
        purpose      = "common"
      }
    }
  }
}
