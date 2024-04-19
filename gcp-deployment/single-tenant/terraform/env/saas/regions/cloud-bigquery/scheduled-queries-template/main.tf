# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

module "svc_prjct_scheduled_queries01" {
  source                 = "../../../../modules/scheduled_queries"
  project_id             = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  queries = [
    {
      name                   = "gke cluster resource consumption Query01"
      location               = "${_PRE_REQ_REGION}"
      data_source_id         = "scheduled_query"
      schedule               = "every day 12:02"
      params = {
        query                = file("./svc_prjct_query01")
      }
    }
  ]
}

module "svc_prjct_scheduled_queries02" {
  source                 = "../../../../modules/scheduled_queries"
  project_id             = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  queries = [
    {
      name                   = "gke cluster resource consumption Query02"
      location               = "${_PRE_REQ_REGION}"
      data_source_id         = "scheduled_query"
      schedule               = "every day 00:02"
      params = {
        query                           = file("./svc_prjct_query02")
      }
    }
  ]
}

module "svc_prjct_scheduled_queries03" {
  source                 = "../../../../modules/scheduled_queries"
  project_id             = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  queries = [
    {
      name                   = "gke cluster resource usage Query01"
      location               = "${_PRE_REQ_REGION}"
      data_source_id         = "scheduled_query"
      schedule               = "every day 12:02"
      params = {
        query                           = file("./svc_prjct_query03")
      }
    }
  ]
}

module "svc_prjct_scheduled_queries04" {
  source                 = "../../../../modules/scheduled_queries"
  project_id             = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  queries = [
    {
      name                   = "gke cluster resource usage Query02"
      location               = "${_PRE_REQ_REGION}"
      data_source_id         = "scheduled_query"
      schedule               = "every day 00:02"
      params = {
        query                           = file("./svc_prjct_query04")
      }
    }
  ]
}