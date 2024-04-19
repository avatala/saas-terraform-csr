global:
  keycloak:
    hosts:
      - IPM_DOMAIN
      - PLGD_DOMAIN
  ingress:
    hosts:
      - IPM_DOMAIN
    tls:
      - hosts:
        - IPM_DOMAIN
    ingressClassName: ING_NAME
googlecas:
  project: GCAS_PROJECT
  location: GCAS_LOCATION
  caPoolId: CUSTOMER_NAME-googlecas-pool
cacert:
  commonName: "BASE_DOMAIN"
  dnsNames:
    - "*.BASE_DOMAIN"
  subject:
    organizations:
      - "IPM XR Optics"
    countries:
      - USA
    organizationalUnits:
      - "System Architecture"
    localities:
      - "San Jose"
    provinces:
      - California
tcp:
  "5684": "5684"
  "25684": "25684"
  "1883": "1883"
  "8883": "8883"
controller:
  ingressClassByName: true
  ingressClassResource:
    name: TENANT_NAME
    controllerValue: "k8s.io/TENANT_NAME"
    enabled: true
  replicaCount: 1
  watchNamespace: "TENANT_NAME"
keycloakx:
  keycloak:
    hostname: IPM_DOMAIN 
  ingress:
    ingressClassName: ING_NAME
    rules:    
      - host: IPM_DOMAIN
        paths:
          - path: '/admin'
            pathType: Prefix
          - path: '/realms'
            pathType: Prefix
          - path: '/resources'
            pathType: Prefix
          - path: '/js'
            pathType: Prefix    
      - host: PLGD_DOMAIN
        paths:
          - path: '/admin'
            pathType: Prefix
          - path: '/realms'
            pathType: Prefix
          - path: '/resources'
            pathType: Prefix
          - path: '/js'
            pathType: Prefix 			
    console:
      ingressClassName: ING_NAME
      rules:
        - host: IPM_DOMAIN
          paths:
            - path: '/admin'
              pathType: Prefix
        - host: PLGD_DOMAIN
          paths:
            - path: '/admin'
              pathType: Prefix			
namespace_inf: TENANT_NAME
namespace_am: TENANT_NAME
namespace_keycloak: TENANT_NAME
useSelfSignedIssuer: true
useGoogleCASIssuer: false
plgd-hub:
  global:
    domain: "IPM_DOMAIN"
    apiDomain: "IPM_DOMAIN"
    oauth:
      device:
        - name: "plgd.dps"
          clientID: "xr-plgd-client"
          clientSecret: "xr-plgd-client"
          grantType: "clientCredentials"
          redirectURL: "https://IPM_DOMAIN/things"
          useInUi: true
      web:
        scopes: [openid]
  certificateauthority:
    domain: "IPM_DOMAIN"
    apiDomain: "IPM_DOMAIN"	
  grpcgateway:
    domain: "IPM_DOMAIN"
    apiDomain: "IPM_DOMAIN"	
  coapgateway:
    service:
      type: ClusterIP
      nodePort: null		  
  httpgateway:
    enabled: true
    uiDomain: "PLGD_DOMAIN"
    apiDomain: "PLGD_DOMAIN"		
  resourcedirectory:
    publicConfiguration:
      authority: "https://IPM_DOMAIN/realms/xr-cm"
plgd-dps:
  global:
    domain: "IPM_DOMAIN"
    apiDomain: "IPM_DOMAIN"      
    oauth:
      device:
        - name: "plgd.dps"
          clientID: "xr-plgd-client"
          clientSecret: "xr-plgd-client"
          grantType: "clientCredentials"
          redirectURL: "https://IPM_DOMAIN/things"
          useInUi: true
      web:
        scopes: [openid]
  deviceProvisioningService:
    service:
      type: ClusterIP
      nodePort: null
temporal:
  server:
    config:
      tls:
        internode:
          client:
            serverName: IPM_DOMAIN
        frontend:
          client:
            serverName: IPM_DOMAIN
xripm-int:
  enabled: true
grafana:
  ingress:
    enabled: true
    ingressClassName: ING_NAME
    hosts:
    - OTEL_DOMAIN
    tls:
    - secretName: grafana-tls
      hosts:
      - OTEL_DOMAIN
  fullnameOverride: otelinfndb-grafana-TENANT_NAME
collector:
  emqx:
    enabled: false
  influxdb:
    ingress:
      ingressClassName: ING_NAME
      hostname: INFL_DOMAIN
      extraTls:
      - hosts:
        - INFL_DOMAIN
        secretName: influxdb-tls
  sharding:
    endpoints:
      mqttClient: 
        broker: "tcp://inf-emqx-headless:1883"
  config:
    receivers:
      infnxrmetrics:
        mqtt_configs:
          broker:
            server: "inf-emqx-headless"
            port: 1883
config:
  mqtt:
    endpoint: "tcp://inf-emqx-headless:1883"
    publish_metrics: true
  ipm:
    enabled: true
    hostname: keycloak-keycloakx-http
    get_modules_end_point: http://xr-mm:8080/api/v1/modules?content=all