# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "project_state_bucket" {
  description = "The Terraform state bucket name for the Project ID."
  type        = string
  default     = ""
}

variable "host_project_prefix_path" {
  description = "The Terraform state bucket prefix path for the Project ID."
  type        = string
  default     = ""
}


variable "name" {
  type = string
  description = "The name of the security policy"
}

variable "ip_ranges_rules" {
  type = list(object({
    action          = string
    priority        = string
    versioned_expr  = string
    description     = string
    preview         = bool
    src_ip_ranges   = list(string)
  }))
  description = "The rules for configuring set of IP addresses or ranges"
  default = null
}

variable "owasp_rules" {
     type = map(object({
        action                              = string
        priority                            = string
        description                         = string
        preview                             = bool
        expression                          = string
        })
    )
    } 

variable "regex_rules" {
  type = list(object({
    action          = string
    priority        = string
    description     = string
    expression      = string
  }))
  description = "The rules for configuring textual representation of an expression in Common Expression Language syntax"
  default = null
}

variable "countries_rules" {
    type = map(object({
        action                              = string
        priority                            = string
        description                         = string
        preview                             = bool
        expression                          = string
        })
    )
} 