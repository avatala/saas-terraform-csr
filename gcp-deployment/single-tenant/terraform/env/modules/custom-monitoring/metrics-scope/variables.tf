variable project_id {
  type        = string
  default     = ""
  description = "Project ID of monitoring project"
}

variable monitored_projects {
  type        = list(string)
  default     = []
  description = "List of Projects to be monitored"
}




