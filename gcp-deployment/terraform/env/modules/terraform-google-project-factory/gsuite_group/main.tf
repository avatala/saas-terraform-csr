# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

locals {
  domain_list = concat(data.google_organization.org.*.domain, ["dummy"])
  domain      = var.domain == "" ? element(local.domain_list, 0) : var.domain
  email       = var.name == "" ? "" : format("%s@%s", var.name, local.domain)
}

/*****************************************
  Organization info retrieval
 *****************************************/
data "google_organization" "org" {
  count        = var.domain == "" && var.name != "" ? 1 : 0
  organization = var.org_id
}

