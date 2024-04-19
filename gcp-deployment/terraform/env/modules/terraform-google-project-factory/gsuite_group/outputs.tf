# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "domain" {
  value       = local.domain
  description = "The domain of the group's organization."
}

output "email" {
  description = "The email address of the group."
  value       = local.email
}

output "name" {
  description = "The username portion of the email address of the group."
  value       = var.name
}

