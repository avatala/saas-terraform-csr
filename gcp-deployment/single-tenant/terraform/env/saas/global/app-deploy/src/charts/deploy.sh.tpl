#!/bin/bash

apt-get update && apt-get install -y wget tar &>/dev/null
wget https://get.helm.sh/helm-v3.13.2-linux-amd64.tar.gz &>/dev/null
tar -zxvf helm-v3.13.2-linux-amd64.tar.gz &>/dev/null
mv linux-amd64/helm /usr/local/bin/helm
echo HELM_REPO_ATKN | helm registry login ghcr.io -u HELM_REPO_USER --password-stdin


helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm upgrade --install TENANT_NAME ingress-nginx/ingress-nginx  \
  --namespace TENANT_NAME --create-namespace -f ipm.yaml

helm upgrade --install inf --version=HELM_APP_VERSION \
  oci://ghcr.io/infinera/gcp-ipm-charts/infrastructure \
  --namespace=TENANT_NAME -f  ipm.yaml \
  --wait

helm upgrade --install keycloak --version=HELM_APP_VERSION \
  oci://ghcr.io/infinera/gcp-ipm-charts/auth-manager \
  --namespace=TENANT_NAME -f ipm.yaml \
  --set "global.infnRegistry.url=ghcr.io/infinera" \
  --set "global.infnRegistry.username=HELM_REPO_USER" \
  --set "global.infnRegistry.password=HELM_REPO_ATKN" \
  --wait 

helm upgrade --install am --version=HELM_APP_VERSION \
  oci://ghcr.io/infinera/gcp-ipm-charts/aggregation-manager \
  --namespace=TENANT_NAME -f ipm.yaml \
  --set "global.infnRegistry.url=ghcr.io/infinera" \
  --set "global.infnRegistry.username=HELM_REPO_USER" \
  --set "global.infnRegistry.password=HELM_REPO_ATKN" \
  --wait

helm upgrade --install dm --version=HELM_APP_VERSION \
  oci://ghcr.io/infinera/gcp-ipm-charts/domain-manager \
  --namespace=TENANT_NAME -f ipm.yaml \
  --set "global.infnRegistry.url=ghcr.io/infinera" \
  --set "global.infnRegistry.username=HELM_REPO_USER" \
  --set "global.infnRegistry.password=HELM_REPO_ATKN" \
  --wait

helm upgrade --install emu --version=HELM_APP_VERSION  \
  oci://ghcr.io/infinera/gcp-ipm-charts/emulators \
  --namespace=TENANT_NAME -f ipm.yaml \
  --set "global.infnRegistry.url=ghcr.io/infinera" \
  --set "global.infnRegistry.username=HELM_REPO_USER" \
  --set "global.infnRegistry.password=HELM_REPO_ATKN" \
  --wait

helm upgrade --install otelinfndb --version=HELM_APP_VERSION \
  oci://ghcr.io/infinera/gcp-ipm-charts/otelinfndb \
  --namespace=TENANT_NAME -f ipm.yaml \
  --set "global.infnRegistry.url=ghcr.io/infinera" \
  --set "global.infnRegistry.username=HELM_REPO_USER" \
  --set "global.infnRegistry.password=HELM_REPO_ATKN" \
  --wait

helm upgrade --install xrpmclient --version=HELM_APP_VERSION \
  oci://ghcr.io/infinera/gcp-ipm-charts/xrpmclient \
  --namespace=TENANT_NAME -f ipm.yaml \
  --set "global.infnRegistry.url=ghcr.io/infinera" \
  --set "global.infnRegistry.username=HELM_REPO_USER" \
  --set "global.infnRegistry.password=HELM_REPO_ATKN" \
  --wait
