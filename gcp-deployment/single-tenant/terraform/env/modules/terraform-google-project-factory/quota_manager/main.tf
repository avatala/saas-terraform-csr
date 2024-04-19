# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

locals {
  consumer_quotas = { for index, quota in var.consumer_quotas : "${quota.service}-${quota.metric}" => quota }
}

resource "google_service_usage_consumer_quota_override" "override" {
  provider = google-beta
  for_each = local.consumer_quotas

  project        = var.project_id
  service        = each.value.service
  metric         = each.value.metric
  limit          = each.value.limit
  override_value = each.value.value
  force          = true
}
