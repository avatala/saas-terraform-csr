# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

variable "alert_policy" {
  description = "The details of the alert policy."
  type = map(object({
    display_name          = string,
    project_id            = string,
    enabled               = bool,
    combiner              = string,
    notification_channels = list(string),
    documentation         = string,
    conditions = list(object({
      display_name = string,
      condition_threshold = object({
        filter          = string,
        duration        = string,
        comparison      = string,
        threshold_value = number,
        aggregations = object({
          alignment_period     = string,
          per_series_aligner   = string,
          group_by_fields      = list(string),
          cross_series_reducer = string,
        })
      })
      condition_monitoring_query_language = object({
        query    = string,
        duration = string
      })
    }))
    user_labels = map(string)
  }))
  default = {
    alert_policy = {
      display_name          = ""
      project_id            = ""
      enabled               = true
      combiner              = ""
      notification_channels = []
      documentation         = ""
      conditions = [
        {
          display_name                        = ""
          condition_threshold                 = null
          condition_monitoring_query_language = null
        }
      ]
      user_labels = {}
    }
  }
}
