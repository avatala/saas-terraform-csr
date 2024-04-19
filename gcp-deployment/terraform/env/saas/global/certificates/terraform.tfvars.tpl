# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

public_dns_state_bucket = "TF_BUCKET_NAME"
public_dns_prefix_path   = "gcp-deployment/terraform/env/PREFIX_NAME/global/cloud-dns/public-dns"
host_project_state_bucket = "TF_BUCKET_NAME"
host_project_prefix_path   = "gcp-deployment/terraform/env/PREFIX_NAME/resource-hierarchy/projects/host-projects"

certificate_manager = {
    certificate_manager_01 = {
        dnsauth_name = "CUSTOMER_DOMAIN-PREFIX_NAME-freemium-dns-auth"
        domain       = "FULL_FREEMIUM_SUB_DOMAIN"
        managed_zone = "CUSTOMER_DOMAIN-PREFIX_NAME-freemium-public-zone"
        cert_name    = "CUSTOMER_DOMAIN.PREFIX_NAME-freemium-cert"
        cert_domain  = ["*.FULL_FREEMIUM_SUB_DOMAIN"]
        },
    
    certificate_manager_02 = {
        dnsauth_name = "CUSTOMER_DOMAIN-PREFIX_NAME-enterprise-dns-auth"
        domain       = "FULL_ENTERPRISE_SUB_DOMAIN"
        managed_zone = "CUSTOMER_DOMAIN-PREFIX_NAME-enterprise-public-zone"
        cert_name    = "CUSTOMER_DOMAIN.CUSTOMER_DOMAIN.PREFIX_NAME-enterprise-cert"
        cert_domain  = ["*.FULL_ENTERPRISE_SUB_DOMAIN"]
        }

}