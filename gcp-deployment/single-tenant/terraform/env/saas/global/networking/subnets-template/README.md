## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Network Module

This module makes it easy to provision a Network setup in GCP by defining your network and subnet ranges in a concise syntax.

It supports creating:

- Subnets within the VPC
- Secondary ranges for the subnets (if applicable)

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html)

## Usage

Basic usage of this module is as follows:

- This module creates subnets and secondary ranges.

```
module "subnets" {
  source           = "../../../../../modules/terraform-google-network/subnets-beta"
  project_id       = var.project_id
  for_each         = var.subnets
  network_name     = each.value.network_name
  subnets          = each.value.subnets
  secondary_ranges = each.value.secondary_ranges
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
| subnets | The details of the subnets which will be created, the list of secondary ranges that will be used in some of the subnets. | <pre>map(object({<br>    network_name = string,<br>    subnets      = list(map(string)),<br>    secondary_ranges = map(list(object({<br>      range_name    = string,<br>      ip_cidr_range = string<br>    })))<br>}))</pre> | <pre>subnet = {<br>    network_name     = ""<br>    subnets          = []<br>    secondary_ranges = {}<br>}</pre> | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnets | The details of the created subnets. |

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