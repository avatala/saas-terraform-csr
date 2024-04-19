# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "dashboard_json_file" {
  description = "The JSON file of the dashboard."
  type        = list(string)
}

variable "host_project_id" {
  description = "The project ID of host project"
  type        = string
}