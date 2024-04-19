# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
  Public DNS Zone Details
*****************************************/

locals {
  enterprise_ns_cmd = <<-EOT
    gcloud dns record-sets  create --rrdatas=${module.dns_public_zones["dns_public_zone_01"].name_servers[0]},${module.dns_public_zones["dns_public_zone_01"].name_servers[1]},${module.dns_public_zones["dns_public_zone_01"].name_servers[2]},${module.dns_public_zones["dns_public_zone_01"].name_servers[3]} enterprise.CUSTOMER_DOMAIN.PREFIX_NAME.FULL_ADMIN_DOMAIN --ttl=300 --type=NS --zone=${module.dns_public_zones["dns_public_zone_03"].name} --project ${data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]}
  EOT

  freemium_ns_cmd = <<-EOT
    gcloud dns record-sets  create --rrdatas=${module.dns_public_zones["dns_public_zone_02"].name_servers[0]},${module.dns_public_zones["dns_public_zone_02"].name_servers[1]},${module.dns_public_zones["dns_public_zone_02"].name_servers[2]},${module.dns_public_zones["dns_public_zone_02"].name_servers[3]} freemium.CUSTOMER_DOMAIN.PREFIX_NAME.FULL_ADMIN_DOMAIN --ttl=300 --type=NS --zone=${module.dns_public_zones["dns_public_zone_03"].name} --project ${data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]}
  EOT
}

module "dns_public_zones" {
  source      = "../../../../modules/terraform-google-cloud-dns/"
  for_each    = var.dns_public_zones
  project_id  = data.terraform_remote_state.host_project_id.outputs.standalone_projects.standalone_project_01["project_id"]
  type        = "public"
  name        = each.value.name
  description = each.value.description
  domain      = each.value.domain
  labels      = each.value.labels
}

resource "null_resource" "sleep" {
    
  provisioner "local-exec" {
    when    = create
    command = "sleep 60"
  }
  depends_on = [
    module.dns_public_zones
  ]
}

resource "null_resource" "enterprise_ns" {
  triggers = merge({
    enterprise_ns_cmd = local.enterprise_ns_cmd
  })

  provisioner "local-exec" {
    when    = create
    command = self.triggers.enterprise_ns_cmd
  }
  depends_on = [
    null_resource.sleep
  ]
}

resource "null_resource" "freemium_ns" {
  triggers = merge({
    freemium_ns_cmd = local.freemium_ns_cmd
  })

  provisioner "local-exec" {
    when    = create
    command = self.triggers.freemium_ns_cmd
  }
  depends_on = [
    null_resource.sleep
  ]
}