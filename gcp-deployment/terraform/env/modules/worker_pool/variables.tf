# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
variable "project_id" {
  description = "The id of the project"
}

variable "region" {
  description = "Default Region"
}

variable "network" {
  description = " name for the Networks."
  type        = string
  default     = ""
}

variable "network_project_id" {
  type = string
  description = "host project_id"
  default = ""
  
}
variable "pool_name" {
  description = "The name of the cloudbuild worker pool"
}

variable "disk_size_gb" {
  description = "Disk size for private pool"
}
variable "machine_type" {
  description = "Machine type for private pool"
}

variable "no_external_ip_bool" {
  description = "extern ip for private pool to access internet"
  type = bool
}