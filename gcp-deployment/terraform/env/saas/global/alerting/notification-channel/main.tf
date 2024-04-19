# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/*********************************************
 Notification Channel Details
**********************************************/

module "notification_channel" {
  source               = "../../../../modules/custom-alerting/notification-channel"
  notification_channel = var.notification_channel
}
