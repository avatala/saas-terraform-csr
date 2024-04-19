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

variable "host_project_prefix_path" {
  description = "The Terraform state bucket prefix path for the Project ID."
  type        = string
  default     = ""
}

variable "service_project_prefix_path" {
  description = "The Terraform state bucket prefix path for the Project ID."
  type        = string
  default     = ""
}

variable "cloud_build_trigger_state_bucket" {
  description = "The Terraform state bucket name for the Project ID."
  type        = string
  default     = ""
}

variable "user_managed_replication" {
  type        = map(list(object({ location = string, kms_key_name = string })))
  description = "Replication parameters that will be used for defined secrets"
  default     = {}
}

variable "cloud_build_trigger_prefix_path" {
  description = "The Terraform state bucket prefix path for the Project ID."
  type        = string
  default     = ""
}
 
variable "secret_manager" {
  description = "The details of the Secret Manager."
  type = map(object({
    id=string,
    secret=string,
    labels=map(string)

  }))
  default = {
    secret_manager={
      id=""
      secret=""
      labels={}
    }
  }
}

variable "seed_project_id" {
  description = "ID of the project that owns the Cloud Source Repository."
}