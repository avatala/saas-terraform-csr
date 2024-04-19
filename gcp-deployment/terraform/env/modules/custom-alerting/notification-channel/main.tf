# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

resource "google_monitoring_notification_channel" "notification_channel" {
  for_each     = { for r in var.notification_channel : r.display_name => r }
  project      = each.value.project
  display_name = each.value.display_name
  description  = each.value.description
  enabled      = each.value.enabled
  type         = each.value.channel_type
  labels       = each.value.labels
  user_labels  = each.value.user_labels
  dynamic "sensitive_labels" {
    for_each = lookup(each.value, "sensitive_labels", [])
    content {
      auth_token  = sensitive_labels.value.auth_token
      password    = sensitive_labels.value.password
      service_key = sensitive_labels.value.service_key
    }
  }
}
