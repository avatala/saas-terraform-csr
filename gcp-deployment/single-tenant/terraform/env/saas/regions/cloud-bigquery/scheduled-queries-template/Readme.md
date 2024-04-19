## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_svc_prjct_scheduled_queries01"></a> [svc\_prjct\_scheduled\_queries01](#module\_svc\_prjct\_scheduled\_queries01) | ../../../../modules/scheduled_queries | n/a |
| <a name="module_svc_prjct_scheduled_queries02"></a> [svc\_prjct\_scheduled\_queries02](#module\_svc\_prjct\_scheduled\_queries02) | ../../../../modules/scheduled_queries | n/a |
| <a name="module_svc_prjct_scheduled_queries03"></a> [svc\_prjct\_scheduled\_queries03](#module\_svc\_prjct\_scheduled\_queries03) | ../../../../modules/scheduled_queries | n/a |
| <a name="module_svc_prjct_scheduled_queries04"></a> [svc\_prjct\_scheduled\_queries04](#module\_svc\_prjct\_scheduled\_queries04) | ../../../../modules/scheduled_queries | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.bigquery_dataset_id](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.service_project_id](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dataset_prefix_path"></a> [dataset\_prefix\_path](#input\_dataset\_prefix\_path) | The Terraform state bucket prefix path for the bigquery dataset | `string` | n/a | yes |
| <a name="input_dataset_state_bucket"></a> [dataset\_state\_bucket](#input\_dataset\_state\_bucket) | The Terraform state bucket name for the bigquery dataset | `string` | n/a | yes |
| <a name="input_project_state_bucket"></a> [project\_state\_bucket](#input\_project\_state\_bucket) | The Terraform state bucket name for the Project IDs. | `string` | `""` | no |
| <a name="input_service_project_prefix_path"></a> [service\_project\_prefix\_path](#input\_service\_project\_prefix\_path) | The Terraform state bucket prefix path for the Project ID. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_query_names02"></a> [query\_names02](#output\_query\_names02) | The resource names of the transfer config |
| <a name="output_query_names03"></a> [query\_names03](#output\_query\_names03) | The resource names of the transfer config |


* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure
