#!/bin/bash

gcloud container clusters get-credentials $_CUSTOMER_NAME-saas-tenant-cluster-us-ct1-01 --region $_REGION --project $_ENTERPRISE_PROJECT_ID

curl --request PUT \
  "https://apigee.googleapis.com/v1/organizations/$HOST_PROJECT_ID/developers/$_CUSTOMER_EMAIL/apps/$_CUSTOMER_NAME-app" \
  --header "Authorization: Bearer $(gcloud auth print-access-token)" \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{"callbackUrl":"https://apigee-saas.$_PREFIX.$ADMIN_DOMAIN/oauth/coderesponse","apiProducts":["transaction-history-product-v1","contacts-product-v1","balance-reader-product-v1","bank-of-anthos-identity-product-v1"],"attributes":[{"name":"balanceReaderUrl","value":"'http://$(kubectl get svc balancereader-lb -n $_CUSTOMER_NAME -o jsonpath="{.status.loadBalancer.ingress[0].ip}")'"},{"name":"contactUrl","value":"'http://$(kubectl get svc contacts-lb -n $_CUSTOMER_NAME -o jsonpath="{.status.loadBalancer.ingress[0].ip}")'"},{"name":"transactionHistoryUrl","value":"'http://$(kubectl get svc transactionhistory-lb -n $_CUSTOMER_NAME -o jsonpath="{.status.loadBalancer.ingress[0].ip}")'"}]}' \
  --compressed

curl --request POST \
  "https://apigee.googleapis.com/v1/organizations/$HOST_PROJECT_ID/environments/$_PREFIX-env/keyvaluemaps/balance-reader-kvm/entries" \
  --header "Authorization: Bearer $(gcloud auth print-access-token)" \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{"name":"$_CUSTOMER_NAME","value":"'http://$(kubectl get svc balancereader-lb -n $_CUSTOMER_NAME -o jsonpath="{.status.loadBalancer.ingress[0].ip}")'"}' \
  --compressed

curl --request POST \
  "https://apigee.googleapis.com/v1/organizations/$HOST_PROJECT_ID/environments/$_PREFIX-env/keyvaluemaps/contacts-kvm/entries" \
  --header "Authorization: Bearer $(gcloud auth print-access-token)" \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{"name":"$_CUSTOMER_NAME","value":"'http://$(kubectl get svc contacts-lb -n $_CUSTOMER_NAME -o jsonpath="{.status.loadBalancer.ingress[0].ip}")'"}' \
  --compressed

curl --request POST \
  "https://apigee.googleapis.com/v1/organizations/$HOST_PROJECT_ID/environments/$_PREFIX-env/keyvaluemaps/transaction-history-kvm/entries" \
  --header "Authorization: Bearer $(gcloud auth print-access-token)" \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{"name":"$_CUSTOMER_NAME","value":"'http://$(kubectl get svc transactionhistory-lb -n $_CUSTOMER_NAME -o jsonpath="{.status.loadBalancer.ingress[0].ip}")'"}' \
  --compressed
