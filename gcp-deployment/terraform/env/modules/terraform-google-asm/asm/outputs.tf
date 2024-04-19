# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

output "revision_name" {
  value       = local.revision_name
  description = "The name of the installed managed ASM revision."
}

output "wait" {
  value       = module.cpr.wait
  description = "An output to use when depending on the ASM installation finishing."
}
