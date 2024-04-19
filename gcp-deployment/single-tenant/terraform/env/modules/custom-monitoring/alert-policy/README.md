# Terraform Custom Alert Policy Module

This module allows to create and manage an Alert Policies based on metrics. An alerting policy describes the circumstances under which you want to be alerted and how you want to be notified.

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html)

## Usage

Basic usage of this module is as follows:

- This module creates Alert Policies.

```
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
```

Then perform the following commands:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alert_policy | The details of the alert policy. | <pre>map(object({<br>    display_name          = string<br>    project_id            = string<br>    enabled               = string<br>    combiner              = string<br>    notification_channels = list(string)<br>    documentation         = string<br>    conditions            = list(object({<br>      condition_threshold = object({<br>        display_name      = string<br>        filter             = string<br>        duration           = string<br>        comparison         = string<br>        denominator_filter = string<br>        alignment_period   = string<br>        per_series_aligner = string<br>        threshold_value    = number<br>        trigger = object({<br>          violation_count   = number<br>          violation_percent = number<br>        })<br>        group_by_fields      = list(string)<br>        cross_series_reducer = string<br>        denominator_aggregations = object({<br>          per_series_aligner = string<br>          group_by_fields = list(string)<br>          alignment_period = string<br>          cross_series_reducer = string<br>        })<br>        aggregations = object({<br>          alignment_period     = string<br>          per_series_aligner   = string<br>          group_by_fields      = list(string)<br>          cross_series_reducer = string<br>        })<br>      })     <br>    }))<br>  }))</pre> |<pre> alert = {<br>      display_name                        = ""<br>      project_id                          = ""<br>      enabled                             = ""<br>      combiner                            = ""<br>      notification_channels               = []<br>      documentation                       = ""<br>      conditions = [<br>        {<br>          condition_threshold  = {<br>            display_name       = ""<br>            project_id         = ""<br>            filter             = ""<br>            duration           = ""<br>            comparison         = ""<br>            denominator_filter = ""<br>            alignment_period   = ""<br>            per_series_aligner = ""<br>            threshold_value    = 1<br>            trigger = ({<br>              violation_count   = null<br>              violation_percent = null<br>            })<br>            denominator_aggregations = ({<br>              per_series_aligner = ""<br>              group_by_fields = []<br>              alignment_period = ""<br>              cross_series_reducer = ""<br>            })            <br>            group_by_fields      = ""<br>            cross_series_reducer = ""<br>            aggregations         = ""<br>            cross_series_reducer = ""<br>            group_by_fields      = []<br>            filter               = ""<br>            denominator_filter   = ""<br>            aggregations = ({<br>              alignment_period     = ""<br>              per_series_aligner   = ""<br>              group_by_fields      = []<br>              cross_series_reducer = ""<br>            })<br>          }<br>        }<br>      ]<br>    }  <br>  }</pre>| yes | 

## Outputs

| Name | Description |
|------|-------------|
| alert_policy | The details of the alert policy created. |

## Permissions

In order to execute this module you must have a Service Account with the following permissions and roles:

- `roles/monitoring.alertPolicyEditor` - Monitoring AlertPolicy Editor

## APIs

In order to operate this module, you must activate the following APIs on
the project:

- `monitoring.googleapis.com` - Cloud Monitoring API

## Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13.0
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin < 5.0, >= 2.12
- [terraform-provider-google-beta](https://github.com/terraform-providers/terraform-provider-google-beta) plugin < 5.0, >= 3.45