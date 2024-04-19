curl -X POST https://CLOUD_FUNCTION_URI \
-H "Authorization: Bearer $(gcloud auth print-identity-token)" \
-H "Content-Type: application/json" \
-d '{
    "operation": "updateTenantInfo",
    "tenantId": "TENANT_ID",
    "info": {
    "version": "APP_VERSION"
    }
}'