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
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.gcs](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.host_project_id](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.vpc_network](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcs_prefix_path"></a> [gcs\_prefix\_path](#input\_gcs\_prefix\_path) | The Terraform state bucket prefix path for the GCS bucket | `string` | `""` | no |
| <a name="input_gcs_state_bucket"></a> [gcs\_state\_bucket](#input\_gcs\_state\_bucket) | The Terraform state bucket name for the GCS bucket | `string` | `""` | no |
| <a name="input_host_project_prefix_path"></a> [host\_project\_prefix\_path](#input\_host\_project\_prefix\_path) | The Terraform state bucket prefix path for the Project ID. | `string` | `""` | no |
| <a name="input_host_project_state_bucket"></a> [host\_project\_state\_bucket](#input\_host\_project\_state\_bucket) | The Terraform state bucket name for the Project ID. | `string` | `""` | no |
| <a name="input_mig_template"></a> [mig\_template](#input\_mig\_template) | configuration of mig and template | `any` | n/a | yes |
| <a name="input_network_prefix_path"></a> [network\_prefix\_path](#input\_network\_prefix\_path) | The Terraform state bucket prefix path for the network | `string` | `""` | no |
| <a name="input_network_state_bucket"></a> [network\_state\_bucket](#input\_network\_state\_bucket) | The Terraform state bucket name for the network | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mig_instance_group"></a> [mig\_instance\_group](#output\_mig\_instance\_group) | Instance-group url of managed instance group |
| <a name="output_mig_instance_group_manager"></a> [mig\_instance\_group\_manager](#output\_mig\_instance\_group\_manager) | An instance of google\_compute\_region\_instance\_group\_manager of the instance group. |
| <a name="output_mig_self_link"></a> [mig\_self\_link](#output\_mig\_self\_link) | Self-link of managed instance group |

* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure
