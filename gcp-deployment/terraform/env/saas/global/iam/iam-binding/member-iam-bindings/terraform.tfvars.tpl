# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

 /******************************************
Terraform remote state
*****************************************/

project_state_bucket = "TF_BUCKET_NAME"
host_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"
service_project_prefix_path = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/service-projects"

users                       = ["user:USER_EMAIL"]

/******************************************
 Project IAM Binding details
 *****************************************/
 
service_member_iam_bindings_01 = {
  member_iam_binding_01 = {
    service_account_address = "saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID.iam.gserviceaccount.com"
    role_name = ["roles/cloudbuild.builds.editor","roles/cloudbuild.workerPoolOwner","roles/compute.admin","roles/compute.networkAdmin","roles/container.admin","roles/gkehub.admin","roles/resourcemanager.projectIamAdmin","roles/monitoring.admin","roles/resourcemanager.projectDeleter", "roles/source.writer","roles/iam.serviceAccountAdmin"]
  },
  member_iam_binding_02 = {
  service_account_address = "PROJECT_NUMBER_SEED@cloudbuild.gserviceaccount.com"
    role_name = ["roles/cloudbuild.workerPoolUser"]
  },
  member_iam_binding_03 = {
  service_account_address = "PREFIX_NAME-gke-hub-svc-agnt@PREFIX_NAME-anthos-hub.iam.gserviceaccount.com"
    role_name = ["roles/gkehub.serviceAgent"]
  },
  member_iam_binding_04 = {
  service_account_address = "PREFIX_NAME-anthos-acm-sa@PREFIX_NAME-anthos-hub.iam.gserviceaccount.com"
  role_name = ["roles/logging.logWriter","roles/source.writer"]
  }
}

service_member_iam_bindings_02 = {
  member_iam_binding_01 = {
    service_account_address = "PREFIX_NAME-gke-sa@PREFIX_NAME-freemium-prj.iam.gserviceaccount.com"
    role_name = ["projects/PREFIX_NAME-freemium-prj/roles/PREFIX_NAME_gke_role","roles/bigquery.user","roles/bigquery.dataEditor","roles/logging.logWriter","roles/monitoring.metricWriter","roles/storage.admin"]
  },
  member_iam_binding_02 = {
    service_account_address = "saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID.iam.gserviceaccount.com"
    role_name = ["projects/PREFIX_NAME-freemium-prj/roles/PREFIX_NAME_gke_role", "roles/artifactregistry.admin","roles/bigquery.admin","roles/compute.admin","roles/compute.storageAdmin","roles/compute.networkUser","roles/container.admin","roles/source.reader","roles/source.writer", "roles/resourcemanager.projectIamAdmin", "roles/logging.logWriter", "roles/iam.serviceAccountUser","roles/iam.serviceAccountTokenCreator","roles/container.clusterAdmin","roles/monitoring.editor", "roles/resourcemanager.projectDeleter", "roles/logging.viewer",  "roles/file.editor", "roles/iam.serviceAccountAdmin","roles/bigquery.user","roles/clouddeploy.admin"]
  },
  member_iam_binding_03 = {
  service_account_address = "PREFIX_NAME-cloudbuild-sa-1@PREFIX_NAME-freemium-prj.iam.gserviceaccount.com"
    role_name = ["roles/artifactregistry.admin","roles/bigquery.user","roles/cloudbuild.builds.editor","roles/cloudbuild.workerPoolOwner","roles/cloudsql.admin","roles/compute.admin","roles/compute.networkAdmin","roles/compute.storageAdmin","roles/container.admin","roles/dns.admin","roles/file.editor","roles/gkehub.admin","roles/iam.roleAdmin","roles/vpcaccess.admin", "roles/storage.admin", "roles/source.reader","roles/source.admin","roles/secretmanager.admin", "roles/run.admin", "roles/resourcemanager.projectIamAdmin", "roles/pubsub.admin", "roles/logging.logWriter", "roles/iam.serviceAccountUser"]
  },
  member_iam_binding_04 = {
    service_account_address = "PREFIX_NAME-cloudbq-sa@PREFIX_NAME-freemium-prj.iam.gserviceaccount.com"
    role_name = ["roles/bigquery.admin","roles/bigquerydatatransfer.serviceAgent","roles/storage.admin","roles/resourcemanager.projectIamAdmin","roles/iam.serviceAccountTokenCreator","roles/iam.serviceAccountViewer"]
  },
  member_iam_binding_05 = {
    service_account_address = "PREFIX_NAME-gke-hub-svc-agnt@PREFIX_NAME-anthos-hub.iam.gserviceaccount.com"
    role_name = ["roles/container.admin"]
  },
  member_iam_binding_06 = {
    service_account_address = "PREFIX_NAME-cronjob@PREFIX_NAME-freemium-prj.iam.gserviceaccount.com"
    role_name = ["roles/storage.admin"]
  },
  member_iam_binding_07 = {
    service_account_address = "PREFIX_NAME-cloud-deploy-sa@PREFIX_NAME-freemium-prj.iam.gserviceaccount.com"
    role_name = ["roles/clouddeploy.admin","roles/clouddeploy.jobRunner","roles/container.admin","roles/iam.serviceAccountUser","roles/storage.admin"]
  }
}


