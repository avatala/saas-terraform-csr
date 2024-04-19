curl -X POST https://FUNCTION_URI \
-H "Authorization: bearer $(gcloud auth print-identity-token)" \
-H "Content-Type: application/json" \
-d '{
  "operation": "initTenantStatus",
  "buildTitleArray": [
    {"buildTitle": "To start the single tenant deployment process", "groupTitle": "Tenant onboarding prerequisite creation"},
    {"buildTitle": "To create the secret on Secret Manager", "groupTitle": "Tenant onboarding prerequisite creation"},
    {"buildTitle": "To create folder for project", "groupTitle": "Tenant onboarding prerequisite creation"},
    {"buildTitle": "To create the service project", "groupTitle": "Tenant onboarding prerequisite creation"},
    {"buildTitle": "To create the service account", "groupTitle": "Tenant onboarding prerequisite creation"},
    {"buildTitle": "To create the custom role", "groupTitle": "Tenant onboarding prerequisite creation"},
    {"buildTitle": "To create the iam bindings", "groupTitle": "Tenant onboarding prerequisite creation"},
    {"buildTitle": "To create the subnet", "groupTitle": "Tenant onboarding prerequisite creation"},
    {"buildTitle": "To create the instance group", "groupTitle": "Tenant onboarding prerequisite creation"},
    {"buildTitle": "To create the backend for the existing loadbalancer", "groupTitle": "Tenant onboarding prerequisite creation"},
    {"buildTitle": "To create the bigquery", "groupTitle": "Application Deployment process Initialisation"},
    {"buildTitle": "To create the gke cluster", "groupTitle": "Application Deployment process Initialisation"},
    {"buildTitle": "To configure the ACM & ASM", "groupTitle": "Application Deployment process Initialisation"},
    {"buildTitle": "To create the scheduled query on service", "groupTitle": "Application Deployment process Initialisation"},
    {"buildTitle": "To create the workload identity", "groupTitle": "Application Deployment process Initialisation"},
    {"buildTitle": "To create the Cloud deploy", "groupTitle": "Application Deployment process Initialisation"},
    {"buildTitle": "To create the github repository", "groupTitle": "Application Deployment process Initialisation"},
    {"buildTitle": "To push the application on customer github repository", "groupTitle": "Application Deployment process Initialisation"},
    {"buildTitle": "To map the load balancer IP with Cloud Dns", "groupTitle": "Application Deployment process Initialisation"},
    {"buildTitle": "To create the tenant metric scope", "groupTitle": "Tenant onboarding process Complete"},
    {"buildTitle": "To create the tenant dashboard", "groupTitle": "Tenant onboarding process Complete"},
    {"buildTitle": "Destroy all the created secrets", "groupTitle": "Tenant onboarding process Complete"},
    {"buildTitle": "Create Appige Component", "groupTitle": "Tenant onboarding process Complete"}  
  ],
  "subdomain": "CUSTOMER_NAME"
}'