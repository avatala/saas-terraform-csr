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
| <a name="module_certificate_manager"></a> [certificate\_manager](#module\_certificate\_manager) | ../../../modules/terraform-google-certificate-manager-module/ | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.host_project_id](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.public_dns](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_manager"></a> [certificate\_manager](#input\_certificate\_manager) | certificate manager creation | `any` | n/a | yes |
| <a name="input_host_project_prefix_path"></a> [host\_project\_prefix\_path](#input\_host\_project\_prefix\_path) | The Terraform state bucket prefix path for the Project ID. | `string` | `""` | no |
| <a name="input_host_project_state_bucket"></a> [host\_project\_state\_bucket](#input\_host\_project\_state\_bucket) | The Terraform state bucket name for the Project ID. | `string` | `""` | no |
| <a name="input_public_dns_prefix_path"></a> [public\_dns\_prefix\_path](#input\_public\_dns\_prefix\_path) | The Terraform state bucket prefix path for the dns. | `string` | `""` | no |
| <a name="input_public_dns_state_bucket"></a> [public\_dns\_state\_bucket](#input\_public\_dns\_state\_bucket) | The Terraform state bucket name for the dns. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificates"></a> [certificates](#output\_certificates) |

* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure
