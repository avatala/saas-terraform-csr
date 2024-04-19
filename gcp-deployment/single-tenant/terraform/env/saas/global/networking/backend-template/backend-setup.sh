#!/bin/bash

command="gcloud compute url-maps add-path-matcher ${_PREFIX}-lb --default-service=https://www.googleapis.com/compute/v1/projects/${host_project_id}/global/backendServices/${_CUSTOMER_NAME}-lb-backend --path-matcher-name ${_CUSTOMER_NAME}-matcher  --new-hosts=${_CUSTOMER_NAME}.${_ENTERPRISE_SUB_DOMAIN} --path-rules="/=https://www.googleapis.com/compute/v1/projects/${host_project_id}/global/backendServices/${_CUSTOMER_NAME}-lb-backend" --project ${host_project_id}"

while true; do
  output=$($command 2>&1)
  if [[ "$output" == *"Updated"* ]]; then
    echo "Command output: $output"
    break
  else
    echo "Command output: $output"
    echo "Waiting for 'Updated' in output..."
    sleep 2
  fi
done
