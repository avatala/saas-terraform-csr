## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Cloud Armor Security Policy Terraform Module

This module can be used to create and manage Cloud Armor Security Policy. A Security Policy defines an IP blacklist or whitelist that protects load balanced Google Cloud services by denying or permitting traffic from specified IP ranges.

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html)

## Usage

Basic usage of this module is as follows:

```
module "security_policies" {
  source        = "../../../../../modules/terraform-google-cloud-armor/security-policy"
  for_each      = var.security_policies
  project       = data.terraform_remote_state.project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  name          = each.value.name
  default_rules = each.value.default_rules
  waf_rules     = each.value.waf_rules
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
| security\_policies | The details of the Cloud Armor Security Policies. | <pre>map(object({<br>    name = string,<br>    default_rules = list(object({<br>      action         = string,<br>      priority       = string,<br>      versioned_expr = string,<br>      src_ip_ranges  = list(string),<br>      description    = string<br>    }))<br>    waf_rules = list(object({<br>      action      = string,<br>      priority    = string,<br>      expression  = string,<br>      description = string<br>    }))<br>}))<pre> | <pre>security_policy = {<br>    name          = ""<br>    default_rules = []<br>    waf_rules     = []<br>}</pre> | yes |

## Outputs

| Name | Description |
|------|-------------|
| security\_policies | The details of the created Cloud Armor Security Policy. |

## Permissions

In order to execute this module you must have a Service Account with the following permissions and roles:
- `roles/compute.securityAdmin`

## APIs

In order to operate this module, you must activate the following APIs on the project:

- Compute Engine API - `compute.googleapis.com`

## Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin >= 3.53, < 5.0