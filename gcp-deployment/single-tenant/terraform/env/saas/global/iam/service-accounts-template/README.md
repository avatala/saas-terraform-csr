## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Service Account Module

This module allows us to create service accounts.

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html)

## Usage

Basic usage of this module is as follows:

```
module "service_accounts" {
  source       = "../../../../../modules/terraform-google-service-accounts"
  project_id   = data.terraform_remote_state.project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  for_each     = var.service_accounts
  prefix       = each.value.prefix
  names        = each.value.names
  display_name = each.value.display_name
  description  = each.value.description
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
| service\_account | The details of the service account | <pre>map(object({<br>    prefix       = string,<br>    names        = list(string),<br>    display_name = string,<br>    description  = string<br>}))</pre> | <pre>service_account = {<br>    prefix       = ""<br>    names        = []<br>    display_name = ""<br>    description  = ""<br>}</pre> | yes |

## Outputs

| Name | Description |
|------|-------------|
| service_accounts | The details of the created Service Accounts. |

## Permissions

- Service Account Admin: `roles/iam.serviceAccountAdmin`
- (optional) Service Account Key Admin: `roles/iam.serviceAccountKeyAdmin` when generate_keys is set to true
- (optional) roles needed to grant optional IAM roles at the project or organizational level

## Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin >= 3.53, < 5.0