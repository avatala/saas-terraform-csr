# Custom Notification Channels and Alert Policy Module

This module allows to create and manage  Alert Policies based on metrics. An alerting policy describes the circumstances under which you want to be alerted and how you want to be notified.

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html)

## Usage

Basic usage of this module is as follows:

- This module creates Alert Policies.

```
module "alert_policy" {
  source       = "../../modules/custom-alerting/alert-policy"
  alert_policy = var.alert_policy
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
| alert_policy | The details of the alert policy. | <pre>map(object({<br>    display_name          = string,<br>    project_id            = string,<br>    enabled               = string,<br>    combiner              = string,<br>    notification_channels = list(string),<br>    documentation         = string,<br>    conditions = list(object({<br>      condition_threshold = object({<br>        display_name    = string,<br>        filter          = string,<br>        duration        = string,<br>        comparison      = string,<br>        threshold_value = number,<br>        aggregations = object({<br>          alignment_period     = string,<br>          per_series_aligner   = string,<br>          group_by_fields      = list(string),<br>          cross_series_reducer = string,<br>        })<br>      })<br>    }))<br>  }))</pre> | <pre>alert_policy = {<br>  display_name          = ""<br>  project_id            = ""<br>  enabled               = ""<br>  combiner              = ""<br>  notification_channels = []<br>  documentation         = ""<br>  conditions = [<br>    {<br>      condition_threshold = {<br>        display_name    = ""<br>        filter          = ""<br>        duration        = ""<br>        comparison      = ""<br>        threshold_value = 1<br>        aggregations = ({<br>          alignment_period     = ""<br>          per_series_aligner   = ""<br>          group_by_fields      = []<br>          cross_series_reducer = ""<br>        })<br>      }<br>    }<br>  ]<br>}</pre> | yes | 

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