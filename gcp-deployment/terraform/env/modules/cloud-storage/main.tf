# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

resource "google_storage_bucket" "bucket" {
  name               = var.name
  project            = var.project_id
  location           = var.location
  storage_class      = var.storage_class
  uniform_bucket_level_access = var.uniform_bucket_level_access
  public_access_prevention = var.public_access_prevention
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
    for_each = var.kms_key_path == "null" ? [] : [var.kms_key_path]
    content {
      default_kms_key_name = var.kms_key_path
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
