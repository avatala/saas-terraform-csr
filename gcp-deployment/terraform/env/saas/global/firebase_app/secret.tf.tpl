# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

locals {
    secret_manager={
        secret_manager_01={
            id = "PREFIX_NAME_API_KEY"
            secret = module.firebase_app["firebase_app_01"].api
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_02={
            id = "PREFIX_NAME_MESSAGING_SENDER_ID"
            secret = module.firebase_app["firebase_app_01"].messaging_sender_id
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_03={
            id = "PREFIX_NAME_APP_ID"
            secret = module.firebase_app["firebase_app_01"].app_id
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_04={
            id = "PREFIX_NAME_PROJECT_ID"
            secret = module.firebase_app["firebase_app_01"].project
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        },
        secret_manager_05={
            id = "PREFIX_NAME_VENDOR_EMAIL_ID"
            secret = "VENDOR_EMAIL_ID_"
            labels ={
                organization = "PREFIX_NAME"
                createdby= "terraform"
            }
        }
    }
}