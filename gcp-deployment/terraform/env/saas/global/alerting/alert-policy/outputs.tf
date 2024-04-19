# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/*********************************************
 Alert Policy Outputs
**********************************************/

output "alert_policy" {
  description = "The details of the alert policy created."
  value       = module.alert_policy
}