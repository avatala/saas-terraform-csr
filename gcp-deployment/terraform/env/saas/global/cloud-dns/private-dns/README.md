## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Cloud DNS Private Zone Module

This module creates Cloud DNS private zones and manage their records.

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html)


## Usage

Basic usage of this module is as follows:

* This module creates private DNS zone.

```
module "dns_private_zones" {
  source                             = "../../../../modules/terraform-google-cloud-dns/"
  for_each                           = var.dns_private_zones
  project_id                         = data.terraform_remote_state.project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  type                               = "private"
  name                               = each.value.name
  description                        = each.value.description
  domain                             = each.value.domain
  labels                             = each.value.labels
  recordsets                         = each.value.recordsets
  private_visibility_config_networks = [data.terraform_remote_state.vpc_network.outputs.vpc_networks.vpc_network_01["network_self_link"]]
}
```


Then perform the following commands on the root folder:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure


## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_state\_bucket | The Terraform state bucket name for the Project ID. | `string` | `""` | yes |
| project\_prefix\_path | The Terraform state bucket prefix path for the Project ID. | `string` | `""` | yes |
| network\_state\_bucket | The Terraform state bucket name for the Network Name. | `string` | `""` | yes |
| network\_prefix\_path | The Terraform state bucket prefix path for the Network Name. | `string` | `""` | yes |
| type | Type of zone to create, valid values are 'public', 'private', 'forwarding', 'peering'. | `string` | `private` | yes |
| dns\_private\_zones | The details of the Cloud DNS private zones. | <pre>map(object({<br>    name        = string,<br>    description = string,<br>    domain      = string,<br>    recordsets = list(object({<br>      name    = string,<br>      type    = string,<br>      ttl     = number,<br>      records = list(string)<br>    }))<br>    labels = map(string)<br>}))</pre> | <pre>dns_private_zone = {<br>    name        = ""<br>    description = ""<br>    domain      = ""<br>    recordsets  = []<br>    labels      = {}<br>}</pre> | yes |

## Outputs

| Name | Description |
|------|-------------|
| dns\_private\_zones | The details of the created Cloud DNS private zones. |

## Permissions

In order to execute this module you must have a Service Account with the following permissions and roles:
- `roles/dns.admin`

## APIs

In order to operate this module, you must activate the following APIs on the project:

- Cloud DNS API - `dns.googleapis.com`

## Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13.0
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin >= 3.53, < 5.0
- [terraform-provider-google-beta](https://github.com/terraform-providers/terraform-provider-google-beta) plugin >= 3.53, < 5.0