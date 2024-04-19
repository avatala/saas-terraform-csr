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

variable "workload_identities" {
  description = "The details of the Workload Identity creation for existing GSA and KSA."
  type = map(object({
    name        = string,
    namespace   = string,
    k8s_sa_name = string
  }))
  default = {
    workload_identity = {
      name        = ""
      namespace   = ""
      k8s_sa_name = ""
    }
  }
}

