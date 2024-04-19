# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


/******************************************
  Details of Cloud Bigquery Dataset
 *****************************************/
module "saas_bigquery_dataset" {
  source = "../../../../modules/terraform-google-bigquery/"
  project_id                 = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_02["project_id"]
  for_each                   = var.saas_bigquery_dataset
  dataset_id                 = each.value.dataset_id
  description                = each.value.description
  location                   = each.value.location
  delete_contents_on_destroy = each.value.delete_contents_on_destroy
  dataset_labels             = each.value.dataset_labels
  encryption_key             = each.value.encryption_key
}

module "saas_bigquery_dataset_host_prjct" {
  source = "../../../../modules/terraform-google-bigquery/"
  project_id                 = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  for_each                   = var.saas_bigquery_dataset_host_prjct
  dataset_id                 = each.value.dataset_id
  description                = each.value.description
  location                   = each.value.location
  delete_contents_on_destroy = each.value.delete_contents_on_destroy
  dataset_labels             = each.value.dataset_labels
  encryption_key             = each.value.encryption_key
}

resource "google_bigquery_table" "default" {
  dataset_id = module.saas_bigquery_dataset_host_prjct["bigquery_01"].bigquery_dataset.dataset_id
  table_id   = "gke_cluster_resource_consumption"
  project    = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  deletion_protection = false


  labels = {
    env = "resource-consumption"
  }

  schema = <<EOF

[
  {
    "name": "cluster_location",
    "type": "STRING"
  },
  {
    "name": "cluster_name",
    "type": "STRING"
  },
  {
    "name": "namespace",
    "type": "STRING"
  },
  {
    "name": "resource_name",
    "type": "STRING"
  },
  {
    "name": "sku_id",
    "type": "STRING"
  },
  {
    "name": "start_time",
    "type": "TIMESTAMP"
  },
  {
    "name": "end_time",
    "type": "TIMESTAMP"
  },
  {
    "name": "fraction",
    "type": "FLOAT"
  },
  {
    "name": "cloud_resource_size",
    "type": "INTEGER"
  },
  {
    "fields": [
      {
        "name": "key",
        "type": "STRING"
      },
      {
        "name": "value",
        "type": "STRING"
      }
    ],
    "mode": "REPEATED",
    "name": "labels",
    "type": "RECORD"
  },
  {
    "fields": [
      {
        "name": "id",
        "type": "STRING"
      }
    ],
    "name": "project",
    "type": "RECORD"
  },
  {
    "fields": [
      {
        "name": "amount",
        "type": "FLOAT"
      },
      {
        "name": "unit",
        "type": "STRING"
      }
    ],
    "name": "usage",
    "type": "RECORD"
  }
]

EOF

}

resource "google_bigquery_table" "resource_usage" {
  dataset_id = module.saas_bigquery_dataset_host_prjct["bigquery_01"].bigquery_dataset.dataset_id
  table_id   = "gke_cluster_resource_usage"
  project                 = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  deletion_protection = false


  labels = {
    env = "resource-usage"
  }

  schema = <<EOF
[
      {
        "name": "cluster_location",
        "type": "STRING"
      },
      {
        "name": "cluster_name",
        "type": "STRING"
      },
      {
        "name": "namespace",
        "type": "STRING"
      },
      {
        "name": "resource_name",
        "type": "STRING"
      },
      {
        "name": "sku_id",
        "type": "STRING"
      },
      {
        "name": "start_time",
        "type": "TIMESTAMP"
      },
      {
        "name": "end_time",
        "type": "TIMESTAMP"
      },
      {
        "name": "fraction",
        "type": "FLOAT"
      },
      {
        "name": "cloud_resource_size",
        "type": "INTEGER"
      },
      {
        "fields": [
          {
            "name": "key",
            "type": "STRING"
          },
          {
            "name": "value",
            "type": "STRING"
          }
        ],
        "mode": "REPEATED",
        "name": "labels",
        "type": "RECORD"
      },
      {
        "fields": [
          {
            "name": "id",
            "type": "STRING"
          }
        ],
        "name": "project",
        "type": "RECORD"
      },
      {
        "fields": [
          {
            "name": "amount",
            "type": "FLOAT"
          },
          {
            "name": "unit",
            "type": "STRING"
          }
        ],
        "name": "usage",
        "type": "RECORD"
      }
]
  

EOF

}