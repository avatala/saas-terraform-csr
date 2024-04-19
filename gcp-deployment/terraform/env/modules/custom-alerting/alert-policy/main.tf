# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

resource "google_monitoring_alert_policy" "alert_policy" {
  for_each     = { for r in var.alert_policy : r.display_name => r }
  project      = each.value.project_id
  display_name = each.value.display_name
  enabled      = each.value.enabled
  combiner     = each.value.combiner
  dynamic "conditions" {
    for_each = lookup(each.value, "conditions")
    content {
      display_name = conditions.value.display_name
      dynamic "condition_threshold" {
        for_each = conditions.value.condition_threshold == null ? [] : [conditions.value.condition_threshold]
        content {
          filter     = conditions.value.condition_threshold.filter
          duration   = conditions.value.condition_threshold.duration
          comparison = conditions.value.condition_threshold.comparison
          aggregations {
            alignment_period     = conditions.value.condition_threshold.aggregations["alignment_period"]
            per_series_aligner   = conditions.value.condition_threshold.aggregations["per_series_aligner"]
            group_by_fields      = conditions.value.condition_threshold.aggregations["group_by_fields"]
            cross_series_reducer = conditions.value.condition_threshold.aggregations["cross_series_reducer"]
          }
          threshold_value = conditions.value.condition_threshold.threshold_value
        }
      }
      dynamic "condition_monitoring_query_language" {
        for_each = conditions.value.condition_monitoring_query_language == null ? [] : [conditions.value.condition_monitoring_query_language]
        content {
          query    = conditions.value.condition_monitoring_query_language.query
          duration = conditions.value.condition_monitoring_query_language.duration
        }
      }
    }
  }
  documentation {
    content = each.value.documentation
  }
  notification_channels = each.value.notification_channels
  user_labels = each.value.user_labels
}
