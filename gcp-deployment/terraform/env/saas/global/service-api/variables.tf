# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
# -----------------------------------
# Service API variables
# -----------------------------------
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

variable "host_project_prefix_path" {
  description = "The Terraform state bucket prefix path for the Project ID."
  type        = string
  default     = ""
}

variable "anthos-hub-project-services" {
  description = "Details for the project service APIs."
  type = map(object({
    activate_apis              = list(string),
    disable_dependent_services = bool
  }))
  default = {
    "project_service" = {
      activate_apis              = []
      disable_dependent_services = false
    }
  }
}

variable "freemium-project-services" {
  description = "Details for the project service APIs."
  type = map(object({
    activate_apis              = list(string),
    disable_dependent_services = bool
  }))
  default = {
    "project_service" = {
      activate_apis              = []
      disable_dependent_services = false
    }
  }
}

variable "admin-host-project-services" {
  description = "Details for the project service APIs."
  type = map(object({
    activate_apis              = list(string),
    disable_dependent_services = bool
  }))
  default = {
    "project_service" = {
      disable_dependent_services = false
      activate_apis              = []
    }
  }
}