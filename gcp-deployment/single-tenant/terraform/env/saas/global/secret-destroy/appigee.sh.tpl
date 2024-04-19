curl -X POST https://FUNCTION_URI \
-H "Authorization: bearer $(gcloud auth print-identity-token)" \
-H "Content-Type: application/json" \
-d '{
    "operation": "tenantOnboardingStatus", 
    "subdomain": "CUSTOMER_NAME", 
    "projectId": "BUILD_PROJECT_ID", 
    "triggerId": "BUILD_ID", 
    "location": "REGION",
    "stage": 21, 
    "totalStages": 23
}'

curl -X POST https://FUNCTION_URI \
-H "Authorization: bearer $(gcloud auth print-identity-token)" \
-H "Content-Type: application/json" \
-d '{
    "operation": "createTenantAdmin",
     "email": "CUSTOMER_EMAIL"
}'
