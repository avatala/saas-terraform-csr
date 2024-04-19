# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "service_member_iam_bindings_02" {
  description = "The details of the member IAM bindings."
  type = map(object({
    service_account_address = string,
    role_name = list(string)
  }))
  default = {
    project_iam_binding = {
      service_account_address = ""
      #project_id = ""
      role_name = [""]
    }
  }
}

variable "users" {
  description = "List of users that required IAP access"
  type        = list(string)
  default     = []
}

variable "service_member_iam_bindings_01" {
  description = "The details of the member IAM bindings."
  type = map(object({
    service_account_address = string,
    role_name = list(string)
  }))
  default = {
    project_iam_binding = {
      service_account_address = ""
      #project_id = ""
      role_name = [""]
    }
  }
}


variable "host_member_iam_bindings_01" {
  description = "The details of the member IAM bindings."
  type = map(object({
    service_account_address = string,
    role_name = list(string)
  }))
  default = {
    project_iam_binding = {
      service_account_address = ""
      role_name = [""]
    }
  }
}

variable "seed_member_iam_bindings_01" {
  description = "The details of the member IAM bindings."
  type = map(object({
    service_account_address = string,
    project_id = string,
    role_name = list(string)
  }))
  default = {
    project_iam_binding = {
      service_account_address = ""
      project_id = ""
      role_name = [""]
    }
  }
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

variable "service_project_prefix_path" {
  description = "The Terraform state bucket prefix path for the Project ID."
  type        = string
  default     = ""
}
