## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google. 

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud_build_worker_pool"></a> [cloud\_build\_worker\_pool](#module\_cloud\_build\_worker\_pool) | ../../../modules/worker_pool | n/a |

## Resources

| Name | Type |
|------|------|
| [null_resource.setup](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [terraform_remote_state.gke_cluster](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.host_project_id](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.service_project_id](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.vpc_network](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.vpn](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_build_worker_pool"></a> [cloud\_build\_worker\_pool](#input\_cloud\_build\_worker\_pool) | workerpool configuration | <pre>map(object({<br>  pool_name               = string<br>  disk_size_gb            = string<br>  machine_type            = string<br>  no_external_ip_bool     = bool<br>  }))</pre> | <pre>{<br>  "cloud_build_worker_pool": {<br>    "disk_size_gb": "",<br>    "machine_type": "",<br>    "no_external_ip_bool": true,<br>    "pool_name": ""<br>  }<br>}</pre> | no |
| <a name="input_gke_prefix_path"></a> [gke\_prefix\_path](#input\_gke\_prefix\_path) | The Terraform state bucket prefix path for the gke\_cluster. | `string` | `""` | no |
| <a name="input_gke_state_bucket"></a> [gke\_state\_bucket](#input\_gke\_state\_bucket) | The Terraform state bucket name for the gke\_cluster. | `string` | `""` | no |
| <a name="input_host_project_prefix_path"></a> [host\_project\_prefix\_path](#input\_host\_project\_prefix\_path) | The Terraform state bucket prefix path for the Project ID. | `string` | `""` | no |
| <a name="input_network_prefix_path"></a> [network\_prefix\_path](#input\_network\_prefix\_path) | The Terraform state bucket prefix path for the vpc. | `string` | `""` | no |
| <a name="input_network_state_bucket"></a> [network\_state\_bucket](#input\_network\_state\_bucket) | The Terraform state bucket name for the vpc. | `string` | `""` | no |
| <a name="input_project_state_bucket"></a> [project\_state\_bucket](#input\_project\_state\_bucket) | The Terraform state bucket name for the Project ID. | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | Region name | `string` | `""` | no |
| <a name="input_service_project_prefix_path"></a> [service\_project\_prefix\_path](#input\_service\_project\_prefix\_path) | The Terraform state bucket prefix path for the Project ID. | `string` | `""` | no |
| <a name="input_vpn_prefix_path"></a> [vpn\_prefix\_path](#input\_vpn\_prefix\_path) | The Terraform state bucket prefix path for the vpn. | `string` | `""` | no |
| <a name="input_vpn_state_bucket"></a> [vpn\_state\_bucket](#input\_vpn\_state\_bucket) | The Terraform state bucket name for the vpn. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_details"></a> [details](#output\_details) | worker pool project id |

* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure
