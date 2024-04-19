# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "bindings_by_member" {
  value       = local.bindings_by_member
  description = "List of bindings for entities unwinded by members."
}

output "set_authoritative" {
  value       = local.set_authoritative
  description = "A set of authoritative binding keys (from bindings_authoritative) to be used in for_each. Unwinded by roles."
}

output "set_additive" {
  value       = local.set_additive
  description = "A set of additive binding keys (from bindings_additive) to be used in for_each. Unwinded by members."
}

output "bindings_authoritative" {
  value       = local.bindings_authoritative
  description = "Map of authoritative bindings for entities. Unwinded by roles."
}

output "bindings_additive" {
  value       = local.bindings_additive
  description = "Map of additive bindings for entities. Unwinded by members."
}
