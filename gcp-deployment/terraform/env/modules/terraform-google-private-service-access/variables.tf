# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "project_id" {
  description = "The project ID of the VPC network to peer. This can be a shared VPC host projec."
  type        = string
}

variable "name" {
  description = "Name of the private service access range."
  type        = string
  default     = ""
}

variable "vpc_network" {
  description = "Name of the VPC network to peer."
  type        = string
  default     = ""
}

variable "vpc_network_self_link" {
  description = "Self link of the VPC network to peer."
  type        = string
}

variable "address" {
  description = "First IP address of the IP range to allocate to CLoud SQL instances and other Private Service Access services. If not set, GCP will pick a valid one for you."
  type        = string
  default     = ""
}

variable "prefix_length" {
  description = "Prefix length of the IP range reserved for Cloud SQL instances and other Private Service Access services. Defaults to /16."
  type        = number
  default     = 16
}

variable "ip_version" {
  description = "IP Version for the allocation. Can be IPV4 or IPV6."
  type        = string
  default     = ""
}

variable "labels" {
  description = "The key/value labels for the IP range allocated to the peered network."
  type        = map(string)
  default     = {}
}

variable "reserved_peering_ranges" {
  description = "Named IP address range(s) of PEERING type reserved for this service provider."
  type        = list(string)
  default     = []
}

