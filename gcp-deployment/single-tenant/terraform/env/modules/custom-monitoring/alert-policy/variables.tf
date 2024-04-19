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

variable "alert_policy" {
  description = "The details of the alert policy."
  type = map(object({
    display_name          = string
    project_id            = string
    enabled               = string
    combiner              = string
    notification_channels = list(string)
    documentation         = string
    conditions            = list(object({
      condition_threshold = object({
        display_name      = string
        filter             = string
        duration           = string
        comparison         = string
        denominator_filter = string
        alignment_period   = string
        per_series_aligner = string
        threshold_value    = number
        trigger = object({
          violation_count   = number
          violation_percent = number
        })
        group_by_fields      = list(string)
        cross_series_reducer = string
        denominator_aggregations = object({
          per_series_aligner = string
          group_by_fields = list(string)
          alignment_period = string
          cross_series_reducer = string
        })
        aggregations = object({
          alignment_period     = string
          per_series_aligner   = string
          group_by_fields      = list(string)
          cross_series_reducer = string
        })
      })     
    }))
  }))
  default = {
    alert = {
      display_name                        = ""
      project_id                          = ""
      enabled                             = ""
      combiner                            = ""
      notification_channels               = []
      documentation                       = ""
      conditions = [
        {
          condition_threshold  = {
            display_name       = ""
            filter             = ""
            duration           = ""
            comparison         = ""
            denominator_filter = ""
            alignment_period   = ""
            per_series_aligner = ""
            threshold_value    = 1
            trigger = ({
              violation_count   = null
              violation_percent = null
            })
            denominator_aggregations = ({
              per_series_aligner = ""
              group_by_fields = []
              alignment_period = ""
              cross_series_reducer = ""
            })            
            group_by_fields      = ""
            cross_series_reducer = ""
            aggregations         = ""
            cross_series_reducer = ""
            group_by_fields      = []
            filter               = ""
            denominator_filter   = ""
            aggregations = ({
              alignment_period     = ""
              per_series_aligner   = ""
              group_by_fields      = []
              cross_series_reducer = ""
            })
          }
        }
      ]
    }  
  }
}