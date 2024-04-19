# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
/*****************************************
Workerpool setup commands
******************************************/

locals {
  
  host_project_id     = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  
  service_project_id  = data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]

  dns_public          = data.terraform_remote_state.public_dns.outputs.dns_public_zones.dns_public_zone_01.name
  
  dns_private         = data.terraform_remote_state.private_dns.outputs.dns_private_zones.dns_private_zone_01.name

  lb_ip = data.terraform_remote_state.lb.outputs.enterprise_lb_ip_address

  private_cmds = <<-EOT
      sleep 180 && gcloud container clusters get-credentials ${_CUSTOMER_NAME}-saas-tenant-cluster-us-ct1-01 --region ${_CUSTOMER_REGION} --project ${local.service_project_id} && gcloud dns record-sets  create --rrdatas=$(kubectl get svc  ${_CUSTOMER_NAME}-ingress-nginx-controller -o=jsonpath='{.spec.clusterIP}' -n ${_CUSTOMER_NAME} ) ipm-${_CUSTOMER_NAME}.${_ENTERPRISE_SUB_DOMAIN} --ttl=300 --type=A --zone=${local.dns_private} --project ${local.host_project_id} && gcloud dns record-sets  create --rrdatas=$( kubectl get svc  ${_CUSTOMER_NAME}-ingress-nginx-controller -o=jsonpath='{.spec.clusterIP}' -n ${_CUSTOMER_NAME} ) plgd-${_CUSTOMER_NAME}.${_ENTERPRISE_SUB_DOMAIN} --ttl=300 --type=A --zone=${local.dns_private} --project ${local.host_project_id} && gcloud dns record-sets  create --rrdatas=$( kubectl get svc  ${_CUSTOMER_NAME}-ingress-nginx-controller -o=jsonpath='{.spec.clusterIP}' -n ${_CUSTOMER_NAME} ) xrmetrics-${_CUSTOMER_NAME}.${_ENTERPRISE_SUB_DOMAIN} --ttl=300 --type=A --zone=${local.dns_private} --project ${local.host_project_id} && gcloud dns record-sets  create --rrdatas=$( kubectl get svc  ${_CUSTOMER_NAME}-ingress-nginx-controller -o=jsonpath='{.spec.clusterIP}' -n ${_CUSTOMER_NAME} ) xrinflux-${_CUSTOMER_NAME}.${_ENTERPRISE_SUB_DOMAIN} --ttl=300 --type=A --zone=${local.dns_private} --project ${local.host_project_id}
  EOT
  public_cmds = <<-EOT
       sleep 180 && gcloud container clusters get-credentials ${_CUSTOMER_NAME}-saas-tenant-cluster-us-ct1-01 --region ${_CUSTOMER_REGION} --project ${local.service_project_id} && gcloud dns record-sets  create --rrdatas=$( kubectl get svc ${_CUSTOMER_NAME}-ingress-nginx-controller -o=jsonpath='{.status.loadBalancer.ingress[0].ip}' -n ${_CUSTOMER_NAME} ) ipm-${_CUSTOMER_NAME}.${_ENTERPRISE_SUB_DOMAIN} --ttl=300 --type=A --zone=${local.dns_public} --project ${local.host_project_id} && gcloud dns record-sets  create --rrdatas=$( kubectl get svc ${_CUSTOMER_NAME}-ingress-nginx-controller -o=jsonpath='{.status.loadBalancer.ingress[0].ip}' -n ${_CUSTOMER_NAME} ) plgd-${_CUSTOMER_NAME}.${_ENTERPRISE_SUB_DOMAIN} --ttl=300 --type=A --zone=${local.dns_public} --project ${local.host_project_id} && gcloud dns record-sets  create --rrdatas=$( kubectl get svc ${_CUSTOMER_NAME}-ingress-nginx-controller -o=jsonpath='{.status.loadBalancer.ingress[0].ip}' -n ${_CUSTOMER_NAME} ) xrmetrics-${_CUSTOMER_NAME}.${_ENTERPRISE_SUB_DOMAIN} --ttl=300 --type=A --zone=${local.dns_public} --project ${local.host_project_id} && gcloud dns record-sets  create --rrdatas=$( kubectl get svc ${_CUSTOMER_NAME}-ingress-nginx-controller -o=jsonpath='{.status.loadBalancer.ingress[0].ip}' -n ${_CUSTOMER_NAME} ) xrinflux-${_CUSTOMER_NAME}.${_ENTERPRISE_SUB_DOMAIN} --ttl=300 --type=A --zone=${local.dns_public} --project ${local.host_project_id}
  EOT

  delete_private_cmds = <<-EOT
      gcloud dns record-sets delete ipm-${_CUSTOMER_NAME}.${_ENTERPRISE_SUB_DOMAIN} --type=A --zone=${local.dns_private} --project ${local.host_project_id} && gcloud dns record-sets delete plgd-${_CUSTOMER_NAME}.${_ENTERPRISE_SUB_DOMAIN} --type=A --zone=${local.dns_private} --project ${local.host_project_id} && gcloud dns record-sets delete xrmetrics-${_CUSTOMER_NAME}.${_ENTERPRISE_SUB_DOMAIN} --type=A --zone=${local.dns_private} --project ${local.host_project_id} && gcloud dns record-sets delete xrinflux-${_CUSTOMER_NAME}.${_ENTERPRISE_SUB_DOMAIN} --type=A --zone=${local.dns_private} --project ${local.host_project_id}
  EOT

  delete_public_cmds = <<-EOT
      gcloud dns record-sets delete ipm-${_CUSTOMER_NAME}.${_ENTERPRISE_SUB_DOMAIN} --type=A --zone=${local.dns_public} --project ${local.host_project_id} && gcloud dns record-sets delete plgd-${_CUSTOMER_NAME}.${_ENTERPRISE_SUB_DOMAIN} --type=A --zone=${local.dns_public} --project ${local.host_project_id} && gcloud dns record-sets delete xrmetrics-${_CUSTOMER_NAME}.${_ENTERPRISE_SUB_DOMAIN} --type=A --zone=${local.dns_public} --project ${local.host_project_id} && gcloud dns record-sets delete xrinflux-${_CUSTOMER_NAME}.${_ENTERPRISE_SUB_DOMAIN} --type=A --zone=${local.dns_public} --project ${local.host_project_id}
  EOT
}


resource "null_resource" "setup_private" {
  triggers = merge({
    private_cmds = local.private_cmds
  })

  provisioner "local-exec" {
    when    = create
    command = self.triggers.private_cmds
  }

}

resource "null_resource" "delete_private" {
  triggers = merge({
    delete_private_cmds = local.delete_private_cmds
  })

  provisioner "local-exec" {
    when    = destroy
    command = self.triggers.delete_private_cmds
  }

}

resource "null_resource" "setup_public" {
  triggers = merge({
    public_cmds = local.public_cmds
  })

  provisioner "local-exec" {
    when    = create
    command = self.triggers.public_cmds
  }

}

resource "null_resource" "delete_public" {
  triggers = merge({
    delete_public_cmds = local.delete_public_cmds
  })

  provisioner "local-exec" {
    when    = destroy
    command = self.triggers.delete_public_cmds
  }

}