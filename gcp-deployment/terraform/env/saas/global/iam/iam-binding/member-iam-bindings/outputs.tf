# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  member IAM Binding Outputs
 *****************************************/

output "service_member_iam_bindings_01" {
  value       = module.service_member_iam_bindings_01
  description = "The details of the created member IAM bindings."
}

output "anthos_service_member_iam_bindings_02" {
  value       = module.service_member_iam_bindings_02
  description = "The details of the created anthos member IAM bindings."
}

output "host_member_iam_bindings_01" {
  value       = module.host_member_iam_bindings_01
  description = "The details of the created member IAM bindings."
}

# output "metrics_scope" {
#   description = "The metrics scope for scoped project"
#   value       = module.metrics_scope
# }