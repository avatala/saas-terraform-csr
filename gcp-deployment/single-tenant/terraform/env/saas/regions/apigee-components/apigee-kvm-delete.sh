#!/bin/bash

curl --request DELETE \
  "https://apigee.googleapis.com/v1/organizations/$HOST_PROJECT_ID/environments/$_PREFIX-env/keyvaluemaps/balance-reader-kvm/entries/$_CUSTOMER_NAME" \
  --header "Authorization: Bearer $(gcloud auth print-access-token)" \
  --header 'Accept: application/json' \
  --compressed

curl --request DELETE \
  "https://apigee.googleapis.com/v1/organizations/$HOST_PROJECT_ID/environments/$_PREFIX-env/keyvaluemaps/contacts-kvm/entries/$_CUSTOMER_NAME" \
  --header "Authorization: Bearer $(gcloud auth print-access-token)" \
  --header 'Accept: application/json' \
  --compressed

curl --request DELETE \
  "https://apigee.googleapis.com/v1/organizations/$HOST_PROJECT_ID/environments/$_PREFIX-env/keyvaluemaps/transaction-history-kvm/entries/$_CUSTOMER_NAME" \
  --header "Authorization: Bearer $(gcloud auth print-access-token)" \
  --header 'Accept: application/json' \
  --compressed

