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

/******************************************
  Security Policy Details
 *****************************************/

name = "PREFIX_NAME-armor-policy"
ip_ranges_rules = [
  {
  action   = "deny(403)",
  priority = "2147483647",
  preview  = false,
  versioned_expr = "SRC_IPS_V1",
  src_ip_ranges = ["*"],
  description = "Default rule, higher priority overrides it"
 },
 {
  action         = "allow",
  priority       = "100",
  preview        = false,
  versioned_expr = "SRC_IPS_V1",
  src_ip_ranges  = ["0.0.0.0/0"],
  description    = "Allow all IP's"
  },
  {
  action   = "allow",
  priority = "20",
  preview  = false,
  versioned_expr = "SRC_IPS_V1",
  src_ip_ranges = ["35.199.66.47/32", "35.198.18.224/32", "35.199.67.79/32", "35.198.36.209/32", "35.199.90.14/32", "35.199.123.150/32", "35.198.39.162/32", "35.199.77.186/32", "35.199.126.168/32", "104.155.77.122/32"],
  description = "Allow IP's from uptime checks (Google IPS)"
},
]

owasp_rules = {
  #https://cloud.google.com/armor/docs/rule-tuning#sql_injection_sqli
  rule_sqli = {
      action      = "deny(403)"
      priority    = "1000"
      description = "SQL injection"
      preview     = false
      
      ### Detect Level 1
      #expression  = "evaluatePreconfiguredExpr('sqli-stable',['owasp-crs-v030001-id942110-sqli','owasp-crs-v030001-id942120-sqli','owasp-crs-v030001-id942150-sqli','owasp-crs-v030001-id942180-sqli','owasp-crs-v030001-id942200-sqli','owasp-crs-v030001-id942210-sqli','owasp-crs-v030001-id942260-sqli','owasp-crs-v030001-id942300-sqli','owasp-crs-v030001-id942310-sqli','owasp-crs-v030001-id942330-sqli','owasp-crs-v030001-id942340-sqli','owasp-crs-v030001-id942380-sqli','owasp-crs-v030001-id942390-sqli','owasp-crs-v030001-id942400-sqli','owasp-crs-v030001-id942410-sqli','owasp-crs-v030001-id942430-sqli','owasp-crs-v030001-id942440-sqli','owasp-crs-v030001-id942450-sqli','owasp-crs-v030001-id942251-sqli','owasp-crs-v030001-id942420-sqli','owasp-crs-v030001-id942431-sqli','owasp-crs-v030001-id942460-sqli','owasp-crs-v030001-id942421-sqli','owasp-crs-v030001-id942432-sqli'])"
      
      ### Detect Level 1 & 2
      #expression  = "evaluatePreconfiguredExpr('sqli-stable',['owasp-crs-v030001-id942251-sqli','owasp-crs-v030001-id942420-sqli','owasp-crs-v030001-id942431-sqli','owasp-crs-v030001-id942460-sqli','owasp-crs-v030001-id942421-sqli','owasp-crs-v030001-id942432-sqli'])"
      
      ### Detect Level 1,2 & 3
      #expression  = "evaluatePreconfiguredExpr('sqli-stable',['owasp-crs-v030001-id942421-sqli','owasp-crs-v030001-id942432-sqli'])"
      
      ### Detect Level 1,2,3 & 4
      expression  = "evaluatePreconfiguredExpr('sqli-v33-stable')"
  }
   #https://cloud.google.com/armor/docs/rule-tuning#cross-site_scripting_xss
  rule_xss = {
      action      = "deny(403)"
      priority    = "1001"
      description = "Cross-site scripting"
      preview     = false
      
      ### Detect Level 1
      #expression  = "evaluatePreconfiguredExpr('xss-stable',['owasp-crs-v030001-id941150-xss','owasp-crs-v030001-id941320-xss','owasp-crs-v030001-id941330-xss','owasp-crs-v030001-id941340-xss'])"
      
      ### Detect Level 1 & 2
      expression  = "evaluatePreconfiguredExpr('xss-v33-stable')"
  }
  #https://cloud.google.com/armor/docs/rule-tuning#local_file_inclusion_lfi
  rule_lfi = {
      action      = "deny(403)"
      priority    = "1002"
      description = "Local file inclusion"
      preview     = false
      
      ### Detect Level 1
      expression  = "evaluatePreconfiguredExpr('lfi-v33-stable')"
  }
  #https://cloud.google.com/armor/docs/rule-tuning#remote_code_execution_rce
  rule_rce = {
      action      = "deny(403)"
      priority    = "1003"
      description = "Remote code execution"
      preview     = false
     
      ### Detect Level 1
      expression  = "evaluatePreconfiguredExpr('rce-v33-stable')"
  }
  #https://cloud.google.com/armor/docs/rule-tuning#remote_file_inclusion_rfi
  rule_rfi = {
      action      = "deny(403)"
      priority    = "1004"
      description = "Remote file inclusion"
      preview     = false
      
      ### Detect Level 1
      #expression  = "evaluatePreconfiguredExpr('rfi-stable', ['owasp-crs-v030001-id931130-rfi'])"

      ### Detect Level 1 & 2
      expression  = "evaluatePreconfiguredExpr('rfi-v33-stable')"
  }
  #https://cloud.google.com/armor/docs/rule-tuning#method_enforcement
  rule_methodenforcement = {
      action      = "deny(403)"
      priority    = "1005"
      description = "Method enforcement"
      preview     = false
      
      ###Detect Level 1
      expression  = "evaluatePreconfiguredExpr('methodenforcement-v33-stable')"
  }
  #https://cloud.google.com/armor/docs/rule-tuning#scanner_detection
  rule_scandetection = { 
      action      = "deny(403)"
      priority    = "1006"
      description = "Scanner detection"
      preview     = false
      
      ###Detect Level 1
      #expression  = "evaluatePreconfiguredExpr('scannerdetection-stable',['owasp-crs-v030001-id913101-scannerdetection','owasp-crs-v030001-id913102-scannerdetection'])"

      ###Detect Level 1 & 2
      expression  = "evaluatePreconfiguredExpr('scannerdetection-v33-stable')"
  }
  #https://cloud.google.com/armor/docs/rule-tuning#protocol_attack
   rule_protocolattack = { 
       action      = "deny(403)"
       priority    = "1007"
       description = "Protocol Attack"
       preview     = false
      
       ### Detect Level 1
       #expression  = "evaluatePreconfiguredExpr('protocolattack-stable',['owasp-crs-v030001-id921151-protocolattack','owasp-crs-v030001-id921170-protocolattack'])"                  
      
       ### Detect Level 1 & 2
       #expression  = "evaluatePreconfiguredExpr('protocolattack-stable',['owasp-crs-v030001-id921170-protocolattack'])"
      
       ### Detect Level 1,2 & 3
       expression  = "evaluatePreconfiguredExpr('protocolattack-v33-stable')"
   }
    # #https://cloud.google.com/armor/docs/rule-tuning#php
   rule_php = { 
       action      = "deny(403)"
       priority    = "1008"
       description = "PHP"
       preview     = false
      
       ### Detect Level 1
       #expression  = "evaluatePreconfiguredExpr('php-stable',['owasp-crs-v030001-id933151-php','owasp-crs-v030001-id933131-php','owasp-crs-v030001-id933161-php','owasp-crs-v030001-id933111-php'])"
      
       ### Detect Level 1 & 2
       #expression  = "evaluatePreconfiguredExpr('php-stable',['owasp-crs-v030001-id933131-php','owasp-crs-v030001-id933161-php','owasp-crs-v030001-id933111-php'])"
      
        ### Detect Level 1,2 & 3
       expression  = "evaluatePreconfiguredExpr('php-v33-stable')"
   }
  #  #https://cloud.google.com/armor/docs/rule-tuning#session_fixation
   rule_sessionfixation = { 
       action      = "deny(403)"
       priority    = "1009"
       description = "Session Fixation"
       preview     = false
      
       ### Detect Level 1
       expression  = "evaluatePreconfiguredExpr('sessionfixation-v33-stable')"
   }
   rule_javaattack = { 
       action      = "deny(403)"
       priority    = "1010"
       description = "Java attacks"
       preview     = false
      
       ### Detect Level 1
       expression  = "evaluatePreconfiguredExpr('java-v33-stable')"
   }
   rule_nodejsattack = { 
       action      = "deny(403)"
       priority    = "1011"
       description = "NodeJS attack"
       preview     = false
      
       ### Detect Level 1
       expression  = "evaluatePreconfiguredExpr('nodejs-v33-stable')"
   }
}

countries_rules = {
      def_rule = {
          action                              = "deny(403)"
          priority                            = "3000"
          expression                          = "'[CN, RU]'.contains(origin.region_code)"
          description                         = "Deny if region code is listed"
          preview                             = false
      }
  }
