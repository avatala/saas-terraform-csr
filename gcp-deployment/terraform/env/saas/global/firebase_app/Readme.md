## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_firebase_app"></a> [firebase\_app](#module\_firebase\_app) | ../../../modules/firebase_app/ | n/a |
| <a name="module_secret_manager"></a> [secret\_manager](#module\_secret\_manager) | ../../../modules/terraform-google-secret-manager | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.host_project_id](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firebase_app"></a> [firebase\_app](#input\_firebase\_app) | The details of the firebase app | <pre>map(object({<br>    display_name=string,<br>  }))</pre> | <pre>{<br>  "firebase_app": {<br>    "display_name": ""<br>  }<br>}</pre> | no |
| <a name="input_host_project_prefix_path"></a> [host\_project\_prefix\_path](#input\_host\_project\_prefix\_path) | The Terraform state bucket prefix path for the Project IDs. | `string` | `""` | no |
| <a name="input_project_state_bucket"></a> [project\_state\_bucket](#input\_project\_state\_bucket) | The Terraform state bucket name for the Project ID. | `string` | `""` | no |
| <a name="input_seed_project_id"></a> [seed\_project\_id](#input\_seed\_project\_id) | ID of the project that owns the Cloud Source Repository. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firebase_app"></a> [firebase\_app](#output\_firebase\_app) | The details of the created Cloud DNS public zones. |

* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure