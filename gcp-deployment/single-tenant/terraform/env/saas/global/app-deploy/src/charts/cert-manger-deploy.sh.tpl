#!/bin/bash
set -e
apt-get update && apt-get install -y wget tar &>/dev/null
wget https://get.helm.sh/helm-v3.13.2-linux-amd64.tar.gz &>/dev/null
tar -zxvf helm-v3.13.2-linux-amd64.tar.gz &>/dev/null
mv linux-amd64/helm /usr/local/bin/helm
echo HELM_REPO_ATKN | helm registry login ghcr.io -u HELM_REPO_USER --password-stdin


if [[ $(helm status cert-manager -n cert-manager | grep "STATUS:" | awk '{print $2}') == "deployed" ]]; then
  echo "cert-manager helm chart in cert-manager namespace exists. Moving to the next step."
else
  echo "cert-manager helm chart in cert-manager namespace not exists. Running Helm upgrade."
  helm repo add jetstack https://charts.jetstack.io
  helm repo update
  helm upgrade --install cert-manager --version=v1.13.2 \
    oci://ghcr.io/infinera/gcp-ipm-charts/cert-manager \
    --create-namespace --namespace=cert-manager \
    --set "cacert.commonName=IPM_DOMAIN" \
    --set "cacert.dnsNames={\*.IPM_DOMAIN}" \
    --wait
fi

# if ! kubectl get namespace cert-manager &>/dev/null; then
#   helm repo add jetstack https://charts.jetstack.io
#   helm repo update
#   helm upgrade --install cert-manager jetstack/cert-manager \
#     --create-namespace \
#     --namespace cert-manager \
#     --create-namespace \
#     --version v1.13.2 \
#     -f values.yaml
# else
#   echo "cert-manager namespace exists. Moving to the next step."
# fi

# if [[ $(gcloud services list --enabled --filter="privateca.googleapis.com") != "privateca.googleapis.com" ]]; then
#   gcloud services enable privateca.googleapis.com --project PROJECT
#   echo "Waiting for API to be enabled..."
#   sleep 120
# fi

# if ! gcloud privateca pools describe CUSTOMER_NAME-googlecas-pool --project PROJECT --location REGION &>/dev/null; then
#   gcloud privateca pools create CUSTOMER_NAME-googlecas-pool --project PROJECT --location REGION
# else
#   echo "Pool CUSTOMER_NAME-googlecas-pool already exists. Moving to the next step."
# fi

# if ! gcloud privateca roots describe CUSTOMER_NAME-googlecas-ca --pool CUSTOMER_NAME-googlecas-pool --project PROJECT --location REGION &>/dev/null; then
#   # Root does not exist, create it
#   gcloud privateca roots create CUSTOMER_NAME-googlecas-ca --pool CUSTOMER_NAME-googlecas-pool --project PROJECT --key-algorithm "ec-p384-sha384" --subject="CN=CUSTOMER_NAME-cn,O=CUSTOMER_NAME-org,OU=CUSTOMER_NAME-ou"  --location REGION --quiet
#   gcloud privateca roots enable  CUSTOMER_NAME-googlecas-ca --pool CUSTOMER_NAME-googlecas-pool --project PROJECT --location REGION
# else
#   echo "CA CUSTOMER_NAME-googlecas-ca already exists."
# fi

# if ! kubectl get pods -n cert-manager | grep -q cert-manager-google-cas-issuer; then
#   helm repo add jetstack https://charts.jetstack.io
#   helm repo update
#   helm upgrade -i cert-manager-google-cas-issuer jetstack/cert-manager-google-cas-issuer -n cert-manager --wait
# else
#   echo "Google CAS issuer already exists. Moving to the next step."
# fi

# gcloud projects add-iam-policy-binding PROJECT \
#   --member="serviceAccount:SERVICE_ACCOUNT" \
#   --role=roles/certificatemanager.owner

# gcloud projects add-iam-policy-binding PROJECT \
#   --member="serviceAccount:SERVICE_ACCOUNT" \
# 	--role=roles/privateca.admin

# if kubectl get serviceaccount -n cert-manager cert-manager-google-cas-issuer -o jsonpath='{.metadata.annotations.iam\.gke\.io/gcp-service-account}' | grep SERVICE_ACCOUNT; then
#   echo "Annotation already exists. Skipping IAM policy binding and annotation."
# else
#   # Add IAM policy binding
#   gcloud iam service-accounts add-iam-policy-binding \
#     --project PROJECT \
#     --role roles/iam.workloadIdentityUser \
#     --member "serviceAccount:PROJECT.svc.id.goog[cert-manager/cert-manager-google-cas-issuer]" \
#     SERVICE_ACCOUNT

#   # Annotate the service account
#   kubectl annotate serviceaccount \
#     --namespace cert-manager \
#     cert-manager-google-cas-issuer \
#     iam.gke.io/gcp-service-account=SERVICE_ACCOUNT \
#     --overwrite=true

#   echo "IAM policy binding and annotation completed."
# fi

if [[ $(helm status ipm-certs -n cert-manager | grep "STATUS:" | awk '{print $2}') == "deployed" ]]; then
    echo "ipm chart in cert-manager namespace exists. Skipping Helm upgrade."
else
  echo "ipm chart in cert-manager namespace does not exist. Running Helm upgrade."
  helm upgrade --install ipm-certs --version=v1.13.3 \
    oci://ghcr.io/infinera/gcp-ipm-charts/cert-manager \
    --create-namespace --namespace=cert-manager -f ipm.yaml \
    --wait
fi