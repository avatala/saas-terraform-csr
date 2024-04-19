/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

resource "google_monitoring_alert_policy" "alert_policy" {
  for_each     = { for r in var.alert_policy : r.display_name => r }
  project      = each.value.project_id
  display_name = each.value.display_name
  enabled      = each.value.enabled
  combiner     = each.value.combiner
  dynamic "conditions" {
    for_each = lookup(each.value, "conditions")
    content {
      display_name = conditions.value.condition_threshold.display_name
      condition_threshold {
        filter             = conditions.value.condition_threshold.filter
        duration           = conditions.value.condition_threshold.duration
        comparison         = conditions.value.condition_threshold.comparison
        denominator_filter = conditions.value.condition_threshold.denominator_filter
        denominator_aggregations {
          per_series_aligner   = conditions.value.condition_threshold.denominator_aggregations["per_series_aligner"]
          group_by_fields      = conditions.value.condition_threshold.denominator_aggregations["group_by_fields"]
          alignment_period     = conditions.value.condition_threshold.denominator_aggregations["alignment_period"]
          cross_series_reducer = conditions.value.condition_threshold.denominator_aggregations["cross_series_reducer"]
        }
        aggregations {
          alignment_period     = conditions.value.condition_threshold.aggregations["alignment_period"]
          per_series_aligner   = conditions.value.condition_threshold.aggregations["per_series_aligner"]
          group_by_fields      = conditions.value.condition_threshold.aggregations["group_by_fields"]
          cross_series_reducer = conditions.value.condition_threshold.aggregations["cross_series_reducer"]
        }
        threshold_value = conditions.value.condition_threshold.threshold_value
        trigger {
          count   = conditions.value.condition_threshold.trigger["violation_count"]
          percent = conditions.value.condition_threshold.trigger["violation_percent"]
        }
      }
    }
  }
  documentation {
    content = each.value.documentation
  }
  notification_channels = each.value.notification_channels

}
