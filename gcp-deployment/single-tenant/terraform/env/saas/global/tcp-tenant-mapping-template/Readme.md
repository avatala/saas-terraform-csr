## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |


## Resources

| Name | Type |
|------|------|
| [null_resource.delete_private](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.delete_public](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.setup_private](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.setup_public](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [terraform_remote_state.host_project_id](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.lb](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.private_dns](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.public_dns](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.service_project_id](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_state_bucket"></a> [dns\_state\_bucket](#input\_dns\_state\_bucket) | The Terraform state bucket name for the dns ID. | `string` | `""` | no |
| <a name="input_host_project_prefix_path"></a> [host\_project\_prefix\_path](#input\_host\_project\_prefix\_path) | The Terraform state bucket prefix path for the host Project IDs. | `string` | `""` | no |
| <a name="input_lb_prefix_path"></a> [lb\_prefix\_path](#input\_lb\_prefix\_path) | The Terraform state bucket prefix path for the LB. | `string` | `""` | no |
| <a name="input_lb_state_bucket"></a> [lb\_state\_bucket](#input\_lb\_state\_bucket) | The Terraform state bucket name for the LB. | `string` | `""` | no |
| <a name="input_private_dns_prefix_path"></a> [private\_dns\_prefix\_path](#input\_private\_dns\_prefix\_path) | The Terraform state bucket prefix path for the private dns ID. | `string` | `""` | no |
| <a name="input_project_state_bucket"></a> [project\_state\_bucket](#input\_project\_state\_bucket) | The Terraform state bucket name for the Project ID. | `string` | `""` | no |
| <a name="input_public_dns_prefix_path"></a> [public\_dns\_prefix\_path](#input\_public\_dns\_prefix\_path) | The Terraform state bucket prefix path for the public dns ID. | `string` | `""` | no |
| <a name="input_service_project_prefix_path"></a> [service\_project\_prefix\_path](#input\_service\_project\_prefix\_path) | The Terraform state bucket prefix path for the service Project ID. | `string` | `""` | no |

* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure

