## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.53, < 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_custom_roles"></a> [custom\_roles](#module\_custom\_roles) | ../../../../modules/terraform-google-custom-roles | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.service_project_id](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_roles"></a> [custom\_roles](#input\_custom\_roles) | The details of the service accounts. | <pre>map(object({<br>    role_id      = string,<br>    permissions = list(string)<br>  }))</pre> | <pre>{<br>  "service_account": {<br>    "permissions": [],<br>    "role_id": ""<br>  }<br>}</pre> | no |
| <a name="input_project_state_bucket"></a> [project\_state\_bucket](#input\_project\_state\_bucket) | The Terraform state bucket name for the Project ID. | `string` | `""` | no |
| <a name="input_service_project_prefix_path"></a> [service\_project\_prefix\_path](#input\_service\_project\_prefix\_path) | The Terraform state bucket prefix path for the Project ID. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_roles"></a> [custom\_roles](#output\_custom\_roles) | The details of the created Service Accounts. |


* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure