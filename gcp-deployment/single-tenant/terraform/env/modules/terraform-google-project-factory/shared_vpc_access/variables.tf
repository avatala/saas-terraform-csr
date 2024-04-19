# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "host_project_id" {
  description = "The ID of the host project which hosts the shared VPC"
  type        = string
}

variable "enable_shared_vpc_service_project" {
  description = "Flag set if SVPC enabled"
  type        = bool
}

variable "service_project_id" {
  description = "The ID of the service project"
  type        = string
}

variable "service_project_number" {
  description = "Project number of the service project. Will be used if `lookup_service_project_number` is false."
  type        = string
  default     = null
}

variable "lookup_project_numbers" {
  description = "Whether to look up the project numbers from data sources. If false, `service_project_number` will be used instead."
  type        = bool
  default     = true
}

variable "shared_vpc_subnets" {
  description = "List of subnets fully qualified subnet IDs (ie. projects/$project_id/regions/$region/subnetworks/$subnet_id)"
  type        = list(string)
  default     = []
}

variable "active_apis" {
  description = "The list of active apis on the service project. If api is not active this module will not try to activate it"
  type        = list(string)
  default     = []
}

variable "grant_services_security_admin_role" {
  description = "Whether or not to grant Kubernetes Engine Service Agent the Security Admin role on the host project so it can manage firewall rules"
  type        = bool
  default     = true
}

variable "grant_services_network_role" {
  description = "Whether or not to grant service agents the network roles on the host project"
  type        = bool
  default     = true
}