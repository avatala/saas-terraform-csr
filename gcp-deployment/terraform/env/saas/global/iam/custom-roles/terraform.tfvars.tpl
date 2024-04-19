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
service_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/service-projects"
host_project_prefix_path  = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"

/******************************************
Service Account details
*****************************************/

custom_roles = {
  custom_roles_01 = {
    role_id       = "PREFIX_NAME_gke_role"
    permissions = [
      "compute.acceleratorTypes.get",
      "iam.serviceAccounts.actAs",
      "iam.serviceAccounts.get",
      "iam.serviceAccounts.list",
      "logging.logEntries.create",
      "monitoring.metricDescriptors.create",
      "monitoring.metricDescriptors.get",
      "monitoring.metricDescriptors.list",
      "monitoring.monitoredResourceDescriptors.get",
      "monitoring.monitoredResourceDescriptors.list",
      "monitoring.timeSeries.create",
      "resourcemanager.projects.get",
      "container.hostServiceAgent.use",
      "iam.roles.create",
      "iam.roles.delete",
      "iam.roles.get",
      "iam.roles.list",
      "iam.roles.undelete",
      "iam.roles.update",
      "resourcemanager.projects.get",
      "resourcemanager.projects.getIamPolicy",
      "storage.buckets.create",
      "storage.buckets.delete",
      "storage.buckets.get",
      "storage.buckets.list",
      "storage.buckets.update",
      "storage.objects.create",
      "storage.objects.delete",
      "storage.objects.get",
      "storage.objects.list",
      "storage.objects.update"
      ]
  },
  custom_roles_02 = {
    role_id       = "PREFIX_NAME_csr_role"
    permissions = [
      "source.repos.get",
      "source.repos.list"
      ]
  }
}

host_custom_roles = {
  custom_roles_01 = {
    role_id       = "PREFIX_NAME_gke_role"
    permissions = [
      "compute.acceleratorTypes.get",
      "iam.serviceAccounts.actAs",
      "iam.serviceAccounts.get",
      "iam.serviceAccounts.list",
      "logging.logEntries.create",
      "monitoring.metricDescriptors.create",
      "monitoring.metricDescriptors.get",
      "monitoring.metricDescriptors.list",
      "monitoring.monitoredResourceDescriptors.get",
      "monitoring.monitoredResourceDescriptors.list",
      "monitoring.timeSeries.create",
      "resourcemanager.projects.get",
      "container.hostServiceAgent.use",
      "iam.roles.create",
      "iam.roles.delete",
      "iam.roles.get",
      "iam.roles.list",
      "iam.roles.undelete",
      "iam.roles.update",
      "serviceusage.services.enable",
      "serviceusage.services.get",
      "serviceusage.services.list",
      "serviceusage.services.use",
      "storage.buckets.create",
      "storage.buckets.delete",
      "storage.buckets.get",
      "storage.buckets.list",
      "storage.buckets.update",
      "storage.objects.create",
      "storage.objects.delete",
      "storage.objects.get",
      "storage.objects.list",
      "storage.objects.update",
      "compute.networks.get",
      "compute.networks.list",
      "dns.managedZoneOperations.get",
      "dns.managedZoneOperations.list",
      "dns.managedZones.create",
      "dns.managedZones.delete",
      "dns.managedZones.get",
      "dns.managedZones.getIamPolicy",
      "dns.managedZones.list",
      "dns.managedZones.update",
      "dns.resourceRecordSets.create",
      "dns.resourceRecordSets.delete",
      "dns.resourceRecordSets.get",
      "dns.resourceRecordSets.list",
      "dns.resourceRecordSets.update",
      "servicenetworking.operations.cancel",
      "servicenetworking.operations.delete",
      "servicenetworking.operations.get",
      "servicenetworking.operations.list",
      "servicenetworking.services.addDnsRecordSet",
      "servicenetworking.services.addDnsZone",
      "servicenetworking.services.addPeering",
      "servicenetworking.services.addSubnetwork",
      "servicenetworking.services.createPeeredDnsDomain",
      "servicenetworking.services.deleteConnection",
      "servicenetworking.services.deletePeeredDnsDomain",
      "servicenetworking.services.disableVpcServiceControls",
      "servicenetworking.services.enableVpcServiceControls",
      "servicenetworking.services.get",
      "servicenetworking.services.getConsumerConfig",
      "servicenetworking.services.listPeeredDnsDomains",
      "servicenetworking.services.removeDnsRecordSet",
      "servicenetworking.services.removeDnsZone",
      "servicenetworking.services.updateConsumerConfig",
      "servicenetworking.services.updateDnsRecordSet",
      "compute.regionNetworkEndpointGroups.delete",
      "servicenetworking.services.use",
      "vpcaccess.connectors.create",
      "vpcaccess.connectors.delete",
      "vpcaccess.connectors.get",
      "vpcaccess.connectors.list",
      "vpcaccess.connectors.update",
      "vpcaccess.connectors.use",
      "vpcaccess.locations.list",
      "vpcaccess.operations.get",
      "vpcaccess.operations.list"
      ]
  }
}
