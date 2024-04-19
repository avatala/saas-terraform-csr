## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Private Service Access Module

This module makes it easy to provision and manage a private service access.

It supports creating:

- Private Service Access

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html)

## Usage

Basic usage of this module is as follows:

- This module creates Private Service Access.

```
module "main_vpc_private_service_access" {
  source                  = "../../../../../modules/terraform-google-private-service-access"
  for_each                = var.main_vpc_private_service_access
  project_id              = data.terraform_remote_state.project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  vpc_network_self_link   = data.terraform_remote_state.vpc_network.outputs.vpc_networks.vpc_network_01["network_self_link"]
  name                    = each.value.name
  address                 = each.value.address
  prefix_length           = each.value.prefix_length
  labels                  = each.value.labels
  reserved_peering_ranges = each.value.reserved_peering_ranges
}
```

Then perform the following commands on the root folder:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_state\_bucket | The Terraform state bucket name for the Project ID. | `string` | `""` | yes |
| project\_prefix\_path | The Terraform state bucket prefix path for the Project ID. | `string` | `""` | yes |
| network\_state\_bucket | The Terraform state bucket name for the Network Name. | `string` | `""` | yes |
| network\_prefix\_path | The Terraform state bucket prefix path for the Network Name. | `string` | `""` | yes |
| main\_vpc\_private\_service\_access | The details of the Private Service Access. | <pre>object({<br>    name                    = string,<br>    address                 = string,<br>    prefix_length           = number,<br>    labels                  = map(string),<br>    reserved_peering_ranges = list(string)<br>})</pre> | <pre>{<br>    name                    = ""<br>    address                 = ""<br>    prefix_length           = 16<br>    labels                  = {}<br>    reserved_peering_ranges = []<br>}</pre> | yes |

## Outputs

| Name | Description |
|------|-------------|
| main\_vpc\_private\_service\_access | The details of the created Private Service Access. | 

## Permissions

In order to execute this module you must have a Service Account with the following permissions and roles:

- `roles/compute.networkAdmin` on the project

## APIs

In order to operate this module, you must activate the following APIs on the project:

- Compute Engine API - `compute.googleapis.com`
- Service Networking API - `servicenetworking.googleapis.com`

## Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin >= 3.53, < 5.0
- [terraform-provider-google-beta](https://github.com/terraform-providers/terraform-provider-google-beta) plugin >= 3.53, < 5.0