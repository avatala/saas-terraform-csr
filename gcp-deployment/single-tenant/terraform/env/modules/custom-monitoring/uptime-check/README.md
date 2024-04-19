# Monitoring: Alerting

 Manage Alerting Policies in GCP


## Modules

```hcl
resource "google_compute_network_endpoint_group" "neg" {
  name         = "my-lb-neg"
  network      = google_compute_network.default.id
  subnetwork   = google_compute_subnetwork.default.id
  default_port = "90"
  zone         = "us-central1-a"
}

resource "google_compute_network" "default" {
  name                    = "neg-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "default" {
  name          = "neg-subnetwork"
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.default.id
}
```

## Resources

| Name | Type |
|------|------|

| [google_monitoring_alert_policy.encryption_api_uptime_failure](https://registry.terraform.io/providers/hashicorp/google/3.68.0/docs/resources/monitoring_alert_policy) | resource |

| [google_monitoring_alert_policy.external_api_uptime_failure](https://registry.terraform.io/providers/hashicorp/google/3.68.0/docs/resources/monitoring_alert_policy) | resource |

| [google_monitoring_alert_policy.internal_api_uptime_failure](https://registry.terraform.io/providers/hashicorp/google/3.68.0/docs/resources/monitoring_alert_policy) | resource |


| [google_monitoring_uptime_check_config.encryption_api](https://registry.terraform.io/providers/hashicorp/google/3.68.0/docs/resources/monitoring_uptime_check_config) | resource |

| [google_monitoring_uptime_check_config.external_api](https://registry.terraform.io/providers/hashicorp/google/3.68.0/docs/resources/monitoring_uptime_check_config) | resource |

| [google_monitoring_uptime_check_config.internal_api](https://registry.terraform.io/providers/hashicorp/google/3.68.0/docs/resources/monitoring_uptime_check_config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_encryption_uptime_check"></a> [encryption\_uptime\_check](#input\_encryption\_uptime\_check) | Parameters for Encryption api uptime failure | <pre>object({<br>    host                      = string<br>    notification_channel_list = list(string)<br>    user_labels               = map(string)<br>  })</pre> | n/a | yes |
| <a name="input_external_uptime_check"></a> [external\_uptime\_check](#input\_external\_uptime\_check) | Parameters for external api uptime failure | <pre>object({<br>    host                      = string<br>    notification_channel_list = list(string)<br>    user_labels               = map(string)<br>  })</pre> | n/a | yes |
(#input\_notification\_channel\_list) | Notification channel list to notify in case of alert trigger and resolution | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project to create the resources | `string` | n/a | yes |
| <a name="input_global_user_labels"></a> [global\_user\_labels](#input\_global\_user\_labels) | Add user defined labels to all the policies | `map(string)` | n/a | yes |
| <a name="input_internal_uptime_check"></a> [internal\_uptime\_check](#input\_internal\_uptime\_check) | Parameters for internal api uptime failure | <pre>object({<br>    host                      = string<br>    notification_channel_list = list(string)<br>    user_labels               = map(string)<br>  })</pre> | n/a | yes |
| <a name="input_notification_channel_list"></a> [notification\_channel\_list]

