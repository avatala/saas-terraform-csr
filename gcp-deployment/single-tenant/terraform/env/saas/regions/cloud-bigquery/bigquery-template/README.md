## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Terraform Google Cloud Bigquery Module

This example illustrates how to create a simple Cloud BigQuery Dataset.

## Compatibility

This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue. If you haven't [upgraded](https://www.terraform.io/language/upgrade-guides/0-13)

## Usage

Basic usage of the module as follows:

- For `saas-bigquery` BigQuery Dataset
```
module "saas_bigquery_dataset" {
  source                     = "../../modules/terraform-google-bigquery/"
  project_id                 = data.terraform_remote_state.project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  for_each                   = var.saas_bigquery_dataset
  dataset_id                 = each.value.dataset_id
  description                = each.value.description
  location                   = each.value.location
  delete_contents_on_destroy = each.value.delete_contents_on_destroy
  
  dataset_labels             = each.value.dataset_labels

  access = [
    {
      role          = each.value.role
      user_by_email = each.value.user_by_email
    }
  ]
}
```

To provision this example, run the following from within this directory:
- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs Variables

- Cloud BigQuery Dataset variables:

| Name                                  | Description | Type | Default | Required |
|---------------------------------------|-------------|------|---------|:--------:|
| project\_id                           | Project ID in which private service access will provision | `string` | `""` | yes |
| dataset\_id                           | ID for the Dataset | `string` | `""` | yes |
| description                           | Description for the Dataset | `string` | `""` | yes |
| location                              | Location where the Dataset will reside | `string` | `asia-south1` | yes |
| role                                  | Describes the rights granted to the user specified by the other member of the access object. | `string` | `""` | yes |
| user\_by\_email                       | An email address of a user to grant access to | `string` | `""` | yes |
| delete\_contents\_on\_destroy         | Whether or not to enable the deletion for content on destroying dataset | `bool` | `false` | yes |
| dataset\_labels                       | Labels to be used for Dataset | `map(string)` | `{}` | yes |

## Local Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| saas\_bigquery\_project\_id | ID of the project in which the resource will provision | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| saas\_bigquery\_dataset | Complete Dataset module for Cloud Bigquery |

## Permissions

In order to execute this module you must have a Service Account with the following permissions and roles:
- `roles/bigquery.dataEditor`

## Terraform Plugins

- [Terraform](https://www.terraform.io/downloads) >= 0.13.0
- [terraform-provider-google plugin](https://github.com/hashicorp/terraform-provider-google) < 5.0, >= 2.12
- [terraform-provider-google-beta plugin](https://github.com/hashicorp/terraform-provider-google-beta) < 5.0, >= 3.45
