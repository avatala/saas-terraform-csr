# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
# ------------------------------------------------------------------------------
# LOAD BALANCER OUTPUTS
# ------------------------------------------------------------------------------

output "backend_details" {
  value = module.backend
}

output "tenant_id" {
    value = module.tenant.tenant_id
 }

output "tenant_name" {
  value = module.tenant.tenant_name
}