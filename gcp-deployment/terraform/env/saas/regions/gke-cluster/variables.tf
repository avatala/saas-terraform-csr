# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "project_state_bucket" {
  description = "The Terraform state bucket name for the Project ID."
  type        = string
  default     = ""
}

variable "service_project_prefix_path" {
  description = "The Terraform state bucket prefix path for the Project ID."
  type        = string
  default     = ""
}
variable "host_project_prefix_path" {
  description = "The Terraform state bucket prefix path for the Project ID."
  type        = string
  default     = ""
}


variable "network_state_bucket" {
  description = "The Terraform state bucket name for the Network Name."
  type        = string
  default     = ""
}

variable "network_prefix_path" {
  description = "The Terraform state bucket prefix path for the Network Name."
  type        = string
  default     = ""
}

variable "bigquery_dataset_state_bucket" {
  description = "The Terraform state bucket name for the Bigquery"
  type        = string
  default     = ""
}

variable "bigquery_dataset_prefix_path" {
  description = "The Terraform state bucket prefix path for the Bigquery"
  type        = string
  default     = ""
}
variable "main_vpc_gke_private_clusters" {
  description = "The details of the GKE cluster."
  type = map(object({
    name                         = string,
    region                       = string,
    subnetwork                   = string,
    ip_range_pods                = string,
    ip_range_services            = string,
    create_service_account       = bool,
    regional                     = bool,
    http_load_balancing          = bool,
    network_policy               = bool,
    gce_pd_csi_driver            = bool,
    horizontal_pod_autoscaling   = bool,
    enable_private_endpoint      = bool,
    enable_private_nodes         = bool,
    master_ipv4_cidr_block       = string,
    remove_default_node_pool     = bool,
    maintenance_recurrence       = string,
    maintenance_start_time       = string,
    maintenance_end_time         = string,
    release_channel              = string,
    cluster_resource_labels      = map(string),
    enable_binary_authorization  = string,
    master_global_access_enabled = bool,
    datapath_provider            = string,
    master_authorized_networks = list(object({
      cidr_block   = string,
      display_name = string
    }))
    node_pools        = list(map(string)),
    node_pools_labels = map(map(string)),
    /* node_pools_taints = map(list(object({
      key    = string,
      value  = string,
      effect = string
    }))) */
  }))
  default = {
    main_vpc_gke_private_cluster = {
      name                         = ""
      region                       = ""
      subnetwork                   = ""
      ip_range_pods                = ""
      ip_range_services            = ""
      create_service_account       = true
      regional                     = true
      http_load_balancing          = true
      network_policy               = false
      gce_pd_csi_driver            = false
      horizontal_pod_autoscaling   = true
      enable_private_endpoint      = true
      enable_private_nodes         = true
      master_ipv4_cidr_block       = ""
      remove_default_node_pool     = false
      maintenance_recurrence       = ""
      maintenance_start_time       = ""
      maintenance_end_time         = ""
      kubernetes_version           = ""
      release_channel              = ""
      cluster_resource_labels      = {}
      enable_binary_authorization  = "DISABLED"
      master_global_access_enabled = true
      auto_upgrade                 = true
      master_authorized_networks   = []
      datapath_provider            = ""
      node_pools = [
        {
          name = "default-node-pool"
        }
      ]
      node_pools_labels = {
        all               = {}
        default-node-pool = {}
      }
      node_pools_taints = {
        all               = []
        default-node-pool = []
      }
    }
  }
}
