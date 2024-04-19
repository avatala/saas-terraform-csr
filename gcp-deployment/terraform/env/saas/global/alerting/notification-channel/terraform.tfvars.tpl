# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/*********************************************
 Notification Channel Details
**********************************************/

notification_channel = {
  notification_channel_01 = {
    project      = "HOST_PROJECT"
    display_name = "Vendor Email ID"
    channel_type = "email"
    labels = {
      "email_address" = "VENDOR_EMAIL_ID_"
    }
    sensitive_labels = {}
    user_labels      = {}
    description      = "Vendor Email ID"
    enabled          = true
  }
}
