## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Secret Manager Terraform Module

This module can be used to create and manage Secret manager. 

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html)

## Usage

Basic usage of this module is as follows:

```
module "secret_manager" {
  source     = "../../../modules/terraform-google-secret-manager"
  for_each   = var.secret_manager
  project_id = var.project_id
  id         = each.value.id
  secret     = each.value.secret
  labels     = each.value.labels
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
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Id of the project | `string` | n/a | yes |
| <a name="input_secret_manager"></a> [secret\_manager](#input\_secret\_manager) | The details of the Secret Manager. | <pre>map(object({<br>    id=string,<br>    secret=string,<br>    labels=map(string)<br><br>  }))</pre> | <pre>{<br>  "secret_manager": {<br>    "id": "",<br>    "labels": {},<br>    "secret": ""<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret_manager"></a> [secret\_manager](#output\_secret\_manager) | The fully-qualified id of the Secret Manager key that contains the secret. |


## Permissions

In order to execute this module you must have a Service Account with the following permissions and roles:
- `roles/secretmanager.admin`

## APIs

In order to operate this module, you must activate the following APIs on the project:

- Compute Engine API - `secretmanager.googleapis.com.`

## Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin >= 3.53, < 5.0
