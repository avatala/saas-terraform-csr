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
  description = "The Terraform state bucket name for the vpc."
  type        = string
  default     = ""
}

variable "network_prefix_path" {
  description = "The Terraform state bucket prefix path for the vpc."
  type        = string
  default     = ""
}

variable "vpn_state_bucket" {
  description = "The Terraform state bucket name for the vpn."
  type        = string
  default     = ""
}

variable "vpn_prefix_path" {
  description = "The Terraform state bucket prefix path for the vpn."
  type        = string
  default     = ""
}

variable "gke_state_bucket" {
  description = "The Terraform state bucket name for the gke_cluster."
  type        = string
  default     = ""
}

variable "gke_prefix_path" {
  description = "The Terraform state bucket prefix path for the gke_cluster."
  type        = string
  default     = ""
}

variable "region" {
  description = "Region name"
  type        = string
  default     = ""
}



variable "cloud_build_worker_pool" {
  description = "workerpool configuration"
  type = map(object({
  pool_name               = string
  disk_size_gb            = string
  machine_type            = string
  no_external_ip_bool     = bool
  }))
  default = {
    cloud_build_worker_pool = {
    pool_name               = ""
    disk_size_gb            = ""
    machine_type            = ""
    no_external_ip_bool     = true
    }
  }
}