# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  member IAM Binding Outputs
 *****************************************/

output "service_iam_bindings" {
  value       = module.service_iam_bindings
  description = "The details of the created member IAM bindings."
}