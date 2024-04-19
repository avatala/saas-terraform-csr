## License
---
Copyright 2022 Google LLC.  
This software is provided as-is, without warranty or representation for any use or purpose.  
Your use of it is subject to your agreement with Google.  

# Google Cloud Storage Module

This module makes it easy to create one or more GCS buckets, and assign basic permissions on them to arbitrary users.

- One or more GCS buckets
- Zero or more IAM bindings for those buckets

## Usage

Basic usage of this module is as follows:

```hcl
resource "google_storage_bucket" "bucket" {
  name               = var.name
  project            = var.project_id
  location           = var.location
  storage_class      = var.storage_class
  uniform_bucket_level_access = var.uniform_bucket_level_access
  labels             = var.labels
  force_destroy      = var.force_destroy

  versioning {
    enabled = var.versioning
  }

  dynamic "retention_policy" {
    for_each = var.retention_policy == null ? [] : [var.retention_policy]
    content {
      is_locked        = var.retention_policy.is_locked
      retention_period = var.retention_policy.retention_period
    }
  }

  dynamic "encryption" {
    for_each = var.encryption == null ? [] : [var.encryption]
    content {
      default_kms_key_name = var.encryption.default_kms_key_name
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rule == null ? [] : [var.lifecycle_rule]
    content {
      dynamic "action" {
        for_each = var.lifecycle_rule.action == null ? [] : [var.lifecycle_rule.action]
        content {
          type          = var.lifecycle_rule.action.type
          storage_class = var.lifecycle_rule.action.storage_class
        }
      }
      dynamic "condition" {
        for_each = var.lifecycle_rule.condition == null ? [] : [var.lifecycle_rule.condition]
        content {
          age                        = var.lifecycle_rule.condition.age
          created_before             = var.lifecycle_rule.condition.created_before
          with_state                 = var.lifecycle_rule.condition.with_state
          matches_storage_class      = var.lifecycle_rule.condition.matches_storage_class
          num_newer_versions         = var.lifecycle_rule.condition.num_newer_versions
          custom_time_before         = var.lifecycle_rule.condition.custom_time_before
          days_since_custom_time     = var.lifecycle_rule.condition.days_since_custom_time
          days_since_noncurrent_time = var.lifecycle_rule.condition.days_since_noncurrent_time
          noncurrent_time_before     = var.lifecycle_rule.condition.noncurrent_time_before
        }
      }
    }
  }
}

resource "google_storage_bucket_iam_member" "members" {
  for_each = {
    for m in var.iam_members : "${m.role} ${m.member}" => m
  }
  bucket = google_storage_bucket.bucket.name
  role   = each.value.role
  member = each.value.member
}
```
Then perform the following commands on the root folder:
​
- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

## Inputs


| Name | Description | Type
|------|-------------|------|
| name | The name of the bucket| string |
| project_id | The ID of the project to create the bucket in | string |
| location | The location of the bucket | string |
| storage_class | The Storage Class of the new bucket | string |
| labels | A set of key/value label pairs to assign to the bucket | map(string) | 
| uniform_bucket_level_access | Enables Uniform bucket-level access access to a bucket | bool |
| versioning | While set to true, versioning is fully enabled for this bucket | bool | 
| force_destroy | When deleting a bucket, this boolean option will delete all contained objects. If false, Terraform will fail to delete buckets which contain objects | bool |
| iam_members | The list of IAM members to grant permissions on the bucket | <pre>list(object({<br>    role   = string<br>    member = string<br>  }))</pre> |
| retention_policy | Configuration of the bucket's data retention policy for how long objects in the bucket should be retained | <pre>object({<br>    is_locked        = bool<br>    retention_period = number<br>  })</pre> |
| encryption | A Cloud KMS key that will be used to encrypt objects inserted into this bucket | <pre>object({<br>    default_kms_key_name = string<br>  })</pre> |
| lifecycle_rule | lifecycle rule | <pre>object({<br>    action = object({<br>      type          = string<br>      storage_class = string<br>    })<br>    condition = object({<br>      age                        = number<br>      created_before             = string<br>      with_state                 = string<br>      matches_storage_class      = list(string)<br>      num_newer_versions         = number<br>      custom_time_before         = string<br>      days_since_custom_time     = number<br>      days_since_noncurrent_time = number<br>      noncurrent_time_before     = string<br>    })<br>  })</pre> |

## Outputs​
| Name | Description |
|------|-------------|
| bucket | The created storage bucket |
| name | The created storage bucket |
## Permissions
User or service account credentials with the following roles must be used to provision the resources of this module: <br>
- Storage Admin: `roles/storage.admin`

## APIs
In order to operate this module, you must activate the following APIs on
the project:

- Cloud Storage API - `storage.googleapis.com`

## Terraform plugins
- Terraform >= 0.12

## Flow of Terraform Commands to follow
Perform the following commands on the root folder:
​
- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure


## The Terraform resources will consists of following structure
```
├── README.md                 // Description of the module and what it should be used for.
├── main.tf                   // The primary entrypoint for terraform resources.
├── variables.tf              // It contain the declarations for variables.
├── outputs.tf                // It contain the declarations for outputs.
├── versions.tf               // To specify terraform versions.
```


