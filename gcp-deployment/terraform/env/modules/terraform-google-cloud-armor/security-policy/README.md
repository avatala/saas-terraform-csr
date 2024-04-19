## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Google Cloud Armor Security Policy Terraform Module

This module can be used to create and manage Cloud Armor Security Policy. A Security Policy defines an IP blacklist or whitelist that protects load balanced Google Cloud services by denying or permitting traffic from specified IP ranges.

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html)

## Usage

Basic usage of this module is as follows:

```
module "security_policy" {
  source        = "../../../../../modules/terraform-google-cloud-armor/security-policy"
  project       = var.project
  name          = var.name
  default_rules = var.default_rules
  waf_rules     = var.waf_rules
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
| project | The project ID in which the resource belongs. If it is not provided, the provider project is used. | `string` | `""` | yes |
| name | The name of the security policy. | `string` | `""` | yes |
| default\_rules | The rules for configuring set of IP addresses or ranges. | <pre>list(object({<br>    action         = string,<br>    priority       = string,<br>    versioned_expr = string,<br>    src_ip_ranges  = list(string),<br>    description    = string<br>}))</pre> | <pre>[{<br>    action         = ""<br>    priority       = ""<br>    versioned_expr = ""<br>    src_ip_ranges  = [""]<br>    description    = ""<br>}]</pre> | yes |
| waf\_rules | WAF rules for the security policy. | <pre>list(object({<br>    action      = string,<br>    priority    = string,<br>    expression  = string,<br>    description = string<br>}))</pre> | <pre>[{<br>    action      = ""<br>    priority    = ""<br>    expression  = ""<br>    description = ""<br>}]</pre> | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | An identifier for the resource with format. | 
| fingerprint | Fingerprint of this resource. |
| self\_link | The URI of the created resource. | 

## Permissions

In order to execute this module you must have a Service Account with the following permissions and roles:
- `roles/compute.securityAdmin`

## APIs

In order to operate this module, you must activate the following APIs on the project:

- Compute Engine API - `compute.googleapis.com`

## Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin >= 3.53, < 5.0