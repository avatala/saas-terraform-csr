# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
module "hub_registration" {
  source              = "../../../modules/hub_registration"
  region              = "${_CUSTOMER_REGION}"
  cluster_project_id  = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  cluster_name        = data.terraform_remote_state.gke_cluster.outputs.main_vpc_gke_private_clusters.main_vpc_gke_private_cluster_01.name
  hub_project_id      = data.terraform_remote_state.anthos_project_id.outputs.service_projects.service_project_01["project_id"]
  depends_on = [
    module.svc_gke_hub_iam_bindings_01,module.svc_mesh_iam_bindings_01
  ]
}

module "svc_gke_hub_iam_bindings_01" {
  source   = "../../../modules/terraform-google-iam/member_iam/"
  service_account_address = "service-${data.terraform_remote_state.anthos_project_id.outputs.service_projects.service_project_01["project_number"]}@gcp-sa-gkehub.iam.gserviceaccount.com"
  project_id = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  project_roles  = ["roles/container.admin"]
  depends_on = [
    null_resource.transfer_sa_bind
  ]
}

module "svc_mesh_iam_bindings_01" {
  source   = "../../../modules/terraform-google-iam/member_iam/"
  service_account_address = "service-${data.terraform_remote_state.anthos_project_id.outputs.service_projects.service_project_01["project_number"]}@gcp-sa-servicemesh.iam.gserviceaccount.com"
  project_id = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]
  project_roles  = ["roles/anthosservicemesh.serviceAgent"]
  depends_on = [
    module.svc_gke_hub_iam_bindings_01
  ]
}

locals {
  transfer_sa="gcloud beta services identity create --service=bigquerydatatransfer.googleapis.com --project=${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]}"
  
  transfer_sa_bind="gcloud projects add-iam-policy-binding ${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]} --member=serviceAccount:service-${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_number"]}@gcp-sa-bigquerydatatransfer.iam.gserviceaccount.com --role=roles/bigquerydatatransfer.serviceAgent"
}

resource "null_resource" "transfer_sa" {
  triggers = merge({
    transfer_sa = local.transfer_sa
  })

  provisioner "local-exec" {
    when    = create
    command = self.triggers.transfer_sa
  }
}

resource "null_resource" "transfer_sa_bind" {
  triggers = merge({
    transfer_sa_bind = local.transfer_sa_bind
  })

  provisioner "local-exec" {
    when    = create
    command = self.triggers.transfer_sa_bind
  }
  depends_on = [
    null_resource.transfer_sa
  ]
}