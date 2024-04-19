# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
# -----------------------------------
# Metrics Scope variables
# -----------------------------------

variable host_project_id {
  type        = string
  default     = ""
  description = "The project id of host project"
}

variable monitored_projects {
  type        = list(string)
  default     = []
  description = "list of projects to be monitored"
}
