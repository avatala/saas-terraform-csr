## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.10.0, < 5.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 4.10.0, < 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm"></a> [acm](#module\_acm) | ../../../modules/terraform-google-acm | n/a |
| <a name="module_hub_registration"></a> [hub\_registration](#module\_hub\_registration) | ../../../modules/hub_registration | n/a |
| <a name="module_svc_gke_hub_iam_bindings_01"></a> [svc\_gke\_hub\_iam\_bindings\_01](#module\_svc\_gke\_hub\_iam\_bindings\_01) | ../../../modules/terraform-google-iam/member_iam/ | n/a |
| <a name="module_svc_mesh_iam_bindings_01"></a> [svc\_mesh\_iam\_bindings\_01](#module\_svc\_mesh\_iam\_bindings\_01) | ../../../modules/terraform-google-iam/member_iam/ | n/a |

## Resources

| Name | Type |
|------|------|
| [null_resource.asm_setup](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.gke_hub_bind](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.gke_hub_sa](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.mesh_sa](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.mesh_sa_bind](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.sleep](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [terraform_remote_state.gke_cluster](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.host_project_id](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.service_account](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.service_project_id](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.vpc_network](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_channel"></a> [channel](#input\_channel) | The channel to use for this ASM installation.Must be one of rapid, regular, or stable. | `string` | n/a | yes |
| <a name="input_gke_prefix_path"></a> [gke\_prefix\_path](#input\_gke\_prefix\_path) | The Terraform state bucket prefix path for the gke\_cluster. | `string` | n/a | yes |
| <a name="input_gke_state_bucket"></a> [gke\_state\_bucket](#input\_gke\_state\_bucket) | The Terraform state bucket name for the gke\_cluster. | `string` | n/a | yes |
| <a name="input_host_project_prefix_path"></a> [host\_project\_prefix\_path](#input\_host\_project\_prefix\_path) | The Terraform state bucket prefix path for the Project IDs. | `string` | `""` | no |
| <a name="input_network_prefix_path"></a> [network\_prefix\_path](#input\_network\_prefix\_path) | The Terraform state bucket prefix path for the Network Name. | `string` | `""` | no |
| <a name="input_network_state_bucket"></a> [network\_state\_bucket](#input\_network\_state\_bucket) | The Terraform state bucket name for the Network Name. | `string` | `""` | no |
| <a name="input_policy_dir"></a> [policy\_dir](#input\_policy\_dir) | The path within the Git repository that represents the top level of the repo to sync | `string` | n/a | yes |
| <a name="input_project_state_bucket"></a> [project\_state\_bucket](#input\_project\_state\_bucket) | The Terraform state bucket name for the Project ID. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to host the cluster in | `string` | n/a | yes |
| <a name="input_secret_type"></a> [secret\_type](#input\_secret\_type) | Type of secret configured for access to the Git repo | `string` | n/a | yes |
| <a name="input_service_account_prefix_path"></a> [service\_account\_prefix\_path](#input\_service\_account\_prefix\_path) | The Terraform state bucket prefix path for the service account | `string` | n/a | yes |
| <a name="input_service_account_state_bucket"></a> [service\_account\_state\_bucket](#input\_service\_account\_state\_bucket) | The Terraform state bucket name for the service account | `string` | n/a | yes |
| <a name="input_service_project_prefix_path"></a> [service\_project\_prefix\_path](#input\_service\_project\_prefix\_path) | The Terraform state bucket prefix path for the Project ID. | `string` | n/a | yes |
| <a name="input_source_format"></a> [source\_format](#input\_source\_format) | Specifies whether the Config Sync Repo is in hierarchical or unstructured mode | `string` | n/a | yes |
| <a name="input_sync_branch"></a> [sync\_branch](#input\_sync\_branch) | The branch of the repository to sync from | `string` | n/a | yes |
| <a name="input_sync_repo"></a> [sync\_repo](#input\_sync\_repo) | The URL of the Git repository to use as the source of truth | `string` | n/a | yes |

* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure

