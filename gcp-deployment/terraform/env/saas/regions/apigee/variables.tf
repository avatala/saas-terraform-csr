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

variable "network_state_bucket" {
  description = "The Terraform state bucket name for the network"
  type        = string
  default     = ""
}

variable "network_prefix_path" {
  description = "The Terraform state bucket prefix path for the network"
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

variable "dns_state_bucket" {
  description = "The Terraform state bucket name for the dns ID."
  type        = string
  default     = ""
}

variable "public_dns_prefix_path" {
  description = "The Terraform state bucket prefix path for the public dns ID."
  type        = string
  default     = ""
}

variable "endpoint_attachments" {
  description = "Endpoint attachments."
  type = map(object({
    region             = string
    service_attachment = string
  }))
  default = null
}

variable "envgroups" {
  description = "Environment groups (NAME => [HOSTNAMES])."
  type        = map(list(string))
  default     = null
}

variable "environments" {
  description = "Environments."
}

variable "instances" {
  description = "Instances."
}

variable "organization" {
  description = "Apigee organization. If set to null the organization must already exist."
}
variable "enable_apis" {
  description = "Whether to actually enable the APIs. If false, this module is a no-op."
  default     = true
}

variable "activate_apis" {
  description = "The list of apis to activate within the project"
  type        = list(string)
  default     = []
}

variable "service_accounts" {
  description = "The details of the service accounts."
  type = map(object({
    prefix       = string,
    names        = list(string),
    display_name = string,
    description  = string
  }))
  default = {
    service_account = {
      prefix       = ""
      project_id       = ""
      names        = []
      display_name = ""
      description  = ""
    }
  }
}


variable "apigee_service_member_iam_bindings" {
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

variable "mig_template" {
  description = "configuration of mig and template"
}

variable "lb" {
  description = "configuration of Apigee load balancer"
}

# variable "bridge_mig_ilb_tcp" {
#   description = "the details of internal tcp lb"
# }
