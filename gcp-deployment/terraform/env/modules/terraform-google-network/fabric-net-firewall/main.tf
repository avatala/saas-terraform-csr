# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

###############################################################################
#                            rules based on IP ranges
###############################################################################

resource "google_compute_firewall" "allow-internal" {
  count         = var.internal_ranges_enabled == true && length(var.internal_allow) > 0 ? 1 : 0
  name          = "${var.network}-ingress-internal"
  description   = "Allow ingress traffic from internal IP ranges"
  network       = var.network
  project       = var.project_id
  source_ranges = var.internal_ranges
  target_tags   = var.internal_target_tags

  dynamic "allow" {
    for_each = [for rule in var.internal_allow :
      {
        protocol = lookup(rule, "protocol", null)
        ports    = lookup(rule, "ports", null)
      }
    ]
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }
}

resource "google_compute_firewall" "allow-admins" {
  count         = var.admin_ranges_enabled == true ? 1 : 0
  name          = "${var.network}-ingress-admins"
  description   = "Access from the admin subnet to all subnets"
  network       = var.network
  project       = var.project_id
  source_ranges = var.admin_ranges

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }
}

###############################################################################
#                              rules based on tags
###############################################################################

resource "google_compute_firewall" "allow-tag-ssh" {
  count         = length(var.ssh_source_ranges) > 0 ? 1 : 0
  name          = "${var.network}-ingress-tag-ssh"
  description   = "Allow SSH to machines with the 'ssh' tag"
  network       = var.network
  project       = var.project_id
  source_ranges = var.ssh_source_ranges
  target_tags   = var.ssh_target_tags

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "allow-tag-http" {
  count         = length(var.http_source_ranges) > 0 ? 1 : 0
  name          = "${var.network}-ingress-tag-http"
  description   = "Allow HTTP to machines with the 'http-server' tag"
  network       = var.network
  project       = var.project_id
  source_ranges = var.http_source_ranges
  target_tags   = var.http_target_tags

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}

resource "google_compute_firewall" "allow-tag-https" {
  count         = length(var.https_source_ranges) > 0 ? 1 : 0
  name          = "${var.network}-ingress-tag-https"
  description   = "Allow HTTPS to machines with the 'https' tag"
  network       = var.network
  project       = var.project_id
  source_ranges = var.https_source_ranges
  target_tags   = var.https_target_tags

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
}

################################################################################
#                                dynamic rules                                 #
################################################################################

resource "google_compute_firewall" "custom" {
  # provider                = "google-beta"
  for_each                = var.custom_rules
  name                    = each.key
  description             = each.value.description
  direction               = each.value.direction
  network                 = var.network
  project                 = var.project_id
  source_ranges           = each.value.direction == "INGRESS" ? each.value.ranges : null
  destination_ranges      = each.value.direction == "EGRESS" ? each.value.ranges : null
  source_tags             = each.value.use_service_accounts || each.value.direction == "EGRESS" ? null : each.value.sources
  source_service_accounts = each.value.use_service_accounts && each.value.direction == "INGRESS" ? each.value.sources : null
  target_tags             = each.value.use_service_accounts ? null : each.value.targets
  target_service_accounts = each.value.use_service_accounts ? each.value.targets : null
  disabled                = lookup(each.value.extra_attributes, "disabled", false)
  priority                = lookup(each.value.extra_attributes, "priority", 1000)

  dynamic "log_config" {
    for_each = lookup(each.value.extra_attributes, "flow_logs", false) ? [{
      metadata = lookup(each.value.extra_attributes, "flow_logs_metadata", "INCLUDE_ALL_METADATA")
    }] : []
    content {
      metadata = log_config.value.metadata
    }
  }

  dynamic "allow" {
    for_each = [for rule in each.value.rules : rule if each.value.action == "allow"]
    iterator = rule
    content {
      protocol = rule.value.protocol
      ports    = rule.value.ports
    }
  }

  dynamic "deny" {
    for_each = [for rule in each.value.rules : rule if each.value.action == "deny"]
    iterator = rule
    content {
      protocol = rule.value.protocol
      ports    = rule.value.ports
    }
  }
}
