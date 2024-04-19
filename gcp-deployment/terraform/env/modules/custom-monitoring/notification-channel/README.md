# Terraform Custom Notification Channel Module

This module allows to create and manage notifications channel. A notification channel is the mechanism that Monitoring uses to notify you that the conditions of an alerting policy have been met.

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html)

## Usage

Basic usage of this module is as follows:

- This module creates notification channels.

```
resource "google_monitoring_notification_channel" "notification_channel" {
  project      = var.project
  display_name = var.display_name
  description  = var.description
  enabled      = var.enabled
  type         = var.channel_type
  labels       = var.labels
  user_labels  = var.user_labels
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
| notification_channel | The details of the notification channel. | <pre> map(object({<br>    project          = string,<br>    display_name     = string,<br>    channel_type     = string,<br>    labels           = map(string),<br>    sensitive_labels = map(string),<br>    user_labels      = map(string),<br>    description      = string,<br>    enabled          = string<br>  }))</pre> | <pre>notification_channel = {<br>      project          = ""<br>      display_name     = ""<br>      channel_type     = ""<br>      labels           = {}<br>      sensitive_labels = {}<br>      user_labels      = {}<br>      description      = ""<br>      enabled          = ""<br>    }</pre> | yes |

## Outputs

| Name | Description |
|------|-------------|
| notification_channel | The ID of the notification channel created. |

## Permissions

In order to execute this module you must have a Service Account with the following permissions and roles:

- `roles/monitoring.notificationChannelEditor` Monitoring NotificationChannel Editor

## APIs

In order to operate this module, you must activate the following APIs on
the project:

- `monitoring.googleapis.com` - Cloud Monitoring API

## Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13.0
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin < 5.0, >= 2.12
- [terraform-provider-google-beta](https://github.com/terraform-providers/terraform-provider-google-beta) plugin < 5.0, >= 3.45