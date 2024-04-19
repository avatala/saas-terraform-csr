# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
# -----------------------------------
# cloudbuild trigger variables
# -----------------------------------
variable "seed_project_id" {
  description = "ID of the project that owns the Cloud Source Repository."
}

variable "service_project_state_bucket" {
  description = "Bucket of service project"
}
variable "service_project_prefix_path" {
  description = "Prefix path of service project"
}

variable "cloud_build_triggers" {
  type = map(object({
    name            = string
    description     = string
    location        = string
    uri             = string
    branch          = string
    path            = string
    service_account = string
    substitutions   = map(string)
  }))
}

variable "cloud_build_main_branch_apigee_trigger" {
description = "apigee trigger"
}

variable "cloud_build_main_branch_apigee_components_trigger" {
description = "apigee components trigger"
}