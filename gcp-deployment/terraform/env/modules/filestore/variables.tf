# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
variable "name" {
  type        = string
  description = "the name of the filestore"
}
variable "location" {
  type        = string
  description = "the zone of deployment of filestore"
}
variable "tier" {
  type        = string
  description = "the usage tier of filestore"
}
variable "project_id" {
  type        = string
  description = "the id of project in which filestore will be created"
}
variable "capacity_gb" {
  type        = number
  description = " File share capacity in GiB. This must be at least 1024 GiB for the standard tier"
}
variable "file_shares_name" {
  type        = string
  description = "The name of the fileshare (16 characters or less)"
}
variable "network" {
  type        = string
  description = "the network that the filestore will use."
}
variable "modes" {
  type        = list(string)
  description = " IP versions for which the instance has IP addresses assigned. VEach of values may be ADDRESS_MODE_UNSPECIFIED, MODE_IPV4, and MODE_IPV6"
  default     = ["MODE_IPV4"]
}
variable "connect_mode" {
  type        = string
  description = " The network connect mode of the Filestore instance. If not provided, the connect mode defaults to DIRECT_PEERING."
  default     = "DIRECT_PEERING"
}

variable "reserved_ip_range" {
  type        = string
  description = "A /29 CIDR block that identifies the range of IP addresses reserved for this instance"
  default     = ""
}