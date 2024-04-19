# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
# -----------------------------------
# cloudbuild trigger variables
# -----------------------------------



variable "initial_cloud_build_trigger" {
  description = "the cloud build trigger configuration for build triggers"
}

variable "seed-project-services" {
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

variable "seed_project_id" {
  description = "ID of the project that owns the Cloud Source Repository."
}
