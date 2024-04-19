## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Shared VPC Module

This module makes it easy to provision a Network setup in GCP by defining your network and subnet ranges in a concise syntax.

It supports creating:

- A Google Shared Virtual Private Network (SVPC)

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html)

## Usage

Basic usage of this module is as follows:

- This module creates vpc networks.

```
module "vpc" {
    source                  = "../../../../modules/custom-shared-vpc"
    for_each                = var.vpc
    project_id              = var.project_id
    network_name            = var.network_name
    routing_mode            = var.routing_mode
    description             = var.description
    shared_vpc_host         = true
    auto_create_subnetworks = false
    service_project         = each.value.service_project
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
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The VPC name to be created | `any` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project where this VPC will be created | `any` | n/a | yes |
| <a name="input_routing_mode"></a> [routing\_mode](#input\_routing\_mode) | The network routing mode (default 'GLOBAL') | `string` | `"GLOBAL"` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | The details of shared vpc | <pre>map(object({<br>    service_project=string<br>  }))</pre> | <pre>{<br>  "shared-vpc": {<br>    "service_project": ""<br>  }<br>}</pre> | no |


## Outputs

| Name | Description |
|------|-------------|
| vpc\_networks | The details of the created vpc networks. |

## Permissions

In order to execute this module you must have a Service Account with the following permissions and roles:

- `roles/compute.admin` on the project
- `roles/compute.networkAdmin` on the project

If you are going to manage a Shared VPC, you must have either:

- `roles/compute.xpnAdmin` on the organization

## APIs

In order to operate this module, you must activate the following APIs on the project:

- Compute Engine API - `compute.googleapis.com`

## Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13.0
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin < 5.0, >= 2.12
- [terraform-provider-google-beta](https://github.com/terraform-providers/terraform-provider-google-beta) plugin < 5.0, >= 3.45