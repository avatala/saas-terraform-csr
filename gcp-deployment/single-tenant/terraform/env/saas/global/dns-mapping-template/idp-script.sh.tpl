curl -X POST https://FUNCTION_URI \
-H "Authorization: bearer $(gcloud auth print-identity-token)" \
-H "Content-Type: application/json" \
-d '{
    "operation": "updateTenancy",
    "tenantId": "CUSTOMER_NAME", 
    "ipTenantId": "IDP__SECRET" 
}'


curl -X POST https://FUNCTION_URI \
-H "Authorization: bearer $(gcloud auth print-identity-token)" \
-H "Content-Type: application/json" \
-d '{
  "operation": "updateVendor",
  "defaultVendorEmail": "VENDOR__EMAIL__ID",
  "callbackUrl": "GCIP__LOGIN__URL"

}'