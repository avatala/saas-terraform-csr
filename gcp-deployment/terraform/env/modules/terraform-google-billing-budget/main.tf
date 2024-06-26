# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

locals {
  budget_filter = {
    projects = ["projects/${var.project_id_host}","projects/${var.project_id_service}"]
  }
}
resource "google_billing_budget" "budget" {
  count = var.module_enabled ? 1 : 0

  billing_account = var.billing_account
  display_name    = var.display_name

  dynamic "budget_filter" {
    for_each = local.budget_filter != null ? [local.budget_filter] : []

    content {
      projects               = try(toset(budget_filter.value.projects), null)
      credit_types_treatment = try(budget_filter.value.credit_types_treatment, "INCLUDE_ALL_CREDITS")
      services               = try(toset(budget_filter.value.services), null)
      credit_types           = try(toset(budget_filter.value.credit_types), null)
      subaccounts            = try(toset(budget_filter.value.subaccounts), null)
      labels                 = try(budget_filter.value.labels, null)
    }
  }

  amount {
    dynamic "specified_amount" {
      for_each = try(var.amount.specified_amount != null, false) ? [var.amount.specified_amount] : []

      content {
        currency_code = try(specified_amount.value.currency_code, null)
        units         = try(specified_amount.value.units, null)
        nanos         = try(specified_amount.value.nanos, null)
      }
    }

    last_period_amount = try(var.amount.last_period_amount, null)
  }

  dynamic "threshold_rules" {
    for_each = var.threshold_rules

    content {
      threshold_percent = threshold_rules.value.threshold_percent
      spend_basis       = try(threshold_rules.value.spend_basis, null)
    }
  }

  dynamic "all_updates_rule" {
    for_each = var.notifications != null ? [var.notifications] : []

    content {
      pubsub_topic                     = try(all_updates_rule.value.pubsub_topic, null)
      schema_version                   = try(all_updates_rule.value.pubsub_topic, null)
      monitoring_notification_channels = try(all_updates_rule.value.monitoring_notification_channels, null)
      disable_default_iam_recipients   = try(all_updates_rule.value.disable_default_iam_recipients, false)
    }
  }

  dynamic "timeouts" {
    for_each = try([var.module_timeouts.google_billing_budget], [])

    content {
      create = try(timeouts.value.create, null)
      update = try(timeouts.value.update, null)
      delete = try(timeouts.value.delete, null)
    }
  }

  depends_on = [var.module_depends_on]
}