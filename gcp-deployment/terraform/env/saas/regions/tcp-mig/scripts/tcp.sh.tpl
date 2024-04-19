# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

sudo apt-get update -y
sudo apt install nginx -y
sudo sed -i '10i\stream {include tcp.conf;}' /etc/nginx/nginx.conf
gsutil rsync gs://PREFIX_NAME-tcp-config-us-ct1-storage/ /etc/nginx/
export last_modified=0

while true; do
    modified=$(stat -c %Y /etc/nginx/tcp.conf)
    if [ "$modified" -gt "$last_modified" ]; then
        echo "File has been updated!"
        sudo nginx -t
        sudo service nginx restart
    else
        echo "File has not been updated."
        gsutil rsync gs://PREFIX_NAME-tcp-config-us-ct1-storage/ /etc/nginx/
    fi
    last_modified="$modified"
    sleep 1
done