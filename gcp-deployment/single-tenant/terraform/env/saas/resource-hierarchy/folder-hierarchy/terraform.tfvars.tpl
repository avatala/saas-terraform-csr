# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
 Service Folder Details
*****************************************/


service_folders = {
    service_folder_01 = {
      parent_type = "folders"
      parent_id   = "${FOLDER_ID}"
      names       = ["${_ENTERPRISE_FOLDER_NAME}"]
}
}