# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/*********************************************
 Alert Policy Details
**********************************************/

alert_policy = {
  alert_policy_01 = {
    display_name          = "CPU Quota Alert Policy"
    project_id            = "HOST_PROJECT"
    enabled               = true
    combiner              = "OR"
    notification_channels = ["NOTIFICATION_CHANNEL_ID"]
    documentation         = "CPU quota is about to reach. Please increase the Quota."
    conditions = [
      {
        display_name        = "Compute CPU Alert"
        condition_threshold = null
        condition_monitoring_query_language = {
          query = "fetch consumer_quota\n| filter resource.service == 'compute.googleapis.com'\n| { metric serviceruntime.googleapis.com/quota/allocation/usage\n    | align next_older(1d)\n    | group_by [resource.project_id, metric.quota_metric, resource.location],\n        max(val())\n  ; metric serviceruntime.googleapis.com/quota/limit\n    | filter metric.limit_name == 'CPUS-per-project-region'\n    | align next_older(1d)\n    | group_by [resource.project_id, metric.quota_metric, resource.location],\n        min(val())\n  }\n| ratio\n| every 1m\n| condition gt(val(), 0.75 '1')"
          duration = "0s"
        }
      }
    ]
    user_labels = {
      organization = "PREFIX_NAME"
      createdby    = "terraform"
    }
  }
  alert_policy_02 = {
    display_name          = "Instance Group Quota Alert Policy"
    project_id            = "HOST_PROJECT"
    enabled               = true
    combiner              = "OR"
    notification_channels = ["NOTIFICATION_CHANNEL_ID"]
    documentation         = "Instance Group quota is about to reach. Please increase the Quota."
    conditions = [
      {
        display_name        = "Compute Instance Groups Alert"
        condition_threshold = null
        condition_monitoring_query_language = {
          query = "fetch consumer_quota\n| filter resource.service == 'compute.googleapis.com'\n| { metric serviceruntime.googleapis.com/quota/allocation/usage\n    | align next_older(1d)\n    | group_by [resource.project_id, metric.quota_metric, resource.location],\n        max(val())\n  ; metric serviceruntime.googleapis.com/quota/limit\n    | filter metric.limit_name == 'INSTANCE-GROUPS-per-project-region'\n    | align next_older(1d)\n    | group_by [resource.project_id, metric.quota_metric, resource.location],\n        min(val())\n  }\n| ratio\n| every 1m\n| condition gt(val(), 0.75 '1')"
          duration = "0s"
        }
      }
    ]
    user_labels = {
      organization = "PREFIX_NAME"
      createdby    = "terraform"
    }
  }
  alert_policy_03 = {
    display_name          = "Proxy LB Backend Services Quota Alert Policy"
    project_id            = "HOST_PROJECT"
    enabled               = true
    combiner              = "OR"
    notification_channels = ["NOTIFICATION_CHANNEL_ID"]
    documentation         = "Proxy LB Backend Services quota is about to reach. Please increase the Quota."
    conditions = [
      {
        display_name        = "Compute Proxy LB Backend Services Alert"
        condition_threshold = null
        condition_monitoring_query_language = {
          query = "fetch consumer_quota\n| filter resource.service == 'compute.googleapis.com'\n| { metric serviceruntime.googleapis.com/quota/allocation/usage\n    | align next_older(1d)\n    | group_by [resource.project_id, metric.quota_metric, resource.location],\n        max(val())\n  ; metric serviceruntime.googleapis.com/quota/limit\n    | filter metric.limit_name == 'GLOBAL-EXTERNAL-PROXY-LB-BACKEND-SERVICES-per-project'\n    | align next_older(1d)\n    | group_by [resource.project_id, metric.quota_metric, resource.location],\n        min(val())\n  }\n| ratio\n| every 1m\n| condition gt(val(), 0.75 '1')"
          duration = "0s"
        }
      }
    ]
    user_labels = {
      organization = "PREFIX_NAME"
      createdby    = "terraform"
    }
  }
  alert_policy_04 = {
    display_name          = "Managed Backend Services Quota Alert Policy"
    project_id            = "HOST_PROJECT"
    enabled               = true
    combiner              = "OR"
    notification_channels = ["NOTIFICATION_CHANNEL_ID"]
    documentation         = "Managed Backend Services quota is about to reach. Please increase the Quota."
    conditions = [
      {
        display_name        = "Compute Managed Backend Services Alert"
        condition_threshold = null
        condition_monitoring_query_language = {
          query = "fetch consumer_quota\n| filter resource.service == 'compute.googleapis.com'\n| { metric serviceruntime.googleapis.com/quota/allocation/usage\n    | align next_older(1d)\n    | group_by [resource.project_id, metric.quota_metric, resource.location],\n        max(val())\n  ; metric serviceruntime.googleapis.com/quota/limit\n    | filter metric.limit_name == 'GLOBAL-EXTERNAL-MANAGED-BACKEND-SERVICES-per-project'\n    | align next_older(1d)\n    | group_by [resource.project_id, metric.quota_metric, resource.location],\n        min(val())\n  }\n| ratio\n| every 1m\n| condition gt(val(), 0.75 '1')"
          duration = "0s"
        }
      }
    ]
    user_labels = {
      organization = "PREFIX_NAME"
      createdby    = "terraform"
    }
  }
#  alert_policy_05 = {
#    display_name          = "Subnetworks Quota Alert Policy"
#    project_id            = "HOST_PROJECT"
#    enabled               = true
#    combiner              = "OR"
#    notification_channels = ["NOTIFICATION_CHANNEL_ID"]
#    documentation         = "Subnetworks quota is about to reach. Please increase the Quota."
#    conditions = [
#      {
#        display_name        = "Compute Subnetwork Ranges Per VPC Network Alert"
#        condition_threshold = null
#        condition_monitoring_query_language = {
#          query = "fetch consumer_quota\n| filter resource.service == 'compute.googleapis.com'\n| { metric serviceruntime.googleapis.com/quota/allocation/usage\n    | align next_older(1d)\n    | group_by [resource.project_id, metric.quota_metric, resource.location],\n        max(val())\n  ; metric serviceruntime.googleapis.com/quota/limit\n    | filter metric.limit_name == 'SUBNET-RANGES-per-VPC-Network'\n    | align next_older(1d)\n    | group_by [resource.project_id, metric.quota_metric, resource.location],\n        min(val())\n  }\n| ratio\n| every 1m\n| condition gt(val(), 0.75 '1')"
#          duration = "0s"
#        }
#      }
#    ]
#    user_labels = {
#      organization = "PREFIX_NAME"
#      createdby    = "terraform"
#    }
#  }
}
