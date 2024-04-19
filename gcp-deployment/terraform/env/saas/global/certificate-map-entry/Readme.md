## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.43.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | 4.43.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_enterprise_certificate_manager_map"></a> [enterprise\_certificate\_manager\_map](#module\_enterprise\_certificate\_manager\_map) | ../../../modules/terraform-google-certificate-map-modules/ | n/a |
| <a name="module_freemium_certificate_manager_map"></a> [freemium\_certificate\_manager\_map](#module\_freemium\_certificate\_manager\_map) | ../../../modules/terraform-google-certificate-map-modules/ | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.certificates](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.host_project_id](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificates_prefix_path"></a> [certificates\_prefix\_path](#input\_certificates\_prefix\_path) | The Terraform state bucket prefix path for the certificates. | `string` | `""` | no |
| <a name="input_certificates_state_bucket"></a> [certificates\_state\_bucket](#input\_certificates\_state\_bucket) | The Terraform state bucket name for the certificates. | `string` | `""` | no |
| <a name="input_enterprise_certificate_manager_map"></a> [enterprise\_certificate\_manager\_map](#input\_enterprise\_certificate\_manager\_map) | configuration of enterprise certificate manager map | `any` | n/a | yes |
| <a name="input_freemium_certificate_manager_map"></a> [freemium\_certificate\_manager\_map](#input\_freemium\_certificate\_manager\_map) | configuration of cerficate manager map | `any` | n/a | yes |
| <a name="input_host_project_prefix_path"></a> [host\_project\_prefix\_path](#input\_host\_project\_prefix\_path) | The Terraform state bucket prefix path for the Project ID. | `string` | `""` | no |
| <a name="input_project_state_bucket"></a> [project\_state\_bucket](#input\_project\_state\_bucket) | The Terraform state bucket name for the Project ID. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_enterprise_map_id"></a> [enterprise\_map\_id](#output\_enterprise\_map\_id) | n/a |
| <a name="output_freemium_map_id"></a> [freemium\_map\_id](#output\_freemium\_map\_id) |


* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure