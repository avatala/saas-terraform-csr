# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "metrics_scope" {
  description = "The metrics scope for scoped project"
  value       = module.metrics_scope
}