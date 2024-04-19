# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
 

output "secret_manager" {
  value       = module.secret_manager
  description = "The fully-qualified id of the Secret Manager key that contains the secret."
}

