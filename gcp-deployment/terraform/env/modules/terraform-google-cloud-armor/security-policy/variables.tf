# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


variable "name" {
  type = string
  description = "The name of the security policy"
}

variable "project" {
  type = string
  description = " The project in which the resource belongs. If it is not provided, the provider project is used"
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
# --------------------------------- 
# OWASP top 10 rules
# --------------------------------- 
variable "owasp_rules" {
     type = map(object({
        action                              = string
        priority                            = string
        expression                          = string
        description                         = string
        preview                             = bool
        })
    )
    } 
# --------------------------------- 
# Countries limitation rules
# --------------------------------- 
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
