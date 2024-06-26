# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

// This file was automatically generated from a template in ./autogen/main

/******************************************
  Create ip-masq-agent confimap
 *****************************************/
resource "kubernetes_config_map" "ip-masq-agent" {
  count = var.configure_ip_masq ? 1 : 0

  metadata {
    name      = "ip-masq-agent"
    namespace = "kube-system"

    labels = {
      maintained_by = "terraform"
    }
  }

  data = {
    config = <<EOF
nonMasqueradeCIDRs:
  - ${join("\n  - ", var.non_masquerade_cidrs)}
resyncInterval: ${var.ip_masq_resync_interval}
masqLinkLocal: ${var.ip_masq_link_local}
EOF
  }

  depends_on = [
    google_container_cluster.primary,
    google_container_node_pool.pools,
  ]
}
