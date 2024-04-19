# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */


resource "google_project_iam_member" "project_iam_member" {
  for_each = toset(var.project_roles)
  project  = var.project_id
  role     = each.key
  member   = "serviceAccount:${var.service_account_address}"
}
