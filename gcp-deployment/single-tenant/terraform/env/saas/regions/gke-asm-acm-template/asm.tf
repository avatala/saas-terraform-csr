# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
locals {
    asm_cmds = <<-EOT
        curl https://storage.googleapis.com/csm-artifacts/asm/asmcli > asmcli && chmod +x asmcli && ./asmcli install -p ${data.terraform_remote_state.service_project_id.outputs.service_projects.service_project_01["project_id"]} -l ${data.terraform_remote_state.gke_cluster.outputs.main_vpc_gke_private_clusters.main_vpc_gke_private_cluster_01.region} -n ${data.terraform_remote_state.gke_cluster.outputs.main_vpc_gke_private_clusters.main_vpc_gke_private_cluster_01.name} --fleet_id ${data.terraform_remote_state.anthos_project_id.outputs.service_projects.service_project_01["project_id"]} --managed --output_dir ./asm --enable-all  --channel stable --enable_gcp_components
    EOT
  }

  resource "null_resource" "asm_setup" {
    triggers = merge({
      asm_cmds = local.asm_cmds
    })

    provisioner "local-exec" {
      when    = create
      command = self.triggers.asm_cmds
    }

    depends_on = [
      module.hub_registration
    ]
}