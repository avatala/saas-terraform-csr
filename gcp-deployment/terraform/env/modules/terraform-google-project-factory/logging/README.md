## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Terraform Google Tags Module

This module handles project-level logging bucket config.

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html)

## Usage

Basic usage of this module is as follows:

```
module "default_logging_bucket" {
  source         = "../logging"
  project        = "projects/${var.project_id}"
  location       = var.location
  retention_days = var.default_logging_retention_days
  bucket_id      = var.bucket_id
  description    = var.description
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
| project | The parent resource that contains the logging bucket. | `string` | `""` | yes |
| location | The location of the bucket. | `string` | `""` | yes |
| bucket_id | The name of the logging bucket. Logging automatically creates two log buckets: _Required and _Default. | `list(string)` | `[]` | yes |
| description | Describes this bucket. | `string` | `""` | no | 
| retention_days | Logs will be retained by default for this amount of time, after which they will automatically be deleted. The minimum retention period is 1 day. If this value is set to zero at bucket creation time, the default time of 30 days will be used. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | An identifier for the resource with format. |
| name | The resource name of the bucket. For example: "projects/my-project-id/locations/my-location/buckets/my-bucket-id". |
| lifecycle_state | The bucket's lifecycle such as active or deleted. See LifecycleState. |

## Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13.0
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin >= 3.50, < 5.0
