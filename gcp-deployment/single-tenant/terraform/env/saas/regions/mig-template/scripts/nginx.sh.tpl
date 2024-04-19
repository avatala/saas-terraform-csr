# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

sudo apt-get update -y
sudo apt install nginx -y
cd /etc/nginx/sites-available/
sudo mv default default_back
sudo gsutil cp gs://PREFIX_NAME-config-us-ct1-storage/enterprise/default-enterprise.conf /etc/nginx/sites-available/default
sudo nginx -t
sudo service nginx restart