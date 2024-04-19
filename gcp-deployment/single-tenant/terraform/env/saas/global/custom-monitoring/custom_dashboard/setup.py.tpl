# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

import shutil
import os
 
# location
location = "gcp-deployment/single-tenant/terraform/env/saas/global/custom-monitoring/"

# directory
dir = "CUSTOMER_NAME-custom-dashboard"
 
# path
path = os.path.join(location, dir)
    
isExist = os.path.exists(path)

if isExist == True:
    shutil.rmtree(path)
else:
    exit