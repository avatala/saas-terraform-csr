#!/bin/bash

appkey=$(curl -sS \
  "https://apigee.googleapis.com/v1/organizations/HOST_PROJECT/developers/CUSTOMER_EMAIL/apps/CUSTOMER_NAME-app" \
  --header "Authorization: Bearer $(gcloud auth print-access-token)" \
  --header 'Accept: application/json' \
  --compressed | jq -r '.credentials[0].consumerKey')

appsecret=$(curl -sS \
  "https://apigee.googleapis.com/v1/organizations/HOST_PROJECT/developers/CUSTOMER_EMAIL/apps/CUSTOMER_NAME-app" \
  --header "Authorization: Bearer $(gcloud auth print-access-token)" \
  --header 'Accept: application/json' \
  --compressed | jq -r '.credentials[0].consumerSecret')

curl --request POST \
  "https://apigee.googleapis.com/v1/organizations/HOST_PROJECT/environments/PREFIX_NAME-env/keyvaluemaps/boa-config-map/entries" \
  --header "Authorization: Bearer $(gcloud auth print-access-token)" \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{"name":"'$appkey'","value":"CUSTOMER_NAME.ENTERPRISE_SUB_DOMAIN"}' \
  --compressed

curl -X POST https://FUNCTION_URI \
-H "Authorization: bearer $(gcloud auth print-identity-token)" \
-H "Content-Type: application/json" \
-d '{
    "operation": "apigeeCreds",
    "email": "CUSTOMER_EMAIL",
    "appKey": "'$appkey'",
    "appSecret": "'$appsecret'",
    "host": "apigee-saas.PREFIX_NAME.FULL_ADMIN_DOMAIN"
}'