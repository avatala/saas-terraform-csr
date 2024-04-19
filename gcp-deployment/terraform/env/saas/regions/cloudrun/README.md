## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Terraform Google Cloud Run Module

This example illustrates how to create a simple Cloud Run.

## Compatibility

This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue. If you haven't [upgraded](https://www.terraform.io/language/upgrade-guides/0-13)


## Terraform Plugins

- [Terraform](https://www.terraform.io/downloads) >= 0.13.0
- [terraform-provider-google plugin](https://github.com/hashicorp/terraform-provider-google) < 5.0, >= 2.12
- [terraform-provider-google-beta plugin](https://github.com/hashicorp/terraform-provider-google-beta) < 5.0, >= 3.45


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.3 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudrun_app"></a> [cloudrun\_app](#module\_cloudrun\_app) | ../../../../modules/cloudrun | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.networking](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.project_id](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudrun_service_app_config"></a> [cloudrun\_service\_app\_config](#input\_cloudrun\_service\_app\_config) | cloudrun configuration for App1 application | `any` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | Port number the container listens on. This must be a valid port number, 0 < x < 65536. | `string` | `"3000"` | no |
| <a name="input_cpu_limits"></a> [cpu\_limits](#input\_cpu\_limits) | The maximum amount of compute cpu limit allowed. | `string` | `"1000m"` | no |
| <a name="input_cpu_requests"></a> [cpu\_requests](#input\_cpu\_requests) | Minimum amount of compute cpu required | `string` | `"100m"` | no |
| <a name="input_member"></a> [member](#input\_member) | The member name who has the particular role | `string` | `"allUsers"` | no |
| <a name="input_memory_limits"></a> [memory\_limits](#input\_memory\_limits) | The maximum amount of compute memory limit allowed. | `string` | `"128Mi"` | no |
| <a name="input_memory_requests"></a> [memory\_requests](#input\_memory\_requests) | Minimum amount of compute memory required | `string` | `"128Mi"` | no |
| <a name="input_networking_prefix_path"></a> [networking\_prefix\_path](#input\_networking\_prefix\_path) | The Terraform state bucket prefix path for the networking | `string` | n/a | yes |
| <a name="input_project_id_prefix_path"></a> [project\_id\_prefix\_path](#input\_project\_id\_prefix\_path) | The Terraform state bucket prefix path for the project\_id | `string` | n/a | yes |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | Name of the region for cloudrun | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudrun_app_app_service_name"></a> [cloudrun\_app\_app\_service\_name](#output\_cloudrun\_app\_app\_service\_name) | Name of the Cloud Run service |
| <a name="output_cloudrun_app_app_url"></a> [cloudrun\_app\_app\_url](#output\_cloudrun\_app\_app\_url) | URL at which the service is available |


* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure
