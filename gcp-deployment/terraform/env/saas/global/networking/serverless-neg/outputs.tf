# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */
/******************************************
	output for admin portal serverless neg
 *****************************************/

output "admin-portal" {
    value = module.admin-portal.id
}

output "master_cf" {
    value = module.master_cf.id
}

output "email_verification" {
    value = module.email_verification.id
}

output "gcip" {
    value = module.gcip.id
}