# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/*********************************************
 Alert Policy Details
**********************************************/

module "alert_policy" {
  source       = "../../../../modules/custom-alerting/alert-policy"
  alert_policy = var.alert_policy
}