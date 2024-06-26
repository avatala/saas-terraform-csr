## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Module Member IAM

This optional module is used to assign service account roles

## Example Usage
```
module "member_roles" {
  source          = "terraform-google-modules/iam/google//modules/member_iam"
  service_account = "my-sa@my-project.iam.gserviceaccount.com"
  project         = "my-project-one"
  project_roles   = ["roles/compute.networkAdmin", "roles/appengine.appAdmin"]
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| project\_id | Project id | string | n/a | yes |
| project\_roles | List of IAM roles | list(string) | n/a | yes |
| service\_account\_address | Service account address | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| project\_id | Project id. |
| roles | Project roles. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
