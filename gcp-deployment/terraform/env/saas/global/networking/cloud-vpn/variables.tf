# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
variable "region" {
  description = "Default Region"
}

variable "vpn_name_gke" {
  description = "The VPN gateway name for GCP to on-prem"
}
variable "vpn_name_pool" {
  description = "The VPN gateway name for GCP to on-prem"
}

variable "router_asn_gke" {
  description = "Router ASN used for auto-created router."
  type        = number
}

variable "router_asn_pool" {
  description = "Router ASN used for auto-created router."
  type        = number
}

variable "secret_key_phrase0" {
  description = "Key phrase for ikev2 secret key for remote 0"
}

variable "project_state_bucket" {
  description = "The Terraform state bucket name for the Project ID."
  type        = string
  default     = ""
}

variable "host_project_prefix_path" {
  description = "The Terraform state bucket prefix path for the Project ID."
  type        = string
  default     = ""
}

variable "network_state_bucket" {
  description = "The Terraform state bucket name for the network name."
  type        = string
  default     = ""
}

variable "network_prefix_path" {
  description = "The Terraform state bucket prefix path for the network name."
  type        = string
  default     = ""
}
