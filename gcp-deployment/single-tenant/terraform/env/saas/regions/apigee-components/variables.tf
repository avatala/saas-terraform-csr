variable "project_state_bucket" {
 description = "The Terraform state bucket name for the Project ID."
 type        = string
 default     = ""
}

variable "host_project_prefix_path" {
 description = "The Terraform state bucket prefix path for the Project IDs."
 type        = string
 default     = ""
}

variable "apigee_devs" {}

variable "apigee_dev_apps" {}

