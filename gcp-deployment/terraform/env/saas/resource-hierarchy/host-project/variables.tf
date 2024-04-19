# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


variable "standalone_projects" {
  description = "The Project name, Billing Account and APIs list for the Standalone projects."
  type = map(object({
    project_name                   = string,
    billing_account                = string,
    prefix                         = string,
    folder_id                      = string,
    activate_apis                  = list(string),
    default_logging_retention_days = string,
    labels                         = map(string)
  }))
  default = {
    standalone_project = {
      project_name                   = ""
      prefix                         = ""
      billing_account                = ""
      folder_id                      = "",
      activate_apis                  = []
      default_logging_retention_days = ""
      labels                         = {}
    }
  }
}
