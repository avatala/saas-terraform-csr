# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

server {
    listen       80;
    server_name  .FULL_ENTERPRISE_SUB_DOMAIN;
    location / {
        proxy_request_buffering off;
        proxy_set_header Host $host;
    	resolver 169.254.169.254;
        proxy_pass http://$host:80;
	proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "Upgrade";
    }
    location /health {
        access_log off;
        return 200 "healthy\n";
    }
}