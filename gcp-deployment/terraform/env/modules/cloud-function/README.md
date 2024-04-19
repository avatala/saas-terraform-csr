# Google Cloud Function Module

This module allows you to create a Cloud Function.

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
If you haven't [upgraded](https://www.terraform.io/upgrade-guides/0-13.html)

## Usage

Basic usage of this module is as follows:

- This module creates Cloud Functions.

```
module "cloud_function" {
  source                        = "../modules/cloud_function"
  trigger_http                  = var.trigger_http
  labels                        = var.labels
  name                          = var.cloud_function_name
  project_id                    = var.project_id
  region                        = var.region
  runtime                       = var.runtime
  timeout_s                     = var.timeout_s
  available_memory_mb           = var.available_memory_mb
  service_account_email         = var.service_account_email
  ingress_settings              = var.ingress_settings
  source_directory              = var.source_directory
  entry_point                   = var.entry_point
  environment_variables = {
    PROJECT_ID             = var.project_id
  }
}
```

Then perform the following commands on the root folder:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | The ID of the project in which the resource belongs | `string` | `""` | yes |
| name | The name to apply to any nameable resources | `string` | `""` | yes |
| region | The region in which resources will be applied | `string` | `""` | yes |
| trigger_http | Weather to use HTTP trigger instead of the event trigger | `bool` | `null` | no |
| labels | A set of key/value label pairs to assign to the Cloud Function | `map(string)` | `{}` | no |
| runtime | The runtime in which the function will be executed | `string` | `""` | yes |
| available_memory_mb | The amount of memory in megabytes allotted for the function to use | `number` | `256` | no |
| timeout_s | The amount of time in seconds allotted for the execution of the function | `number` | `60` | no |
| service_account_email | The service account to run the function as | `string` | `""` | no |
| ingress_settings | The ingress settings for the function. Allowed values are ALLOW_ALL, ALLOW_INTERNAL_AND_GCLB and ALLOW_INTERNAL_ONLY. Changes to this field will recreate the cloud function | `string` | `""` | no |
| source_directory | The pathname of the directory which contains the function source code | `string` | `""` | yes |
| entry_point | The name of a method in the function source which will be invoked when the function is executed | `string` | `""` | no |
| environment_variables | A set of key/value environment variable pairs to assign to the function | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of the function |
| https_trigger_url | URL which triggers function execution |

## Permissions

In order to execute this module you must have a Service Account with the following permissions and roles:

- `roles/cloudfunctions.developer`

## APIs

In order to operate this module, you must activate the following APIs on the project:

- Cloud Pub/Sub API - `pubsub.googleapis.com`
- Cloud Build API - `cloudbuild.googleapis.com`
- Cloud Functions API - `cloudfunctions.googleapis.com`
- Cloud Logging API - `logging.googleapis.com`

## Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin >= 4.47.0, < 5.0