host_member_iam_bindings_01 = {
  
  member_iam_binding_01 = {
    service_account_address = "saas-cloudbuild-sa@TEMP_SEED_PROJECT_ID.iam.gserviceaccount.com"
    role_name = ["roles/firebase.admin","roles/artifactregistry.admin","roles/iap.settingsAdmin","projects/PREFIX_NAME-admin-host/roles/PREFIX_NAME_gke_role","roles/compute.networkAdmin","roles/file.editor","roles/iam.serviceAccountUser","roles/run.developer","roles/iam.serviceAccountTokenCreator","roles/monitoring.admin","roles/logging.viewer","roles/resourcemanager.projectIamAdmin","roles/resourcemanager.projectDeleter", "roles/certificatemanager.editor", "roles/compute.admin", "roles/dns.admin", "roles/bigquery.dataEditor","roles/cloudfunctions.invoker","roles/identitytoolkit.admin","roles/cloudfunctions.admin","roles/apigee.admin"]
  },
  member_iam_binding_02 = {
  service_account_address = "PREFIX_NAME-cloudbuild-sa-1@PREFIX_NAME-freemium-prj.iam.gserviceaccount.com"
    role_name = ["roles/cloudsql.admin","roles/compute.networkAdmin","roles/dns.admin","roles/file.editor","roles/iam.serviceAccountUser","roles/run.admin","roles/servicenetworking.networksAdmin","roles/serviceusage.serviceUsageAdmin","roles/storage.admin","roles/vpcaccess.admin"]
  }
  member_iam_binding_03 = {
  service_account_address = "PREFIX_NAME-mig-sa@PREFIX_NAME-admin-host.iam.gserviceaccount.com"
    role_name = ["roles/compute.networkAdmin","roles/storage.admin","roles/compute.admin","roles/compute.networkAdmin","roles/compute.storageAdmin"]
  }
  member_iam_binding_04 = {
    service_account_address = "PREFIX_NAME-cloudrun-sa@PREFIX_NAME-admin-host.iam.gserviceaccount.com"
    role_name = ["roles/compute.admin","roles/datastore.user", "roles/logging.logWriter","roles/identitytoolkit.admin","roles/iam.serviceAccountUser","roles/cloudfunctions.invoker"]
  }
  member_iam_binding_05 = {
    service_account_address = "PREFIX_NAME-cloudbq-sa@PREFIX_NAME-freemium-prj.iam.gserviceaccount.com"
    role_name = ["roles/bigquery.admin","roles/storage.admin","roles/iam.serviceAccountTokenCreator","roles/iam.serviceAccountViewer"]
  },
  member_iam_binding_06 = {
    service_account_address = "PREFIX_NAME-cloudbq-sa@PREFIX_NAME-admin-host.iam.gserviceaccount.com"
    role_name = ["roles/bigquery.admin","roles/bigquerydatatransfer.serviceAgent","roles/storage.admin","roles/resourcemanager.projectIamAdmin","roles/iam.serviceAccountTokenCreator","roles/iam.serviceAccountViewer"]
  },
  member_iam_binding_07 = {
    service_account_address = "PREFIX_NAME-gcip-sa@PREFIX_NAME-admin-host.iam.gserviceaccount.com"
    role_name = ["roles/identitytoolkit.viewer","roles/iap.settingsAdmin","roles/compute.networkViewer"]
  },
  member_iam_binding_08 = {
    service_account_address = "PREFIX_NAME-cronjob@PREFIX_NAME-freemium-prj.iam.gserviceaccount.com"
    role_name = ["roles/storage.admin"]
  }
}



seed_member_iam_bindings_01 = {
  member_iam_binding_01 = {
    service_account_address = "PREFIX_NAME-gke-sa@PREFIX_NAME-freemium-prj.iam.gserviceaccount.com"
    project_id = "TEMP_SEED_PROJECT_ID"
    role_name = ["roles/logging.logWriter","roles/source.writer", "roles/storage.admin","roles/artifactregistry.writer"]
  },
  member_iam_binding_02 = {
    service_account_address = "PREFIX_NAME-anthos-acm-sa@PREFIX_NAME-anthos-hub.iam.gserviceaccount.com"
    project_id = "TEMP_SEED_PROJECT_ID"
    role_name = ["roles/logging.logWriter","roles/source.writer"]
  },
  member_iam_binding_03 = {
    service_account_address = "PREFIX_NAME-cloudrun-sa@PREFIX_NAME-admin-host.iam.gserviceaccount.com"
    project_id = "TEMP_SEED_PROJECT_ID"
    role_name = ["roles/cloudbuild.builds.builder","roles/iam.serviceAccountUser","roles/datastore.user","roles/identitytoolkit.admin","roles/logging.logWriter"]
  },
  member_iam_binding_04 = {
    service_account_address = "PREFIX_NAME-cloudbq-sa@PREFIX_NAME-admin-host.iam.gserviceaccount.com"
    project_id = "TEMP_SEED_PROJECT_ID"
    role_name = ["roles/storage.admin","roles/iam.serviceAccountTokenCreator"]
  }
  member_iam_binding_05 = {
    service_account_address = "PREFIX_NAME-cloudbq-sa@PREFIX_NAME-freemium-prj.iam.gserviceaccount.com"
    project_id = "TEMP_SEED_PROJECT_ID"
    role_name = ["roles/storage.admin","roles/iam.serviceAccountTokenCreator"]
  },
  member_iam_binding_06 = {
    service_account_address = "PREFIX_NAME-cronjob@PREFIX_NAME-freemium-prj.iam.gserviceaccount.com"
    project_id = "TEMP_SEED_PROJECT_ID"
    role_name = ["roles/cloudbuild.builds.editor","roles/source.admin","roles/iam.serviceAccountTokenCreator","roles/iam.serviceAccountViewer","roles/iam.serviceAccountUser"]
  }
}