# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
variable "project_id" {
  description = "The GCP project ID"
  default = ""
}

variable "dnsauth_name" {
  description = "The name of dns authorization"
  default = ""
}

variable "domain" {
  description = "A domain which is being authorized"
  type = string
  default = ""
}

variable "managed_zone" {
  description = "The name of the zone in which this record set will reside"
  type = string
  default = ""
}

variable "type" {
  description = "The DNS record set type"
  type = string
  default = "CNAME"
}

variable "cert_name" {
  description = ""
  type = string
  default = ""

}

variable "cert_domain" {
  description = "The domains for which a managed SSL certificate will be generated. Wildcard domains are only supported with DNS challenge resolution"
  type = list
  default = []
}
# variable "cert_map_name" {
#   description = "A user-defined name of the Certificate Map"
#   type = string
#   default = ""

# }

# #variable "cert_map_description" {}

# variable "cert_map_labels" {
#   description = "Set of labels associated with a Certificate Map resource"
#   type = map
#   default = {
#      "terraform" : true,
#      "acc-test"  : true,
#   }
# }

# variable "cert_map_name_entry" {
#   description = "A user-defined name of the Certificate Map Entry"
#   type = string
# }