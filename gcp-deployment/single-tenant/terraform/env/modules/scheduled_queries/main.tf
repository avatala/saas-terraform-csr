# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

data "google_project" "project" {
  project_id = var.project_id
}

resource "google_project_iam_member" "bq_transfer_permission" {
  project = data.google_project.project.project_id
  role    = "roles/iam.serviceAccountShortTermTokenMinter"
  member  = "serviceAccount:service-${data.google_project.project.number}@gcp-sa-bigquerydatatransfer.iam.gserviceaccount.com"
}

resource "google_bigquery_data_transfer_config" "query_config" {
  for_each = { for i in var.queries : i.name => i }

  project                   = var.project_id
  display_name              = each.value.name
  location                  = lookup(each.value, "location", null)
  data_source_id            = each.value.data_source_id
  schedule                  = lookup(each.value, "schedule", "")
  notification_pubsub_topic = lookup(each.value, "notification_pubsub_topic", null)
  data_refresh_window_days  = lookup(each.value, "data_refresh_window_days", null)
  disabled                  = lookup(each.value, "disabled", null)
  service_account_name      = lookup(each.value, "service_account_name", null)
  params                    = each.value.params

  dynamic "schedule_options" {
    for_each = (lookup(each.value, "disable_auto_scheduling", null) != null) ? [each.value.disable_auto_scheduling] : []
    content {
      disable_auto_scheduling = lookup(each.value, "disable_auto_scheduling", null)
      start_time              = lookup(each.value, "start_time", null)
      end_time                = lookup(each.value, "end_time", null)
    }
  }

  dynamic "email_preferences" {
    for_each = (lookup(each.value, "enable_failure_email", false) != false) ? [each.value.enable_failure_email] : []
    content {
      enable_failure_email = lookup(each.value, "enable_failure_email", false)
    }
  }

  dynamic "sensitive_params" {
    for_each = (lookup(each.value, "secret_access_key", null) != null) ? [each.value.secret_access_key] : []
    content {
      secret_access_key = lookup(each.value, "secret_access_key", null)
    }
  }

  depends_on = [google_project_iam_member.bq_transfer_permission]
}