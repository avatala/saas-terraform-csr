# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
# ----------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables must be set when using this module.
# ----------------------------------------------------------------------------------------------------------------------

variable "billing_account" {
  type        = string
  description = "(Required) ID of the billing account to set a budget on."
}

variable "amount" {
  type        = any
  description = "(Required) The budgeted amount for each usage period."
  # type = object({
  #   specified_amount = optional(object({
  #     currency_code = optional(string)
  #     units         = optional(number)
  #     nanos         = optional(number)
  #   }))
  #   last_period_amount = optional(bool)
  # })

  #NOTE: try() can be removed once proper typing is available (tf 1.3), see above
  #https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_budget#last_period_amount
  # validation {
  #   condition     = try(var.amount.last_period_amount, null) != false
  #   error_message = "`last_period_amount` cannot be false (it can be either unset or `true`)"
  # }

  #The provider throws `Error: Invalid combination of arguments` if `amount {}` is empty, the error message can be confusing hence this validation
  validation {
    condition     = length(var.amount) > 0
    error_message = "The argument `amount` is required, but the block is empty."
  }
}

# ----------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These variables have defaults, but may be overridden.
# ----------------------------------------------------------------------------------------------------------------------

variable "threshold_rules" {
  type = any
  # type = list(object({
  #   # (Required) Send an alert when this threshold is exceeded. This is a 1.0-based percentage, so 0.5 = 50%. Must be >= 0.
  #   threshold_percent = number
  #   # Optional) The type of basis used to determine if spend has passed the threshold. Default value is `CURRENT_SPEND`. Possible values are `CURRENT_SPEND` and `FORECASTED_SPEND`.
  #   spend_basis = optional(string)
  # }))
  description = "(Optional) Rules that trigger alerts (notifications of thresholds being crossed) when spend exceeds the specified percentages of the budget."
  default     = []
}

variable "display_name" {
  type        = string
  description = "(Optional) The name of the budget that will be displayed in the GCP console. Must be <= 60 chars."
  default     = null
}

variable "budget_filter" {
  type = any
  # type = object({
  #   # (Optional) A set of projects of the form `projects/{project_number}`, specifying that usage from only this set of projects should be included in the budget. If omitted, the report will include all usage for the billing account, regardless of which project the usage occurred on.
  #   projects = optional(set(string))
  #   # (Optional) Specifies how credits should be treated when determining spend for threshold calculations. Possible values are `INCLUDE_ALL_CREDITS`, `EXCLUDE_ALL_CREDITS`, and `INCLUDE_SPECIFIED_CREDITS`.
  #   credit_types_treatment = optional(string)
  #   # (Optional) If `credit_t`pes_treatment` is set to `INCLUDE_SPECIFIED_CREDITS`, this is a list of credit types to be subtracted from gross cost to determine the spend for threshold calculations. For a list of acceptable credit type values please see https://cloud.google.com/billing/docs/how-to/export-data-bigquery-tables#credits-type
  #   credit_types = set(string)
  #   # (Optional) A set of services of the form `services/{service_id}`, specifying that usage from only this set of services should be included in the budget. If omitted, the report will include usage for all the services. For a list of available services please see: https://cloud.google.com/billing/v1/how-tos/catalog-api.
  #   services = optional(set(string))
  #   # (Optional) A set of subaccounts of the form `billingAccounts/{account_id}`, specifying that usage from only this set of subaccounts should be included in the budget. If a subaccount is set to the name of the parent account, usage from the parent account will be included. If the field is omitted, the report will include usage from the parent account and all subaccounts, if they exist.
  #   subaccounts = optional(set(string))
  #   # (Optional) A single label and value pair specifying that usage from only this set of labeled resources should be included in the budget.
  #   labels = optional(map(string))
  # })
  description = "(Optional) Filters that define which resources are used to compute the actual spend against the budget."
  default     = null
}

variable "notifications" {
  type = any
  # type = object({
  #   # (Optional) The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form `projects/{project_id}/topics/{topic_id}`. Updates are sent at regular intervals to the topic.
  #   pubsub_topic = optional(string)
  #   #(Optional) The schema version of the notification. It represents the JSON schema as defined in https://cloud.google.com/billing/docs/how-to/budgets#notification_format.
  #   schema_version = optional(string)
  #   # (Optional) The full resource name of a monitoring notification channel in the form `projects/{project_id}/notificationChannels/{channel_id}`. A maximum of 5 channels are allowed.
  #   monitoring_notification_channels = optional(set(string))
  #   # (Optional) Boolean. When set to true, disables default notifications sent when a threshold is exceeded. Default recipients are those with Billing Account Administrators and Billing Account Users IAM roles for the target account.
  #   disable_default_iam_recipients = optional(bool)
  # })
  description = "(Optional) Defines notifications that are sent on every update to the billing account's spend, regardless of the thresholds defined using threshold rules."
  default     = null
}


# ----------------------------------------------------------------------------------------------------------------------
# MODULE CONFIGURATION PARAMETERS
# These variables are used to configure the module.
# ----------------------------------------------------------------------------------------------------------------------

variable "module_enabled" {
  type        = bool
  description = "(Optional) Whether to create resources within the module or not."
  default     = true
}

variable "module_timeouts" {
  description = "(Optional) How long certain operations (per resource type) are allowed to take before being considered to have failed."
  type        = any
  # type = object({
  #   google_billing_budget = optional(object({
  #     create = optional(string)
  #     update = optional(string)
  #     delete = optional(string)
  #   }))
  # })
  default = {}
}

variable "module_depends_on" {
  type        = any
  description = "(Optional) A list of external resources the module depends on."
  default     = []
}