# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
	Variables for VPC serverless connector
 *****************************************/
 
variable "vpc_connectors" {
  description = "List of VPC serverless connectors."
  type = list(object({
    region        = string,
    name          = string,
    ip_cidr_range = string,
    machine_type  = string,
    min_instances = number,
    max_instances = number
  }))
  default = []
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
  description = "The Terraform state bucket name for the Network Name."
  type        = string
  default     = ""
}

variable "network_prefix_path" {
  description = "The Terraform state bucket prefix path for the Network Name."
  type        = string
  default     = ""
}



