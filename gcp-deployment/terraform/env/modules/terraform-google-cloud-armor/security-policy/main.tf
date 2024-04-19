# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


resource "google_compute_security_policy" "policy" {
  name = var.name
  project = var.project

 dynamic "rule" {
    for_each = var.ip_ranges_rules != null ? var.ip_ranges_rules : toset([]) 
    content {
      action = rule.value.action
      description = rule.value.description
      priority  = rule.value.priority
      preview     = rule.value.preview
      match {
        versioned_expr = rule.value.versioned_expr
          config {
            src_ip_ranges = rule.value.src_ip_ranges
          }
      }
    }
  }


# --------------------------------- 
# OWASP top 10 rules
# --------------------------------- 
    dynamic "rule" {
        for_each = var.owasp_rules
        content {
            action      = rule.value.action
            priority    = rule.value.priority
            description = rule.value.description
            preview     = rule.value.preview
            match {
                expr {
                    expression = rule.value.expression
                }
            }
        }
    }
    
# --------------------------------- 
# Country limitation
# --------------------------------- 
    dynamic "rule" {
        for_each = var.countries_rules
        content {
            action      = rule.value.action
            priority    = rule.value.priority
            description = rule.value.description
            preview     = rule.value.preview
            match {
                expr {
                    expression = rule.value.expression
                }
            }
        }
    }
# --------------------------------- 
# DDOS Protection
# --------------------------------- 
#   rule {
#     adaptive_protection_config {
#      layer_7_ddos_defense_config {
#        enable = true
#        preview = true
#     }
#   }
# }
}