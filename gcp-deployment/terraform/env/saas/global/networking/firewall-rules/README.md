## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Firewall Rule Module

This module makes it easy to provision and manage a network firewall rule.

It supports creating:

- Firewall rules

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html)

## Usage

Basic usage of this module is as follows:

- This module creates firewall rules.
```
module "main_vpc_firewall_rules" {
  source       = "../../../../../modules/terraform-google-network/firewall-rules/"
  project_id   = data.terraform_remote_state.project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  network_name = data.terraform_remote_state.vpc_network.outputs.vpc_networks.vpc_network_01["network_name"]
  rules        = var.main_vpc_firewall_rules
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
| main\_vpc\_firewall\_rules | List of custom firewall rule definitions. | <pre>list(object({<br>    name                    = string<br>    description             = string<br>    direction               = string<br>    priority                = number<br>    ranges                  = list(string)<br>    source_tags             = list(string)<br>    source_service_accounts = list(string)<br>    target_tags             = list(string)<br>    target_service_accounts = list(string)<br>    allow = list(object({<br>      protocol = string<br>      ports    = list(string)<br>    }))<br>    deny = list(object({<br>      protocol = string<br>      ports    = list(string)<br>    }))<br>    log_config = object({<br>      metadata = string<br>    })<br>  }))</pre> | <pre>{<br>    name                    = ""<br>    description             = ""<br>    direction               = ""<br>    priority                = 100<br>    ranges                  = []<br>    source_tags             = null<br>    source_service_accounts = null<br>    target_tags             = null<br>    target_service_accounts = null<br>    allow = [{<br>      protocol = ""<br>      ports    = []<br>    }]<br>    deny = []<br>    log_config = {<br>      metadata = ""<br>    }<br>}</pre> | yes |


## Outputs

| Name | Description |
|------|-------------|
| main\_vpc\_firewall\_rules | The details of the created firewall rules. |

## Permissions

In order to execute this module you must have a Service Account with the following permissions and roles:

- `roles/compute.admin` on the project

## APIs

In order to operate this module, you must activate the following APIs on the project:

- Compute Engine API - `compute.googleapis.com`

## Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13.0
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin <5.0,>= 2.12