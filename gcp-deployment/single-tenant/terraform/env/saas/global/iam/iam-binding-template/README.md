## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Project IAM Binding Module

This module allows us to create the iam bindings at project level.

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html)

## Usage

Basic usage of this module is as follows:

```
module "project_iam_bindings" {
  source   = "../../../modules/terraform-google-iam/projects-iam/"
  for_each = var.project_iam_bindings
  projects = each.value.projects
  mode     = "additive"
  bindings = each.value.bindings
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
| project\_iam\_bindings | The details of the project IAM bindings. | <pre>map(object({<br>    projects = list(string),<br>    bindings = map(list(string))<br>}))</pre> | <pre>project_iam_binding = {<br>    projects = []<br>    bindings = {}<br>}</pre> | yes |
| mode | Mode for adding the IAM policies/bindings, additive and authoritative | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| project\_iam\_bindings | The details of the created project IAM bindings. |

## Permissions
- `roles/resourcemanager.projectIamAdmin`

## APIs
- Identity and Access Management (IAM) API `iam.googleapis.com`

## Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin >= 3.53, < 5.0
