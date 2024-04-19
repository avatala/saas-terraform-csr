# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

resource "google_project_iam_custom_role" "my_custom_role" {

  project     = var.project
  role_id     = var.role_id
  title       = var.role_id
  stage       = "GA"
  permissions = var.permissions
}
