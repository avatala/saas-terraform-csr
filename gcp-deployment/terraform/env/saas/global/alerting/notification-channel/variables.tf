# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "notification_channel" {
  description = "The details of the notification channel."
  type = map(object({
    project          = string,
    display_name     = string,
    channel_type     = string,
    labels           = map(string),
    sensitive_labels = map(string),
    user_labels      = map(string),
    description      = string,
    enabled          = string
  }))
  default = {
    notification_channel = {
      project          = ""
      display_name     = ""
      channel_type     = ""
      labels           = {}
      sensitive_labels = {}
      user_labels      = {}
      description      = ""
      enabled          = ""
    }
  }
}
