## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.16, <4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_admin-portal"></a> [admin-portal](#module\_admin-portal) | ../../../../modules/terraform-google-serverless-neg | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.cloud_run](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.host_project_id](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_run_prefix_path"></a> [cloud\_run\_prefix\_path](#input\_cloud\_run\_prefix\_path) | The Terraform state bucket prefix path for the cloud run. | `string` | `""` | no |
| <a name="input_cloud_run_state_bucket"></a> [cloud\_run\_state\_bucket](#input\_cloud\_run\_state\_bucket) | The Terraform state bucket name for the cloud run. | `string` | `""` | no |
| <a name="input_host_project_prefix_path"></a> [host\_project\_prefix\_path](#input\_host\_project\_prefix\_path) | The Terraform state bucket prefix path for the Project ID. | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | name of the cloud run | `string` | n/a | yes |
| <a name="input_project_state_bucket"></a> [project\_state\_bucket](#input\_project\_state\_bucket) | The Terraform state bucket name for the Project ID. | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | region to deploy network endpoint group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin-portal"></a> [admin-portal](#output\_admin-portal) | n/a |


* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure