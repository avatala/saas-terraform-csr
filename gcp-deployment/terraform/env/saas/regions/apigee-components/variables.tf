variable "host_project_state_bucket" {
  description = "The Terraform state bucket name for the Project ID."
  type        = string
  default     = ""
}

variable "host_project_prefix_path" {
  description = "The Terraform state bucket prefix path for the Project ID."
  type        = string
  default     = ""
}

variable "gcs_state_bucket" {
  description = "The Terraform state bucket name for the GCS bucket"
  type        = string
  default     = ""
}

variable "gcs_prefix_path" {
  description = "The Terraform state bucket prefix path for the GCS bucket"
  type        = string
  default     = ""
}

variable "env_name" {}

variable "api_proxies" {}

variable "shared_flows" {}

variable "kvm_details" {}

variable "apigee_x_product" {}
