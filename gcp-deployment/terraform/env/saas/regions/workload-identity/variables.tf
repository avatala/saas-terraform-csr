# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "workload_identities" {
  description = "The details of the Workload Identity creation for existing GSA and KSA."
  type = map(object({
    project_id  = string,
    name        = string,
    namespace   = string,
    k8s_sa_name = string
  }))
  default = {
    workload_identity = {
      project_id  = ""
      name        = ""
      namespace   = ""
      k8s_sa_name = ""
    }
  }
}

