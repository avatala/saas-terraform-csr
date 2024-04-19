# domain-manager

![Version: v1.2.3-11](https://img.shields.io/badge/Version-v1.2.3--11-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.2.3-11](https://img.shields.io/badge/AppVersion-v1.2.3--11-informational?style=flat-square)

A Helm chart for IPM DM Solution

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://pt-artifactory.infinera.com/artifactory/pt-helm-virtual | temporal | 0.25.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| cluster.dns | string | `"cluster.local"` | Cluster internal DNS prefix |
| da.clients.jetstream.tls.caPool | string | `"/certs/jetstream/ca.crt"` | Root CA certificate in PEM format |
| da.clients.jetstream.tls.certFile | string | `"/certs/jetstream/tls.crt"` | client public certificate in PEM format |
| da.clients.jetstream.tls.keyFile | string | `"/certs/jetstream/tls.key"` | client private key in PEM format |
| da.clients.jetstream.uri | string | `nil` | uri for jetstream server, defaults for deployed Nats server from Infrastructure chart |
| da.clients.mongoDB.tls.caPool | string | `"/certs/mongoDB/ca.crt"` | Root CA certificate in PEM format |
| da.clients.mongoDB.tls.certFile | string | `"/certs/mongoDB/tls.crt"` | client public certificate in PEM format |
| da.clients.mongoDB.tls.keyFile | string | `"/certs/mongoDB/tls.key"` | client private key in PEM format |
| da.clients.mongoDB.uri | string | `nil` | uri for MongoDB server, defaults for deployed MongoDB server from Infrastructure chart |
| da.clients.temporal.activity.startToCloseTimeout | timeDuration | `nil` | default temporal activity options builder start to close timeout value |
| da.clients.temporal.child.executionTimeout | timeDuration | `nil` | default temporal child workflow options builder execution timeout value |
| da.clients.temporal.local.startToCloseTimeout | timeDuration | `nil` | default temporal local activity options builder start to close timeout value |
| da.clients.temporal.namespace | string | `"ipm"` | default namespace to be used and created if inexistent |
| da.clients.temporal.retry.executionTimeout | timeDuration | `nil` | default temporal workflow options builder execution timeout value |
| da.clients.temporal.retry.maximumAttemps | int | `nil` | default temporal retry policy builder maximum attempts value |
| da.clients.temporal.retry.maximumInterval | timeDuration | `nil` | default temporal retry policy builder maximum interval value |
| da.clients.temporal.tls.caPool | string | `"/certs/temporal/ca.crt"` | Root CA certificate in PEM format |
| da.clients.temporal.tls.certFile | string | `"/certs/temporal/tls.crt"` | client public certificate in PEM format |
| da.clients.temporal.tls.keyFile | string | `"/certs/temporal/tls.key"` | client private key in PEM format |
| da.clients.temporal.uri | string | `nil` | uri for Temporal server, defaults for deployed Temporal server from Domain Manager chart |
| da.clients.temporal.workflow.executionTimeout | timeDuration | `nil` |  |
| da.config | object | `{"ExecutorQueueSize":null,"JsMacAckPending":null,"fileName":"xr-da-service.yaml","jsAckWait":null,"logLevel":"debug"}` | Service configuration |
| da.config.fileName | string | `"xr-da-service.yaml"` | Service configuration file |
| da.deploymentAnnotations | object | `{}` | Additional annotations for event_gateway deployment |
| da.deploymentLabels | object | `{}` | Additional labels for event_gateway deployment |
| da.extraVolumeMounts | list | `[{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true},{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true},{"mountPath":"/certs/temporal","name":"temporal-tls","readOnly":true}]` | Optional extra volume mounts |
| da.extraVolumeMounts[0] | object | `{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true}` | extra volume mount for nats tls secret |
| da.extraVolumeMounts[1] | object | `{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true}` | extra volume mount for mongoDB tls secret |
| da.extraVolumes | list | `[{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}},{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}},{"name":"temporal-tls","secret":{"secretName":"temporal-client-tls"}}]` | Optional extra volume mounts |
| da.extraVolumes[0] | object | `{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}}` | extra volume for nats tls secret |
| da.extraVolumes[1] | object | `{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}}` | extra volume for mongoDB tls secret |
| da.extraVolumes[2] | object | `{"name":"temporal-tls","secret":{"secretName":"temporal-client-tls"}}` | extra volume for temporal tls secret             |
| da.fullnameOverride | string | `"xr-da"` | Full name to override |
| da.image.ExecutorQueueSize | string | `nil` |  |
| da.image.JsMacAckPending | string | `nil` |  |
| da.image.imagePullSecrets | object | `{}` | Image pull secrets |
| da.image.jsAckWait | string | `nil` |  |
| da.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| da.image.registry | string | `"pt-nexus01-prd.infinera.com/"` | Image registry |
| da.image.repository | string | `"xr-cm/da"` | Image repository |
| da.image.tag | string | `"v1.2.3-1"` | Image tag. |
| da.ingress.className | string | `""` |  |
| da.ingress.enabled | bool | `true` |  |
| da.ingress.fileName | string | `"xr-da-ingress.yaml"` |  |
| da.ingress.paths[0].backend.service.name | string | `"xr-da"` |  |
| da.ingress.paths[0].backend.service.port | string | `"mi-port"` |  |
| da.ingress.paths[0].path | string | `"/da"` |  |
| da.ingress.paths[0].pathType | string | `"Prefix"` |  |
| da.ingress.tls | list | `[]` |  |
| da.initContainersTpl | object | `{}` | Init containers definition. Resolved as template |
| da.name | string | `"xr-da"` |  |
| da.podAnnotations | object | `{}` | Annotations for event_gateway pod |
| da.podLabels | object | `{}` | Labels for event_gateway pod |
| da.port | int | `8080` |  |
| da.rbac.enabled | bool | `false` | Create RBAC config |
| da.rbac.roleBindingDefinitionTpl | string | `nil` | template definition for Role/binding etc.. |
| da.rbac.serviceAccountName | string | `"device-aggregator"` | Name of event_gateway SA |
| da.replicas | int | `1` | Number of replicas |
| da.resources | object | `{}` | Resources limit |
| da.restartPolicy | string | `"Always"` | Restart policy for pod |
| da.securityContext | object | `{}` | Security context for pod |
| da.service.labels | object | `{}` | Labels for event_gateway service |
| da.service.type | string | `"ClusterIP"` | Service type |
| dfm.clients.jetstream.tls.caPool | string | `"/certs/jetstream/ca.crt"` | Root CA certificate in PEM format |
| dfm.clients.jetstream.tls.certFile | string | `"/certs/jetstream/tls.crt"` | client public certificate in PEM format |
| dfm.clients.jetstream.tls.keyFile | string | `"/certs/jetstream/tls.key"` | client private key in PEM format |
| dfm.clients.jetstream.uri | string | `nil` | uri for jetstream server, defaults for deployed Nats server from Infrastructure chart |
| dfm.clients.mongoDB.tls.caPool | string | `"/certs/mongoDB/ca.crt"` | Root CA certificate in PEM format |
| dfm.clients.mongoDB.tls.certFile | string | `"/certs/mongoDB/tls.crt"` | client public certificate in PEM format |
| dfm.clients.mongoDB.tls.keyFile | string | `"/certs/mongoDB/tls.key"` | client private key in PEM format |
| dfm.clients.mongoDB.uri | string | `nil` | uri for MongoDB server, defaults for deployed MongoDB server from Infrastructure chart |
| dfm.config | object | `{"ExecutorQueueSize":null,"JsMacAckPending":null,"fileName":"xr-dfm-service.yaml","jsAckWait":null,"logLevel":"debug","mountPath":"/config","volume":"config"}` | Service configuration |
| dfm.config.fileName | string | `"xr-dfm-service.yaml"` | Service configuration file |
| dfm.config.mountPath | string | `"/config"` | Configuration mount path |
| dfm.config.volume | string | `"config"` | Service configuration volume name |
| dfm.deploymentAnnotations | object | `{}` | Additional annotations for event_gateway deployment |
| dfm.deploymentLabels | object | `{}` | Additional labels for event_gateway deployment |
| dfm.extraVolumeMounts | list | `[{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true},{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true}]` | Optional extra volume mounts |
| dfm.extraVolumeMounts[0] | object | `{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true}` | extra volume mount for nats tls secret |
| dfm.extraVolumeMounts[1] | object | `{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true}` | extra volume mount for mongoDB tls secret |
| dfm.extraVolumes | list | `[{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}},{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}}]` | Optional extra volume mounts |
| dfm.extraVolumes[0] | object | `{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}}` | extra volume for nats tls secret |
| dfm.extraVolumes[1] | object | `{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}}` | extra volume for mongoDB tls secret |
| dfm.fullnameOverride | string | `"xr-dfm"` | Full name to override |
| dfm.image.imagePullSecrets | object | `{}` | Image pull secrets |
| dfm.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| dfm.image.registry | string | `"pt-nexus01-prd.infinera.com/"` | Image registry |
| dfm.image.repository | string | `"xr-cm/dfm"` | Image repository |
| dfm.image.tag | string | `"v1.2.3-2"` | Image tag. |
| dfm.ingress.annotations."nginx.org/websocket-services" | string | `"xr-dfm"` |  |
| dfm.ingress.className | string | `""` |  |
| dfm.ingress.enabled | bool | `true` |  |
| dfm.ingress.fileName | string | `"xr-dfm-ingress.yaml"` |  |
| dfm.ingress.paths[0].backend.service.name | string | `"xr-dfm"` |  |
| dfm.ingress.paths[0].backend.service.port | string | `"dfm-port"` |  |
| dfm.ingress.paths[0].path | string | `"/api/v1/alarmList"` |  |
| dfm.ingress.paths[0].pathType | string | `"Prefix"` |  |
| dfm.ingress.paths[1].backend.service.name | string | `"xr-dfm"` |  |
| dfm.ingress.paths[1].backend.service.port | string | `"dfm-port"` |  |
| dfm.ingress.paths[1].path | string | `"/api/v1/alarms"` |  |
| dfm.ingress.paths[1].pathType | string | `"Prefix"` |  |
| dfm.ingress.paths[2].backend.service.name | string | `"xr-dfm"` |  |
| dfm.ingress.paths[2].backend.service.port | string | `"dfm-port"` |  |
| dfm.ingress.paths[2].path | string | `"/api/v1/ietf-alarms:alarms"` |  |
| dfm.ingress.paths[2].pathType | string | `"Prefix"` |  |
| dfm.ingress.paths[3].backend.service.name | string | `"xr-dfm"` |  |
| dfm.ingress.paths[3].backend.service.port | string | `"dfm-port"` |  |
| dfm.ingress.paths[3].path | string | `"/dfm"` |  |
| dfm.ingress.paths[3].pathType | string | `"Prefix"` |  |
| dfm.ingress.paths[4].backend.service.name | string | `"xr-dfm"` |  |
| dfm.ingress.paths[4].backend.service.port | string | `"dfm-port"` |  |
| dfm.ingress.paths[4].path | string | `"/dfm/swagger"` |  |
| dfm.ingress.paths[4].pathType | string | `"Prefix"` |  |
| dfm.ingress.tls | list | `[]` |  |
| dfm.initContainersTpl | object | `{}` | Init containers definition. Resolved as template |
| dfm.name | string | `"xr-dfm"` |  |
| dfm.podAnnotations | object | `{}` | Annotations for event_gateway pod |
| dfm.podLabels | object | `{}` | Labels for event_gateway pod |
| dfm.port | int | `8080` |  |
| dfm.rbac.enabled | bool | `false` | Create RBAC config |
| dfm.rbac.roleBindingDefinitionTpl | string | `nil` | template definition for Role/binding etc.. |
| dfm.rbac.serviceAccountName | string | `"domain-fault-management"` | Name of event_gateway SA |
| dfm.replicas | int | `1` | Number of replicas |
| dfm.resources | object | `{}` | Resources limit |
| dfm.restartPolicy | string | `"Always"` | Restart policy for pod |
| dfm.securityContext | object | `{}` | Security context for pod |
| dfm.service.labels | object | `{}` | Labels for event_gateway service |
| dfm.service.type | string | `"ClusterIP"` | Service type |
| eg.clients.jetstream.tls.caPool | string | `"/certs/jetstream/ca.crt"` | Root CA certificate in PEM format |
| eg.clients.jetstream.tls.certFile | string | `"/certs/jetstream/tls.crt"` | client public certificate in PEM format |
| eg.clients.jetstream.tls.keyFile | string | `"/certs/jetstream/tls.key"` | client private key in PEM format |
| eg.clients.jetstream.uri | string | `nil` | uri for jetstream server, defaults for deployed Nats server from Infrastructure chart |
| eg.clients.mongoDB.tls.caPool | string | `"/certs/mongoDB/ca.crt"` | Root CA certificate in PEM format |
| eg.clients.mongoDB.tls.certFile | string | `"/certs/mongoDB/tls.crt"` | client public certificate in PEM format |
| eg.clients.mongoDB.tls.keyFile | string | `"/certs/mongoDB/tls.key"` | client private key in PEM format |
| eg.clients.mongoDB.uri | string | `nil` | uri for MongoDB server, defaults for deployed MongoDB server from Infrastructure chart |
| eg.config.ExecutorQueueSize | string | `nil` |  |
| eg.config.JsMacAckPending | string | `nil` |  |
| eg.config.fileName | string | `"xr-eg-service.yaml"` | Service configuration file |
| eg.config.jsAckWait | string | `nil` |  |
| eg.config.logLevel | string | `"debug"` |  |
| eg.config.mountPath | string | `"/config"` | Configuration mount path |
| eg.config.volume | string | `"config"` | Service configuration volume name |
| eg.deploymentAnnotations | object | `{}` | Additional annotations for event_gateway deployment |
| eg.deploymentLabels | object | `{}` | Additional labels for event_gateway deployment |
| eg.extraVolumeMounts | list | `[{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true},{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true}]` | Optional extra volume mounts |
| eg.extraVolumeMounts[0] | object | `{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true}` | extra volume mount for nats tls secret |
| eg.extraVolumeMounts[1] | object | `{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true}` | extra volume mount for mongoDB tls secret |
| eg.extraVolumes[0] | object | `{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}}` | extra volume for nats tls secret |
| eg.extraVolumes[1] | object | `{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}}` | extra volume for mongoDB tls secret |
| eg.fullnameOverride | string | `"xr-eg"` | Full name to override |
| eg.image.imagePullSecrets | object | `{}` | Image pull secrets |
| eg.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| eg.image.registry | string | `"pt-nexus01-prd.infinera.com/"` | Image registry |
| eg.image.repository | string | `"xr-cm/eg"` | Image repository |
| eg.image.tag | string | `"v1.2.3-3"` | Image tag. |
| eg.ingress.annotations."nginx.org/websocket-services" | string | `"xr-eg"` |  |
| eg.ingress.className | string | `""` |  |
| eg.ingress.enabled | bool | `true` |  |
| eg.ingress.fileName | string | `"xr-eg-ingress.yaml"` |  |
| eg.ingress.paths[0].backend.service.name | string | `"xr-eg"` |  |
| eg.ingress.paths[0].backend.service.port | string | `"eg-port"` |  |
| eg.ingress.paths[0].path | string | `"/api/v1/subscriptions/events"` |  |
| eg.ingress.paths[0].pathType | string | `"Prefix"` |  |
| eg.ingress.paths[1].backend.service.name | string | `"xr-eg"` |  |
| eg.ingress.paths[1].backend.service.port | string | `"eg-port"` |  |
| eg.ingress.paths[1].path | string | `"/api/v1/subscriptions/alarms"` |  |
| eg.ingress.paths[1].pathType | string | `"Prefix"` |  |
| eg.ingress.paths[2].backend.service.name | string | `"xr-eg"` |  |
| eg.ingress.paths[2].backend.service.port | string | `"eg-port"` |  |
| eg.ingress.paths[2].path | string | `"/eg"` |  |
| eg.ingress.paths[2].pathType | string | `"Prefix"` |  |
| eg.ingress.paths[3].backend.service.name | string | `"xr-eg"` |  |
| eg.ingress.paths[3].backend.service.port | string | `"eg-port"` |  |
| eg.ingress.paths[3].path | string | `"/eg/swagger"` |  |
| eg.ingress.paths[3].pathType | string | `"Prefix"` |  |
| eg.ingress.tls | list | `[]` |  |
| eg.initContainersTpl | object | `{}` | Init containers definition. Resolved as template |
| eg.name | string | `"xr-eg"` |  |
| eg.podAnnotations | object | `{}` | Annotations for event_gateway pod |
| eg.podLabels | object | `{}` | Labels for event_gateway pod |
| eg.port | int | `8080` |  |
| eg.rbac.enabled | bool | `false` | Create RBAC config |
| eg.rbac.roleBindingDefinitionTpl | string | `nil` | template definition for Role/binding etc.. |
| eg.rbac.serviceAccountName | string | `"event-gateway"` | Name of event_gateway SA |
| eg.replicas | int | `1` | Number of replicas |
| eg.resources | object | `{}` | Resources limit |
| eg.restartPolicy | string | `"Always"` | Restart policy for pod |
| eg.securityContext | object | `{}` | Security context for pod |
| eg.service.labels | object | `{}` | Labels for event_gateway service |
| eg.service.type | string | `"ClusterIP"` | Service type |
| fullnameOverride | string | `""` |  |
| global.clients.openTelemetry.tls.caPool | string | `nil` | Root CA certificate in PEM format |
| global.clients.openTelemetry.tls.certFile | string | `nil` | client public certificate in PEM format |
| global.clients.openTelemetry.tls.keyFile | string | `nil` | client private key in PEM format |
| global.clients.openTelemetry.uri | string | `nil` | uri for OpenTelemetry collector |
| global.config.verifyToken | bool | `true` | Verify the JWT token |
| global.extraVolumeMounts | string | `nil` | extra volumes mounts for generic clients such as open telemetry |
| global.extraVolumes | string | `nil` | extra volumes for generic clients such as open telemetry |
| global.images.initContainers.busybox | string | `nil` |  |
| global.images.initContainers.natsbox | string | `nil` |  |
| global.images.initContainers.temporalAdminTools | string | `nil` |  |
| global.ingress.hosts[0] | string | `"ipm.infinera.com"` |  |
| global.ingress.tls[0].hosts[0] | string | `"ipm.infinera.com"` |  |
| global.ingress.tls[0].secretName | string | `"ipm-ssl-certificate"` |  |
| global.postgres.password | string | `""` |  |
| global.postgres.postgres_password | string | `""` |  |
| global.postgres.replication_password | string | `""` |  |
| global.ssl.enabled | bool | `true` |  |
| hms.clients.jetstream.tls.caPool | string | `"/certs/jetstream/ca.crt"` | Root CA certificate in PEM format |
| hms.clients.jetstream.tls.certFile | string | `"/certs/jetstream/tls.crt"` | client public certificate in PEM format |
| hms.clients.jetstream.tls.keyFile | string | `"/certs/jetstream/tls.key"` | client private key in PEM format |
| hms.clients.jetstream.uri | string | `nil` | uri for jetstream server, defaults for deployed Nats server from Infrastructure chart |
| hms.clients.mongoDB.tls.caPool | string | `"/certs/mongoDB/ca.crt"` | Root CA certificate in PEM format |
| hms.clients.mongoDB.tls.certFile | string | `"/certs/mongoDB/tls.crt"` | client public certificate in PEM format |
| hms.clients.mongoDB.tls.keyFile | string | `"/certs/mongoDB/tls.key"` | client private key in PEM format |
| hms.clients.mongoDB.uri | string | `nil` | uri for MongoDB server, defaults for deployed MongoDB server from Infrastructure chart |
| hms.clients.temporal.activity.startToCloseTimeout | timeDuration | `nil` | default temporal activity options builder start to close timeout value |
| hms.clients.temporal.child.executionTimeout | timeDuration | `nil` | default temporal child workflow options builder execution timeout value |
| hms.clients.temporal.local.startToCloseTimeout | timeDuration | `nil` | default temporal local activity options builder start to close timeout value |
| hms.clients.temporal.namespace | string | `"ipm"` | default namespace to be used and created if inexistent |
| hms.clients.temporal.retry.executionTimeout | timeDuration | `nil` | default temporal workflow options builder execution timeout value |
| hms.clients.temporal.retry.maximumAttemps | int | `nil` | default temporal retry policy builder maximum attempts value |
| hms.clients.temporal.retry.maximumInterval | timeDuration | `nil` | default temporal retry policy builder maximum interval value |
| hms.clients.temporal.tls.caPool | string | `"/certs/temporal/ca.crt"` | Root CA certificate in PEM format |
| hms.clients.temporal.tls.certFile | string | `"/certs/temporal/tls.crt"` | client public certificate in PEM format |
| hms.clients.temporal.tls.keyFile | string | `"/certs/temporal/tls.key"` | client private key in PEM format |
| hms.clients.temporal.uri | string | `nil` | uri for Temporal server, defaults for deployed Temporal server from Domain Manager chart |
| hms.clients.temporal.workflow.executionTimeout | timeDuration | `nil` |  |
| hms.config.ExecutorQueueSize | string | `nil` |  |
| hms.config.JsMacAckPending | string | `nil` |  |
| hms.config.fileName | string | `"xr-hms-service.yaml"` | Service configuration file |
| hms.config.jsAckWait | string | `nil` |  |
| hms.config.logLevel | string | `"debug"` |  |
| hms.config.mountPath | string | `"/config"` | Configuration mount path |
| hms.config.volume | string | `"config"` | Service configuration volume name |
| hms.deploymentAnnotations | object | `{}` | Additional annotations for event_gateway deployment |
| hms.deploymentLabels | object | `{}` | Additional labels for event_gateway deployment |
| hms.extraVolumeMounts | list | `[{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true},{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true},{"mountPath":"/certs/temporal","name":"temporal-tls","readOnly":true}]` | Optional extra volume mounts |
| hms.extraVolumeMounts[0] | object | `{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true}` | extra volume mount for nats tls secret |
| hms.extraVolumeMounts[1] | object | `{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true}` | extra volume mount for mongoDB tls secret |
| hms.extraVolumes | list | `[{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}},{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}},{"name":"temporal-tls","secret":{"secretName":"temporal-client-tls"}}]` | Optional extra volume mounts |
| hms.extraVolumes[0] | object | `{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}}` | extra volume for nats tls secret |
| hms.extraVolumes[1] | object | `{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}}` | extra volume for mongoDB tls secret |
| hms.extraVolumes[2] | object | `{"name":"temporal-tls","secret":{"secretName":"temporal-client-tls"}}` | extra volume for temporal tls secret         |
| hms.fullnameOverride | string | `"xr-hms"` | Full name to override |
| hms.image.imagePullSecrets | object | `{}` | Image pull secrets |
| hms.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| hms.image.registry | string | `"pt-nexus01-prd.infinera.com/"` | Image registry |
| hms.image.repository | string | `"xr-cm/hms"` | Image repository |
| hms.image.tag | string | `"v1.2.3-3"` | Image tag. |
| hms.ingress.className | string | `""` |  |
| hms.ingress.enabled | bool | `true` |  |
| hms.ingress.fileName | string | `"xr-hms-ingress.yaml"` |  |
| hms.ingress.paths[0].backend.service.name | string | `"xr-hms"` |  |
| hms.ingress.paths[0].backend.service.port | string | `"hms-port"` |  |
| hms.ingress.paths[0].path | string | `"/api/v1/hosts"` |  |
| hms.ingress.paths[0].pathType | string | `"Prefix"` |  |
| hms.ingress.paths[1].backend.service.name | string | `"xr-hms"` |  |
| hms.ingress.paths[1].backend.service.port | string | `"hms-port"` |  |
| hms.ingress.paths[1].path | string | `"/hms"` |  |
| hms.ingress.paths[1].pathType | string | `"Prefix"` |  |
| hms.ingress.paths[2].backend.service.name | string | `"xr-hms"` |  |
| hms.ingress.paths[2].backend.service.port | string | `"hms-port"` |  |
| hms.ingress.paths[2].path | string | `"/hms/swagger"` |  |
| hms.ingress.paths[2].pathType | string | `"Prefix"` |  |
| hms.ingress.tls | list | `[]` |  |
| hms.initContainersTpl | object | `{}` | Init containers definition. Resolved as template |
| hms.name | string | `"xr-hms"` |  |
| hms.podAnnotations | object | `{}` | Annotations for event_gateway pod |
| hms.podLabels | object | `{}` | Labels for event_gateway pod |
| hms.port | int | `8080` |  |
| hms.rbac.enabled | bool | `false` | Create RBAC config |
| hms.rbac.roleBindingDefinitionTpl | string | `nil` | template definition for Role/binding etc.. |
| hms.rbac.serviceAccountName | string | `"host-management-service"` | Name of event_gateway SA |
| hms.replicas | int | `1` | Number of replicas |
| hms.resources | object | `{}` | Resources limit |
| hms.restartPolicy | string | `"Always"` | Restart policy for pod |
| hms.securityContext | object | `{}` | Security context for pod |
| hms.service.labels | object | `{}` | Labels for event_gateway service |
| hms.service.type | string | `"ClusterIP"` | Service type |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"registry.docker.io"` |  |
| image.repository | string | `"nginx"` |  |
| image.tag | string | `"1.23.1"` |  |
| imagePullSecrets | list | `[]` |  |
| mm.clients.jetstream.tls.caPool | string | `"/certs/jetstream/ca.crt"` | Root CA certificate in PEM format |
| mm.clients.jetstream.tls.certFile | string | `"/certs/jetstream/tls.crt"` | client public certificate in PEM format |
| mm.clients.jetstream.tls.keyFile | string | `"/certs/jetstream/tls.key"` | client private key in PEM format |
| mm.clients.jetstream.uri | string | `nil` | uri for jetstream server, defaults for deployed Nats server from Infrastructure chart |
| mm.clients.mongoDB.tls.caPool | string | `"/certs/mongoDB/ca.crt"` | Root CA certificate in PEM format |
| mm.clients.mongoDB.tls.certFile | string | `"/certs/mongoDB/tls.crt"` | client public certificate in PEM format |
| mm.clients.mongoDB.tls.keyFile | string | `"/certs/mongoDB/tls.key"` | client private key in PEM format |
| mm.clients.mongoDB.uri | string | `nil` | uri for MongoDB server, defaults for deployed MongoDB server from Infrastructure chart |
| mm.clients.temporal.activity.startToCloseTimeout | timeDuration | `nil` | default temporal activity options builder start to close timeout value |
| mm.clients.temporal.child.executionTimeout | timeDuration | `nil` | default temporal child workflow options builder execution timeout value |
| mm.clients.temporal.local.startToCloseTimeout | timeDuration | `nil` | default temporal local activity options builder start to close timeout value |
| mm.clients.temporal.namespace | string | `"ipm"` | default namespace to be used and created if inexistent |
| mm.clients.temporal.retry.executionTimeout | timeDuration | `nil` | default temporal workflow options builder execution timeout value |
| mm.clients.temporal.retry.maximumAttemps | int | `nil` | default temporal retry policy builder maximum attempts value |
| mm.clients.temporal.retry.maximumInterval | timeDuration | `nil` | default temporal retry policy builder maximum interval value |
| mm.clients.temporal.tls.caPool | string | `"/certs/temporal/ca.crt"` | Root CA certificate in PEM format |
| mm.clients.temporal.tls.certFile | string | `"/certs/temporal/tls.crt"` | client public certificate in PEM format |
| mm.clients.temporal.tls.keyFile | string | `"/certs/temporal/tls.key"` | client private key in PEM format |
| mm.clients.temporal.uri | string | `nil` | uri for Temporal server, defaults for deployed Temporal server from Domain Manager chart |
| mm.clients.temporal.workflow.executionTimeout | timeDuration | `nil` |  |
| mm.config | object | `{"ExecutorQueueSize":null,"JsMacAckPending":null,"fileName":"xr-mm-service.yaml","jsAckWait":null,"logLevel":"debug","mountPath":"/config","volume":"config"}` | Service configuration |
| mm.config.fileName | string | `"xr-mm-service.yaml"` | Service configuration file |
| mm.config.mountPath | string | `"/config"` | Configuration mount path |
| mm.config.volume | string | `"config"` | Service configuration volume name |
| mm.deploymentAnnotations | object | `{}` | Additional annotations for event_gateway deployment |
| mm.deploymentLabels | object | `{}` | Additional labels for event_gateway deployment |
| mm.extraVolumeMounts | list | `[{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true},{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true},{"mountPath":"/certs/temporal","name":"temporal-tls","readOnly":true}]` | Optional extra volume mounts |
| mm.extraVolumeMounts[0] | object | `{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true}` | extra volume mount for nats tls secret |
| mm.extraVolumeMounts[1] | object | `{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true}` | extra volume mount for mongoDB tls secret |
| mm.extraVolumes | list | `[{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}},{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}},{"name":"temporal-tls","secret":{"secretName":"temporal-client-tls"}}]` | Optional extra volume mounts |
| mm.extraVolumes[0] | object | `{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}}` | extra volume for nats tls secret |
| mm.extraVolumes[1] | object | `{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}}` | extra volume for mongoDB tls secret |
| mm.extraVolumes[2] | object | `{"name":"temporal-tls","secret":{"secretName":"temporal-client-tls"}}` | extra volume for temporal tls secret             |
| mm.fullnameOverride | string | `"xr-mm"` | Full name to override |
| mm.image.imagePullSecrets | object | `{}` | Image pull secrets |
| mm.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| mm.image.registry | string | `"pt-nexus01-prd.infinera.com/"` | Image registry |
| mm.image.repository | string | `"xr-cm/mm"` | Image repository |
| mm.image.tag | string | `"v1.2.3-3"` | Image tag. |
| mm.ingress.className | string | `""` |  |
| mm.ingress.enabled | bool | `true` |  |
| mm.ingress.fileName | string | `"xr-mm-ingress.yaml"` |  |
| mm.ingress.paths[0].backend.service.name | string | `"xr-mm"` |  |
| mm.ingress.paths[0].backend.service.port | string | `"mm-port"` |  |
| mm.ingress.paths[0].path | string | `"/api/v1/modules"` |  |
| mm.ingress.paths[0].pathType | string | `"Prefix"` |  |
| mm.ingress.paths[1].backend.service.name | string | `"xr-mm"` |  |
| mm.ingress.paths[1].backend.service.port | string | `"mm-port"` |  |
| mm.ingress.paths[1].path | string | `"/mm"` |  |
| mm.ingress.paths[1].pathType | string | `"Prefix"` |  |
| mm.ingress.paths[2].backend.service.name | string | `"xr-mm"` |  |
| mm.ingress.paths[2].backend.service.port | string | `"mm-port"` |  |
| mm.ingress.paths[2].path | string | `"/mm/swagger"` |  |
| mm.ingress.paths[2].pathType | string | `"Prefix"` |  |
| mm.ingress.tls | list | `[]` |  |
| mm.initContainersTpl | object | `{}` | Init containers definition. Resolved as template |
| mm.name | string | `"xr-mm"` |  |
| mm.podAnnotations | object | `{}` | Annotations for event_gateway pod |
| mm.podLabels | object | `{}` | Labels for event_gateway pod |
| mm.port | int | `8080` |  |
| mm.rbac.enabled | bool | `false` | Create RBAC config |
| mm.rbac.roleBindingDefinitionTpl | string | `nil` | template definition for Role/binding etc.. |
| mm.rbac.serviceAccountName | string | `"module-manager"` | Name of event_gateway SA |
| mm.replicas | int | `1` | Number of replicas |
| mm.resources | object | `{}` | Resources limit |
| mm.restartPolicy | string | `"Always"` | Restart policy for pod |
| mm.securityContext | object | `{}` | Security context for pod |
| mm.service.labels | object | `{}` | Labels for event_gateway service |
| mm.service.type | string | `"ClusterIP"` | Service type |
| nameOverride | string | `""` |  |
| namespace_am | string | `"ipm-am"` |  |
| namespace_inf | string | `"ipm-inf"` |  |
| namespace_keycloak | string | `"ipm-keycloak"` |  |
| ncs.clients.jetstream.tls.caPool | string | `"/certs/jetstream/ca.crt"` | Root CA certificate in PEM format |
| ncs.clients.jetstream.tls.certFile | string | `"/certs/jetstream/tls.crt"` | client public certificate in PEM format |
| ncs.clients.jetstream.tls.keyFile | string | `"/certs/jetstream/tls.key"` | client private key in PEM format |
| ncs.clients.jetstream.uri | string | `nil` | uri for jetstream server, defaults for deployed Nats server from Infrastructure chart |
| ncs.clients.mongoDB.tls.caPool | string | `"/certs/mongoDB/ca.crt"` | Root CA certificate in PEM format |
| ncs.clients.mongoDB.tls.certFile | string | `"/certs/mongoDB/tls.crt"` | client public certificate in PEM format |
| ncs.clients.mongoDB.tls.keyFile | string | `"/certs/mongoDB/tls.key"` | client private key in PEM format |
| ncs.clients.mongoDB.uri | string | `nil` | uri for MongoDB server, defaults for deployed MongoDB server from Infrastructure chart |
| ncs.clients.temporal.activity.startToCloseTimeout | timeDuration | `nil` | default temporal activity options builder start to close timeout value |
| ncs.clients.temporal.child.executionTimeout | timeDuration | `nil` | default temporal child workflow options builder execution timeout value |
| ncs.clients.temporal.local.startToCloseTimeout | timeDuration | `nil` | default temporal local activity options builder start to close timeout value |
| ncs.clients.temporal.namespace | string | `"ipm"` | default namespace to be used and created if inexistent |
| ncs.clients.temporal.retry.executionTimeout | timeDuration | `nil` | default temporal workflow options builder execution timeout value |
| ncs.clients.temporal.retry.maximumAttemps | int | `nil` | default temporal retry policy builder maximum attempts value |
| ncs.clients.temporal.retry.maximumInterval | timeDuration | `nil` | default temporal retry policy builder maximum interval value |
| ncs.clients.temporal.tls.caPool | string | `"/certs/temporal/ca.crt"` | Root CA certificate in PEM format |
| ncs.clients.temporal.tls.certFile | string | `"/certs/temporal/tls.crt"` | client public certificate in PEM format |
| ncs.clients.temporal.tls.keyFile | string | `"/certs/temporal/tls.key"` | client private key in PEM format |
| ncs.clients.temporal.uri | string | `nil` | uri for Temporal server, defaults for deployed Temporal server from Domain Manager chart |
| ncs.clients.temporal.workflow.executionTimeout | timeDuration | `nil` |  |
| ncs.config | object | `{"ExecutorQueueSize":null,"JsMacAckPending":null,"fileName":"xr-ncs-service.yaml","jsAckWait":null,"logLevel":"debug","mountPath":"/config","volume":"config"}` | Service configuration |
| ncs.config.fileName | string | `"xr-ncs-service.yaml"` | Service configuration file |
| ncs.config.mountPath | string | `"/config"` | Configuration mount path |
| ncs.config.volume | string | `"config"` | Service configuration volume name |
| ncs.deploymentAnnotations | object | `{}` | Additional annotations for event_gateway deployment |
| ncs.deploymentLabels | object | `{}` | Additional labels for event_gateway deployment |
| ncs.extraVolumeMounts | list | `[{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true},{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true},{"mountPath":"/certs/temporal","name":"temporal-tls","readOnly":true}]` | Optional extra volume mounts |
| ncs.extraVolumeMounts[0] | object | `{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true}` | extra volume mount for nats tls secret |
| ncs.extraVolumeMounts[1] | object | `{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true}` | extra volume mount for mongoDB tls secret |
| ncs.extraVolumes | list | `[{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}},{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}},{"name":"temporal-tls","secret":{"secretName":"temporal-client-tls"}}]` | Optional extra volume mounts |
| ncs.extraVolumes[0] | object | `{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}}` | extra volume for nats tls secret |
| ncs.extraVolumes[1] | object | `{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}}` | extra volume for mongoDB tls secret |
| ncs.extraVolumes[2] | object | `{"name":"temporal-tls","secret":{"secretName":"temporal-client-tls"}}` | extra volume for temporal tls secret             |
| ncs.fullnameOverride | string | `"xr-ncs"` | Full name to override |
| ncs.image.imagePullSecrets | object | `{}` | Image pull secrets |
| ncs.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| ncs.image.registry | string | `"pt-nexus01-prd.infinera.com/"` | Image registry |
| ncs.image.repository | string | `"xr-cm/ncs"` | Image repository |
| ncs.image.tag | string | `"v1.2.3-3"` | Image tag. |
| ncs.ingress.className | string | `""` |  |
| ncs.ingress.enabled | bool | `true` |  |
| ncs.ingress.fileName | string | `"xr-ncs-ingress.yaml"` |  |
| ncs.ingress.paths[0].backend.service.name | string | `"xr-ncs"` |  |
| ncs.ingress.paths[0].backend.service.port | string | `"ncs-port"` |  |
| ncs.ingress.paths[0].path | string | `"/api/v1/network-connections"` |  |
| ncs.ingress.paths[0].pathType | string | `"Prefix"` |  |
| ncs.ingress.paths[1].backend.service.name | string | `"xr-ncs"` |  |
| ncs.ingress.paths[1].backend.service.port | string | `"ncs-port"` |  |
| ncs.ingress.paths[1].path | string | `"/api/v1/acs"` |  |
| ncs.ingress.paths[1].pathType | string | `"Prefix"` |  |
| ncs.ingress.paths[2].backend.service.name | string | `"xr-ncs"` |  |
| ncs.ingress.paths[2].backend.service.port | string | `"ncs-port"` |  |
| ncs.ingress.paths[2].path | string | `"/api/v1/lcs"` |  |
| ncs.ingress.paths[2].pathType | string | `"Prefix"` |  |
| ncs.ingress.paths[3].backend.service.name | string | `"xr-ncs"` |  |
| ncs.ingress.paths[3].backend.service.port | string | `"ncs-port"` |  |
| ncs.ingress.paths[3].path | string | `"/ncs"` |  |
| ncs.ingress.paths[3].pathType | string | `"Prefix"` |  |
| ncs.ingress.paths[4].backend.service.name | string | `"xr-ncs"` |  |
| ncs.ingress.paths[4].backend.service.port | string | `"ncs-port"` |  |
| ncs.ingress.paths[4].path | string | `"/ncs/swagger"` |  |
| ncs.ingress.paths[4].pathType | string | `"Prefix"` |  |
| ncs.ingress.tls | list | `[]` |  |
| ncs.initContainersTpl | object | `{}` | Init containers definition. Resolved as template |
| ncs.name | string | `"xr-ncs"` |  |
| ncs.podAnnotations | object | `{}` | Annotations for event_gateway pod |
| ncs.podLabels | object | `{}` | Labels for event_gateway pod |
| ncs.port | int | `8080` |  |
| ncs.rbac.enabled | bool | `false` | Create RBAC config |
| ncs.rbac.roleBindingDefinitionTpl | string | `nil` | template definition for Role/binding etc.. |
| ncs.rbac.serviceAccountName | string | `"network-connection-service"` | Name of event_gateway SA |
| ncs.replicas | int | `1` | Number of replicas |
| ncs.resources | object | `{}` | Resources limit |
| ncs.restartPolicy | string | `"Always"` | Restart policy for pod |
| ncs.securityContext | object | `{}` | Security context for pod |
| ncs.service.labels | object | `{}` | Labels for event_gateway service |
| ncs.service.type | string | `"ClusterIP"` | Service type |
| ndus.clients.jetstream.tls.caPool | string | `"/certs/jetstream/ca.crt"` | Root CA certificate in PEM format |
| ndus.clients.jetstream.tls.certFile | string | `"/certs/jetstream/tls.crt"` | client public certificate in PEM format |
| ndus.clients.jetstream.tls.keyFile | string | `"/certs/jetstream/tls.key"` | client private key in PEM format |
| ndus.clients.jetstream.uri | string | `nil` | uri for jetstream server, defaults for deployed Nats server from Infrastructure chart |
| ndus.clients.mongoDB.tls.caPool | string | `"/certs/mongoDB/ca.crt"` | Root CA certificate in PEM format |
| ndus.clients.mongoDB.tls.certFile | string | `"/certs/mongoDB/tls.crt"` | client public certificate in PEM format |
| ndus.clients.mongoDB.tls.keyFile | string | `"/certs/mongoDB/tls.key"` | client private key in PEM format |
| ndus.clients.mongoDB.uri | string | `nil` | uri for MongoDB server, defaults for deployed MongoDB server from Infrastructure chart |
| ndus.clients.temporal.activity.startToCloseTimeout | timeDuration | `nil` | default temporal activity options builder start to close timeout value |
| ndus.clients.temporal.child.executionTimeout | timeDuration | `nil` | default temporal child workflow options builder execution timeout value |
| ndus.clients.temporal.local.startToCloseTimeout | timeDuration | `nil` | default temporal local activity options builder start to close timeout value |
| ndus.clients.temporal.namespace | string | `"ipm"` | default namespace to be used and created if inexistent |
| ndus.clients.temporal.retry.executionTimeout | timeDuration | `nil` | default temporal workflow options builder execution timeout value |
| ndus.clients.temporal.retry.maximumAttemps | int | `nil` | default temporal retry policy builder maximum attempts value |
| ndus.clients.temporal.retry.maximumInterval | timeDuration | `nil` | default temporal retry policy builder maximum interval value |
| ndus.clients.temporal.tls.caPool | string | `"/certs/temporal/ca.crt"` | Root CA certificate in PEM format |
| ndus.clients.temporal.tls.certFile | string | `"/certs/temporal/tls.crt"` | client public certificate in PEM format |
| ndus.clients.temporal.tls.keyFile | string | `"/certs/temporal/tls.key"` | client private key in PEM format |
| ndus.clients.temporal.uri | string | `nil` | uri for Temporal server, defaults for deployed Temporal server from Domain Manager chart |
| ndus.clients.temporal.workflow.executionTimeout | timeDuration | `nil` |  |
| ndus.config.ExecutorQueueSize | string | `nil` |  |
| ndus.config.JsMacAckPending | string | `nil` |  |
| ndus.config.fileName | string | `"xr-ndus-service.yaml"` |  |
| ndus.config.jsAckWait | string | `nil` |  |
| ndus.config.logLevel | string | `"debug"` |  |
| ndus.config.mountPath | string | `"/config"` |  |
| ndus.config.volume | string | `"config"` |  |
| ndus.deploymentAnnotations | object | `{}` |  |
| ndus.deploymentLabels | object | `{}` |  |
| ndus.extraVolumeMounts | list | `[{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true},{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true},{"mountPath":"/certs/temporal","name":"temporal-tls","readOnly":true}]` | Optional extra volume mounts |
| ndus.extraVolumeMounts[0] | object | `{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true}` | extra volume mount for nats tls secret |
| ndus.extraVolumeMounts[1] | object | `{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true}` | extra volume mount for mongoDB tls secret |
| ndus.extraVolumes | list | `[{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}},{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}},{"name":"temporal-tls","secret":{"secretName":"temporal-client-tls"}}]` | Optional extra volume mounts |
| ndus.extraVolumes[0] | object | `{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}}` | extra volume for nats tls secret |
| ndus.extraVolumes[1] | object | `{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}}` | extra volume for mongoDB tls secret |
| ndus.extraVolumes[2] | object | `{"name":"temporal-tls","secret":{"secretName":"temporal-client-tls"}}` | extra volume for temporal tls secret             |
| ndus.fullnameOverride | string | `"xr-ndus"` |  |
| ndus.image.imagePullSecrets | object | `{}` |  |
| ndus.image.pullPolicy | string | `"IfNotPresent"` |  |
| ndus.image.registry | string | `"pt-nexus01-prd.infinera.com/"` |  |
| ndus.image.repository | string | `"xr-cm/ndus"` |  |
| ndus.image.tag | string | `"v1.2.3-3"` |  |
| ndus.ingress.className | string | `""` |  |
| ndus.ingress.enabled | bool | `true` |  |
| ndus.ingress.filename | string | `"xr-ndus-ingress.yaml"` |  |
| ndus.ingress.paths[0].backend.service.name | string | `"xr-ndus"` |  |
| ndus.ingress.paths[0].backend.service.port | string | `"ndus-port"` |  |
| ndus.ingress.paths[0].path | string | `"/api/v1/ndus"` |  |
| ndus.ingress.paths[0].pathType | string | `"Prefix"` |  |
| ndus.ingress.paths[1].backend.service.name | string | `"xr-ndus"` |  |
| ndus.ingress.paths[1].backend.service.port | string | `"ndus-port"` |  |
| ndus.ingress.paths[1].path | string | `"/ndus"` |  |
| ndus.ingress.paths[1].pathType | string | `"Prefix"` |  |
| ndus.ingress.paths[2].backend.service.name | string | `"xr-ndus"` |  |
| ndus.ingress.paths[2].backend.service.port | string | `"ndus-port"` |  |
| ndus.ingress.paths[2].path | string | `"/ndus/swagger"` |  |
| ndus.ingress.paths[2].pathType | string | `"Prefix"` |  |
| ndus.ingress.tls | list | `[]` |  |
| ndus.initContainersTpl | object | `{}` |  |
| ndus.name | string | `"xr-ndus"` |  |
| ndus.podAnnotations | object | `{}` |  |
| ndus.podLabels | object | `{}` |  |
| ndus.port | int | `8080` |  |
| ndus.rbac.enabled | bool | `false` |  |
| ndus.rbac.roleBindingDefinitionTpl | string | `nil` |  |
| ndus.rbac.serviceAccountName | string | `"ndu-service"` |  |
| ndus.replicas | int | `1` |  |
| ndus.resources | object | `{}` |  |
| ndus.restartPolicy | string | `"Always"` |  |
| ndus.securityContext | object | `{}` |  |
| ndus.service.labels | object | `{}` |  |
| ndus.service.type | string | `"ClusterIP"` |  |
| nodeSelector | object | `{}` |  |
| ns.clients.jetstream.tls.caPool | string | `"/certs/jetstream/ca.crt"` | Root CA certificate in PEM format |
| ns.clients.jetstream.tls.certFile | string | `"/certs/jetstream/tls.crt"` | client public certificate in PEM format |
| ns.clients.jetstream.tls.keyFile | string | `"/certs/jetstream/tls.key"` | client private key in PEM format |
| ns.clients.jetstream.uri | string | `nil` | uri for jetstream server, defaults for deployed Nats server from Infrastructure chart |
| ns.clients.mongoDB.tls.caPool | string | `"/certs/mongoDB/ca.crt"` | Root CA certificate in PEM format |
| ns.clients.mongoDB.tls.certFile | string | `"/certs/mongoDB/tls.crt"` | client public certificate in PEM format |
| ns.clients.mongoDB.tls.keyFile | string | `"/certs/mongoDB/tls.key"` | client private key in PEM format |
| ns.clients.mongoDB.uri | string | `nil` | uri for MongoDB server, defaults for deployed MongoDB server from Infrastructure chart |
| ns.clients.temporal.activity.startToCloseTimeout | timeDuration | `nil` | default temporal activity options builder start to close timeout value |
| ns.clients.temporal.child.executionTimeout | timeDuration | `nil` | default temporal child workflow options builder execution timeout value |
| ns.clients.temporal.local.startToCloseTimeout | timeDuration | `nil` | default temporal local activity options builder start to close timeout value |
| ns.clients.temporal.namespace | string | `"ipm"` | default namespace to be used and created if inexistent |
| ns.clients.temporal.retry.executionTimeout | timeDuration | `nil` | default temporal workflow options builder execution timeout value |
| ns.clients.temporal.retry.maximumAttemps | int | `nil` | default temporal retry policy builder maximum attempts value |
| ns.clients.temporal.retry.maximumInterval | timeDuration | `nil` | default temporal retry policy builder maximum interval value |
| ns.clients.temporal.tls.caPool | string | `"/certs/temporal/ca.crt"` | Root CA certificate in PEM format |
| ns.clients.temporal.tls.certFile | string | `"/certs/temporal/tls.crt"` | client public certificate in PEM format |
| ns.clients.temporal.tls.keyFile | string | `"/certs/temporal/tls.key"` | client private key in PEM format |
| ns.clients.temporal.uri | string | `nil` | uri for Temporal server, defaults for deployed Temporal server from Domain Manager chart |
| ns.clients.temporal.workflow.executionTimeout | timeDuration | `nil` |  |
| ns.config | object | `{"ExecutorQueueSize":null,"JsMacAckPending":null,"fileName":"xr-ns-service.yaml","jsAckWait":null,"logLevel":"debug","mountPath":"/config","volume":"config"}` | Service configuration |
| ns.config.fileName | string | `"xr-ns-service.yaml"` | Service configuration file |
| ns.config.mountPath | string | `"/config"` | Configuration mount path |
| ns.config.volume | string | `"config"` | Service configuration volume name |
| ns.deploymentAnnotations | object | `{}` | Additional annotations for event_gateway deployment |
| ns.deploymentLabels | object | `{}` | Additional labels for event_gateway deployment |
| ns.extraVolumeMounts | list | `[{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true},{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true},{"mountPath":"/certs/temporal","name":"temporal-tls","readOnly":true}]` | Optional extra volume mounts |
| ns.extraVolumeMounts[0] | object | `{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true}` | extra volume mount for nats tls secret |
| ns.extraVolumeMounts[1] | object | `{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true}` | extra volume mount for mongoDB tls secret |
| ns.extraVolumes | list | `[{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}},{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}},{"name":"temporal-tls","secret":{"secretName":"temporal-client-tls"}}]` | Optional extra volume mounts |
| ns.extraVolumes[0] | object | `{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}}` | extra volume for nats tls secret |
| ns.extraVolumes[1] | object | `{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}}` | extra volume for mongoDB tls secret |
| ns.extraVolumes[2] | object | `{"name":"temporal-tls","secret":{"secretName":"temporal-client-tls"}}` | extra volume for temporal tls secret             |
| ns.fullnameOverride | string | `"xr-ns"` | Full name to override |
| ns.image.imagePullSecrets | object | `{}` | Image pull secrets |
| ns.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy     |
| ns.image.registry | string | `"pt-nexus01-prd.infinera.com/"` | Image registry |
| ns.image.repository | string | `"xr-cm/ns"` | Image repository |
| ns.image.tag | string | `"v1.2.3-3"` | Image tag. |
| ns.ingress.className | string | `""` |  |
| ns.ingress.enabled | bool | `true` |  |
| ns.ingress.fileName | string | `"xr-ns-ingress.yaml"` |  |
| ns.ingress.paths[0].backend.service.name | string | `"xr-ns"` |  |
| ns.ingress.paths[0].backend.service.port | string | `"ns-port"` |  |
| ns.ingress.paths[0].path | string | `"/api/v1/xr-networks"` |  |
| ns.ingress.paths[0].pathType | string | `"Prefix"` |  |
| ns.ingress.paths[1].backend.service.name | string | `"xr-ns"` |  |
| ns.ingress.paths[1].backend.service.port | string | `"ns-port"` |  |
| ns.ingress.paths[1].path | string | `"/ns"` |  |
| ns.ingress.paths[1].pathType | string | `"Prefix"` |  |
| ns.ingress.paths[2].backend.service.name | string | `"xr-ns"` |  |
| ns.ingress.paths[2].backend.service.port | string | `"ns-port"` |  |
| ns.ingress.paths[2].path | string | `"/ns/swagger"` |  |
| ns.ingress.paths[2].pathType | string | `"Prefix"` |  |
| ns.ingress.tls | list | `[]` |  |
| ns.initContainersTpl | object | `{}` | Init containers definition. Resolved as template |
| ns.name | string | `"xr-ns"` |  |
| ns.podAnnotations | object | `{}` | Annotations for event_gateway pod |
| ns.podLabels | object | `{}` | Labels for event_gateway pod |
| ns.port | int | `8080` |  |
| ns.rbac.enabled | bool | `false` | Create RBAC config |
| ns.rbac.roleBindingDefinitionTpl | string | `nil` | template definition for Role/binding etc.. |
| ns.rbac.serviceAccountName | string | `"network-service"` | Name of event_gateway SA |
| ns.replicas | int | `1` | Number of replicas |
| ns.resources | object | `{}` | Resources limit |
| ns.restartPolicy | string | `"Always"` | Restart policy for pod |
| ns.securityContext | object | `{}` | Security context for pod |
| ns.service.labels | object | `{}` | Labels for event_gateway service |
| ns.service.type | string | `"ClusterIP"` | Service type |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| service_grpc_gw | string | `"am-plgd-hub-grpc-gateway"` |  |
| service_http_gw | string | `"am-plgd-hub-http-gateway"` |  |
| service_nats | string | `"inf-nats"` |  |
| service_nats_am | string | `"am-nats"` |  |
| service_oauth | string | `"am-plgd-hub-mock-oauth-server"` |  |
| swm.clients.jetstream.tls.caPool | string | `"/certs/jetstream/ca.crt"` | Root CA certificate in PEM format |
| swm.clients.jetstream.tls.certFile | string | `"/certs/jetstream/tls.crt"` | client public certificate in PEM format |
| swm.clients.jetstream.tls.keyFile | string | `"/certs/jetstream/tls.key"` | client private key in PEM format |
| swm.clients.jetstream.uri | string | `nil` | uri for jetstream server, defaults for deployed Nats server from Infrastructure chart |
| swm.clients.mongoDB.tls.caPool | string | `"/certs/mongoDB/ca.crt"` | Root CA certificate in PEM format |
| swm.clients.mongoDB.tls.certFile | string | `"/certs/mongoDB/tls.crt"` | client public certificate in PEM format |
| swm.clients.mongoDB.tls.keyFile | string | `"/certs/mongoDB/tls.key"` | client private key in PEM format |
| swm.clients.mongoDB.uri | string | `nil` | uri for MongoDB server, defaults for deployed MongoDB server from Infrastructure chart |
| swm.clients.temporal.activity.startToCloseTimeout | timeDuration | `nil` | default temporal activity options builder start to close timeout value |
| swm.clients.temporal.child.executionTimeout | timeDuration | `nil` | default temporal child workflow options builder execution timeout value |
| swm.clients.temporal.local.startToCloseTimeout | timeDuration | `nil` | default temporal local activity options builder start to close timeout value |
| swm.clients.temporal.namespace | string | `"ipm"` | default namespace to be used and created if inexistent |
| swm.clients.temporal.retry.executionTimeout | timeDuration | `nil` | default temporal workflow options builder execution timeout value |
| swm.clients.temporal.retry.maximumAttemps | int | `nil` | default temporal retry policy builder maximum attempts value |
| swm.clients.temporal.retry.maximumInterval | timeDuration | `nil` | default temporal retry policy builder maximum interval value |
| swm.clients.temporal.tls.caPool | string | `"/certs/temporal/ca.crt"` | Root CA certificate in PEM format |
| swm.clients.temporal.tls.certFile | string | `"/certs/temporal/tls.crt"` | client public certificate in PEM format |
| swm.clients.temporal.tls.keyFile | string | `"/certs/temporal/tls.key"` | client private key in PEM format |
| swm.clients.temporal.uri | string | `nil` | uri for Temporal server, defaults for deployed Temporal server from Domain Manager chart |
| swm.clients.temporal.workflow.executionTimeout | timeDuration | `nil` |  |
| swm.config.ExecutorQueueSize | string | `nil` |  |
| swm.config.JsMacAckPending | string | `nil` |  |
| swm.config.fileName | int | `"xr-swm-service.yaml"` | Not required to be configured by user. No of maximum parallel upgrade task to be executed by SWM . |
| swm.config.jsAckWait | string | `nil` |  |
| swm.config.logLevel | string | `"debug"` |  |
| swm.config.maxConcurrentUpgrades | int | `20` |  |
| swm.config.mountPath | string | `"/config"` |  |
| swm.config.volume | string | `"config"` |  |
| swm.deploymentAnnotations | object | `{}` |  |
| swm.deploymentLabels | object | `{}` |  |
| swm.extraVolumeMounts | list | `[{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true},{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true},{"mountPath":"/certs/temporal","name":"temporal-tls","readOnly":true}]` | Optional extra volume mounts |
| swm.extraVolumeMounts[0] | object | `{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true}` | extra volume mount for nats tls secret |
| swm.extraVolumeMounts[1] | object | `{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true}` | extra volume mount for mongoDB tls secret |
| swm.extraVolumes | list | `[{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}},{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}},{"name":"temporal-tls","secret":{"secretName":"temporal-client-tls"}}]` | Optional extra volume mounts |
| swm.extraVolumes[0] | object | `{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}}` | extra volume for nats tls secret |
| swm.extraVolumes[1] | object | `{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}}` | extra volume for mongoDB tls secret |
| swm.extraVolumes[2] | object | `{"name":"temporal-tls","secret":{"secretName":"temporal-client-tls"}}` | extra volume for temporal tls secret             |
| swm.fullnameOverride | string | `"xr-swm"` |  |
| swm.image.imagePullSecrets | object | `{}` |  |
| swm.image.pullPolicy | string | `"IfNotPresent"` |  |
| swm.image.registry | string | `"pt-nexus01-prd.infinera.com/"` |  |
| swm.image.repository | string | `"xr-cm/swm"` |  |
| swm.image.tag | string | `"v1.2.3-2"` |  |
| swm.ingress.className | string | `""` |  |
| swm.ingress.enabled | bool | `true` |  |
| swm.ingress.fileName | string | `"xr-swm-ingress.yaml"` |  |
| swm.ingress.paths[0].backend.service.name | string | `"xr-swm"` |  |
| swm.ingress.paths[0].backend.service.port | string | `"swm-port"` |  |
| swm.ingress.paths[0].path | string | `"/api/v1/sw"` |  |
| swm.ingress.paths[0].pathType | string | `"Prefix"` |  |
| swm.ingress.paths[1].backend.service.name | string | `"xr-swm"` |  |
| swm.ingress.paths[1].backend.service.port | string | `"swm-port"` |  |
| swm.ingress.paths[1].path | string | `"/swm"` |  |
| swm.ingress.paths[1].pathType | string | `"Prefix"` |  |
| swm.ingress.paths[2].backend.service.name | string | `"xr-swm"` |  |
| swm.ingress.paths[2].backend.service.port | string | `"swm-port"` |  |
| swm.ingress.paths[2].path | string | `"/swm/swagger"` |  |
| swm.ingress.paths[2].pathType | string | `"Prefix"` |  |
| swm.ingress.tls | list | `[]` |  |
| swm.initContainersTpl | object | `{}` |  |
| swm.name | string | `"xr-swm"` |  |
| swm.podAnnotations | object | `{}` |  |
| swm.podLabels | object | `{}` |  |
| swm.port | int | `8080` |  |
| swm.rbac.enabled | bool | `false` |  |
| swm.rbac.roleBindingDefinitionTpl | string | `nil` |  |
| swm.rbac.serviceAccountName | string | `"software-manager"` |  |
| swm.replicas | int | `1` |  |
| swm.resources | object | `{}` |  |
| swm.restartPolicy | string | `"Always"` |  |
| swm.securityContext | object | `{}` |  |
| swm.service.labels | object | `{}` |  |
| swm.service.type | string | `"ClusterIP"` |  |
| tc.clients.jetstream.tls.caPool | string | `"/certs/jetstream/ca.crt"` | Root CA certificate in PEM format |
| tc.clients.jetstream.tls.certFile | string | `"/certs/jetstream/tls.crt"` | client public certificate in PEM format |
| tc.clients.jetstream.tls.keyFile | string | `"/certs/jetstream/tls.key"` | client private key in PEM format |
| tc.clients.jetstream.uri | string | `nil` | uri for jetstream server, defaults for deployed Nats server from Infrastructure chart |
| tc.clients.mongoDB.tls.caPool | string | `"/certs/mongoDB/ca.crt"` | Root CA certificate in PEM format |
| tc.clients.mongoDB.tls.certFile | string | `"/certs/mongoDB/tls.crt"` | client public certificate in PEM format |
| tc.clients.mongoDB.tls.keyFile | string | `"/certs/mongoDB/tls.key"` | client private key in PEM format |
| tc.clients.mongoDB.uri | string | `nil` | uri for MongoDB server, defaults for deployed MongoDB server from Infrastructure chart |
| tc.clients.temporal.activity.startToCloseTimeout | timeDuration | `nil` | default temporal activity options builder start to close timeout value |
| tc.clients.temporal.child.executionTimeout | timeDuration | `nil` | default temporal child workflow options builder execution timeout value |
| tc.clients.temporal.local.startToCloseTimeout | timeDuration | `nil` | default temporal local activity options builder start to close timeout value |
| tc.clients.temporal.namespace | string | `"ipm"` | default namespace to be used and created if inexistent |
| tc.clients.temporal.retry.executionTimeout | timeDuration | `nil` | default temporal workflow options builder execution timeout value |
| tc.clients.temporal.retry.maximumAttemps | int | `nil` | default temporal retry policy builder maximum attempts value |
| tc.clients.temporal.retry.maximumInterval | timeDuration | `nil` | default temporal retry policy builder maximum interval value |
| tc.clients.temporal.tls.caPool | string | `"/certs/temporal/ca.crt"` | Root CA certificate in PEM format |
| tc.clients.temporal.tls.certFile | string | `"/certs/temporal/tls.crt"` | client public certificate in PEM format |
| tc.clients.temporal.tls.keyFile | string | `"/certs/temporal/tls.key"` | client private key in PEM format |
| tc.clients.temporal.uri | string | `nil` | uri for Temporal server, defaults for deployed Temporal server from Domain Manager chart |
| tc.clients.temporal.workflow.executionTimeout | timeDuration | `nil` |  |
| tc.config | object | `{"ExecutorQueueSize":null,"JsMacAckPending":null,"fileName":"xr-tc-service.yaml","jsAckWait":null,"logLevel":"debug","mountPath":"/config","volume":"config"}` | Service configuration |
| tc.config.fileName | string | `"xr-tc-service.yaml"` | Service configuration file |
| tc.config.mountPath | string | `"/config"` | Configuration mount path |
| tc.config.volume | string | `"config"` | Service configuration volume name |
| tc.deploymentAnnotations | object | `{}` | Additional annotations for event_gateway deployment |
| tc.deploymentLabels | object | `{}` | Additional labels for event_gateway deployment |
| tc.extraVolumeMounts | list | `[{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true},{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true},{"mountPath":"/certs/temporal","name":"temporal-tls","readOnly":true}]` | Optional extra volume mounts |
| tc.extraVolumeMounts[0] | object | `{"mountPath":"/certs/jetstream","name":"nats-tls","readOnly":true}` | extra volume mount for nats tls secret |
| tc.extraVolumeMounts[1] | object | `{"mountPath":"/certs/mongoDB","name":"mongo-tls","readOnly":true}` | extra volume mount for mongoDB tls secret |
| tc.extraVolumes | list | `[{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}},{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}},{"name":"temporal-tls","secret":{"secretName":"temporal-client-tls"}}]` | Optional extra volume mounts |
| tc.extraVolumes[0] | object | `{"name":"nats-tls","secret":{"secretName":"nats-client-tls"}}` | extra volume for nats tls secret |
| tc.extraVolumes[1] | object | `{"name":"mongo-tls","secret":{"secretName":"mongodb-client-tls"}}` | extra volume for mongoDB tls secret |
| tc.extraVolumes[2] | object | `{"name":"temporal-tls","secret":{"secretName":"temporal-client-tls"}}` | extra volume for temporal tls secret             |
| tc.fullnameOverride | string | `"xr-tc"` | Full name to override |
| tc.image.imagePullSecrets | object | `{}` | Image pull secrets |
| tc.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| tc.image.registry | string | `"pt-nexus01-prd.infinera.com/"` | Image registry |
| tc.image.repository | string | `"xr-cm/tc"` | Image repository |
| tc.image.tag | string | `"v1.2.3-4"` | Image tag. |
| tc.ingress.className | string | `""` |  |
| tc.ingress.enabled | bool | `true` |  |
| tc.ingress.fileName | string | `"xr-tc-ingress.yaml"` |  |
| tc.ingress.paths[0].backend.service.name | string | `"xr-tc"` |  |
| tc.ingress.paths[0].backend.service.port | string | `"tc-port"` |  |
| tc.ingress.paths[0].path | string | `"/api/v1/transport-capacities"` |  |
| tc.ingress.paths[0].pathType | string | `"Prefix"` |  |
| tc.ingress.paths[1].backend.service.name | string | `"xr-tc"` |  |
| tc.ingress.paths[1].backend.service.port | string | `"tc-port"` |  |
| tc.ingress.paths[1].path | string | `"/api/v1/capacity-links"` |  |
| tc.ingress.paths[1].pathType | string | `"Prefix"` |  |
| tc.ingress.paths[2].backend.service.name | string | `"xr-tc"` |  |
| tc.ingress.paths[2].backend.service.port | string | `"tc-port"` |  |
| tc.ingress.paths[2].path | string | `"/tc"` |  |
| tc.ingress.paths[2].pathType | string | `"Prefix"` |  |
| tc.ingress.paths[3].backend.service.name | string | `"xr-tc"` |  |
| tc.ingress.paths[3].backend.service.port | string | `"tc-port"` |  |
| tc.ingress.paths[3].path | string | `"/tc/swagger"` |  |
| tc.ingress.paths[3].pathType | string | `"Prefix"` |  |
| tc.ingress.tls | list | `[]` |  |
| tc.initContainersTpl | object | `{}` | Init containers definition. Resolved as template |
| tc.name | string | `"xr-tc"` |  |
| tc.podAnnotations | object | `{}` | Annotations for event_gateway pod |
| tc.podLabels | object | `{}` | Labels for event_gateway pod |
| tc.port | int | `8080` |  |
| tc.rbac.enabled | bool | `false` | Create RBAC config |
| tc.rbac.roleBindingDefinitionTpl | string | `nil` | template definition for Role/binding etc.. |
| tc.rbac.serviceAccountName | string | `"transport-capacity"` | Name of event_gateway SA |
| tc.replicas | int | `1` | Number of replicas |
| tc.resources | object | `{}` | Resources limit |
| tc.restartPolicy | string | `"Always"` | Restart policy for pod |
| tc.securityContext | object | `{}` | Security context for pod |
| tc.service.labels | object | `{}` | Labels for event_gateway service |
| tc.service.type | string | `"ClusterIP"` | Service type |
| temporal.cassandra.enabled | bool | `false` |  |
| temporal.elasticsearch.enabled | bool | `false` |  |
| temporal.grafana.enabled | bool | `false` |  |
| temporal.mysql.enabled | bool | `false` |  |
| temporal.postgresql.enabled | bool | `true` |  |
| temporal.prometheus.enabled | bool | `false` |  |
| temporal.schema.setup.enabled | bool | `false` |  |
| temporal.schema.update.enabled | bool | `false` |  |
| temporal.server.additionalEnv[0].name | string | `"TEMPORAL_CLI_TLS_CA"` |  |
| temporal.server.additionalEnv[0].value | string | `"/certs/temporal/ca.crt"` |  |
| temporal.server.additionalEnv[10].name | string | `"TEMPORAL_TLS_SERVER_CERT"` |  |
| temporal.server.additionalEnv[10].value | string | `"/certs/temporal/tls.crt"` |  |
| temporal.server.additionalEnv[11].name | string | `"TEMPORAL_TLS_FRONTEND_DISABLE_HOST_VERIFICATION"` |  |
| temporal.server.additionalEnv[11].value | string | `"true"` |  |
| temporal.server.additionalEnv[12].name | string | `"TEMPORAL_TLS_INTERNODE_DISABLE_HOST_VERIFICATION"` |  |
| temporal.server.additionalEnv[12].value | string | `"true"` |  |
| temporal.server.additionalEnv[1].name | string | `"TEMPORAL_CLI_TLS_KEY"` |  |
| temporal.server.additionalEnv[1].value | string | `"/certs/temporal/tls.key"` |  |
| temporal.server.additionalEnv[2].name | string | `"TEMPORAL_CLI_TLS_CERT"` |  |
| temporal.server.additionalEnv[2].value | string | `"/certs/temporal/tls.crt"` |  |
| temporal.server.additionalEnv[3].name | string | `"TEMPORAL_CLI_TLS_ENABLE_HOST_VERIFICATION"` |  |
| temporal.server.additionalEnv[3].value | string | `"false"` |  |
| temporal.server.additionalEnv[4].name | string | `"TEMPORAL_TLS_SERVER_CA_CERT"` |  |
| temporal.server.additionalEnv[4].value | string | `"/certs/temporal/ca.crt"` |  |
| temporal.server.additionalEnv[5].name | string | `"TEMPORAL_TLS_FRONTEND_KEY"` |  |
| temporal.server.additionalEnv[5].value | string | `"/certs/temporal/tls.key"` |  |
| temporal.server.additionalEnv[6].name | string | `"TEMPORAL_TLS_FRONTEND_CERT"` |  |
| temporal.server.additionalEnv[6].value | string | `"/certs/temporal/tls.crt"` |  |
| temporal.server.additionalEnv[7].name | string | `"TEMPORAL_TLS_CLIENT1_CA_CERT"` |  |
| temporal.server.additionalEnv[7].value | string | `"/certs/temporal/ca.crt"` |  |
| temporal.server.additionalEnv[8].name | string | `"TEMPORAL_TLS_CLIENT2_CA_CERT"` |  |
| temporal.server.additionalEnv[8].value | string | `"/certs/temporal/ca.crt"` |  |
| temporal.server.additionalEnv[9].name | string | `"TEMPORAL_TLS_SERVER_KEY"` |  |
| temporal.server.additionalEnv[9].value | string | `"/certs/temporal/tls.key"` |  |
| temporal.server.additionalToolEnvVars[0].name | string | `"TEMPORAL_CLI_TLS_CA"` |  |
| temporal.server.additionalToolEnvVars[0].value | string | `"/certs/temporal/ca.crt"` |  |
| temporal.server.additionalToolEnvVars[1].name | string | `"TEMPORAL_CLI_TLS_KEY"` |  |
| temporal.server.additionalToolEnvVars[1].value | string | `"/certs/temporal/tls.key"` |  |
| temporal.server.additionalToolEnvVars[2].name | string | `"TEMPORAL_CLI_TLS_CERT"` |  |
| temporal.server.additionalToolEnvVars[2].value | string | `"/certs/temporal/tls.crt"` |  |
| temporal.server.additionalToolEnvVars[3].name | string | `"TEMPORAL_CLI_TLS_DISABLE_HOST_VERIFICATION"` |  |
| temporal.server.additionalToolEnvVars[3].value | string | `"true"` |  |
| temporal.server.additionalToolEnvVars[4].name | string | `"TEMPORAL_CLI_TLS_ENABLE_HOST_VERIFICATION"` |  |
| temporal.server.additionalToolEnvVars[4].value | string | `"false"` |  |
| temporal.server.additionalVolumeMounts[0].mountPath | string | `"/certs/sql"` |  |
| temporal.server.additionalVolumeMounts[0].name | string | `"sql-tls"` |  |
| temporal.server.additionalVolumeMounts[0].readOnly | bool | `true` |  |
| temporal.server.additionalVolumeMounts[1].mountPath | string | `"/certs/temporal"` |  |
| temporal.server.additionalVolumeMounts[1].name | string | `"temporal-tls"` |  |
| temporal.server.additionalVolumeMounts[1].readOnly | bool | `true` |  |
| temporal.server.additionalVolumes[0].name | string | `"sql-tls"` |  |
| temporal.server.additionalVolumes[0].secret.secretName | string | `"sql-client-tls"` |  |
| temporal.server.additionalVolumes[1].name | string | `"temporal-tls"` |  |
| temporal.server.additionalVolumes[1].secret.secretName | string | `"temporal-server-tls"` |  |
| temporal.server.additionalWebEnvVars[0].name | string | `"TEMPORAL_TLS_CA_PATH"` |  |
| temporal.server.additionalWebEnvVars[0].value | string | `"/certs/temporal/ca.crt"` |  |
| temporal.server.additionalWebEnvVars[1].name | string | `"TEMPORAL_TLS_KEY_PATH"` |  |
| temporal.server.additionalWebEnvVars[1].value | string | `"/certs/temporal/temporal-web.key"` |  |
| temporal.server.additionalWebEnvVars[2].name | string | `"TEMPORAL_TLS_CERT_PATH"` |  |
| temporal.server.additionalWebEnvVars[2].value | string | `"/certs/temporal/temporal-web.crt"` |  |
| temporal.server.additionalWebEnvVars[3].name | string | `"TEMPORAL_NOTIFY_ON_NEW_VERSION"` |  |
| temporal.server.additionalWebEnvVars[3].value | bool | `false` |  |
| temporal.server.additionalWebEnvVars[4].name | string | `"TEMPORAL_TLS_ENABLE_HOST_VERIFICATION"` |  |
| temporal.server.additionalWebEnvVars[4].value | string | `"false"` |  |
| temporal.server.config.persistence.default.driver | string | `"sql"` |  |
| temporal.server.config.persistence.default.sql.database | string | `"temporal"` |  |
| temporal.server.config.persistence.default.sql.driver | string | `"postgres"` |  |
| temporal.server.config.persistence.default.sql.existingSecret | string | `"ipm-postgresql-secret"` |  |
| temporal.server.config.persistence.default.sql.host | string | `"inf-postgresql"` |  |
| temporal.server.config.persistence.default.sql.maxConnLifetime | string | `"1h"` |  |
| temporal.server.config.persistence.default.sql.maxConns | int | `20` |  |
| temporal.server.config.persistence.default.sql.port | int | `5432` |  |
| temporal.server.config.persistence.default.sql.secretName | string | `"password"` |  |
| temporal.server.config.persistence.default.sql.user | string | `"dbusername"` |  |
| temporal.server.config.persistence.default.tls.caFile | string | `"/certs/sql/ca.crt"` |  |
| temporal.server.config.persistence.default.tls.certFile | string | `"/certs/sql/tls.crt"` |  |
| temporal.server.config.persistence.default.tls.enableHostVerification | bool | `true` |  |
| temporal.server.config.persistence.default.tls.enabled | bool | `true` |  |
| temporal.server.config.persistence.default.tls.keyFile | string | `"/certs/sql/tls.key"` |  |
| temporal.server.config.persistence.visibility.driver | string | `"sql"` |  |
| temporal.server.config.persistence.visibility.sql.database | string | `"temporal_visibility"` |  |
| temporal.server.config.persistence.visibility.sql.driver | string | `"postgres"` |  |
| temporal.server.config.persistence.visibility.sql.existingSecret | string | `"ipm-postgresql-secret"` |  |
| temporal.server.config.persistence.visibility.sql.host | string | `"inf-postgresql"` |  |
| temporal.server.config.persistence.visibility.sql.maxConnLifetime | string | `"1h"` |  |
| temporal.server.config.persistence.visibility.sql.maxConns | int | `20` |  |
| temporal.server.config.persistence.visibility.sql.port | int | `5432` |  |
| temporal.server.config.persistence.visibility.sql.secretName | string | `"password"` |  |
| temporal.server.config.persistence.visibility.sql.user | string | `"dbusername"` |  |
| temporal.server.config.persistence.visibility.tls.caFile | string | `"/certs/sql/ca.crt"` |  |
| temporal.server.config.persistence.visibility.tls.certFile | string | `"/certs/sql/tls.crt"` |  |
| temporal.server.config.persistence.visibility.tls.enableHostVerification | bool | `true` |  |
| temporal.server.config.persistence.visibility.tls.enabled | bool | `true` |  |
| temporal.server.config.persistence.visibility.tls.keyFile | string | `"/certs/sql/tls.key"` |  |
| temporal.server.config.tls.frontend.client.rootCaFiles[0] | string | `"/certs/temporal/ca.crt"` |  |
| temporal.server.config.tls.frontend.client.serverName | string | `nil` |  |
| temporal.server.config.tls.frontend.server.certFile | string | `"/certs/temporal/tls.crt"` |  |
| temporal.server.config.tls.frontend.server.clientCaFiles[0] | string | `"/certs/temporal/ca.crt"` |  |
| temporal.server.config.tls.frontend.server.keyFile | string | `"/certs/temporal/tls.key"` |  |
| temporal.server.config.tls.frontend.server.requireClientAuth | bool | `true` |  |
| temporal.server.config.tls.internode.client.rootCaFiles[0] | string | `"/certs/temporal/ca.crt"` |  |
| temporal.server.config.tls.internode.client.serverName | string | `nil` |  |
| temporal.server.config.tls.internode.server.certFile | string | `"/certs/temporal/tls.crt"` |  |
| temporal.server.config.tls.internode.server.clientCaFiles[0] | string | `"/certs/temporal/ca.crt"` |  |
| temporal.server.config.tls.internode.server.keyFile | string | `"/certs/temporal/tls.key"` |  |
| temporal.server.config.tls.internode.server.requireClientAuth | bool | `true` |  |
| temporal.web.enabled | bool | `false` |  |
| tlsConfig.loadTLS | bool | `false` |  |
| tlsConfig.selfSigned | bool | `true` |  |
| tlsConfig.useCertManager | bool | `true` |  |
| tolerations | list | `[]` |  |
| ums.config.fileName | string | `"xr-ums-service.yaml"` |  |
| ums.config.mountPath | string | `"/config"` |  |
| ums.config.volume | string | `"config"` |  |
| ums.deploymentAnnotations | object | `{}` |  |
| ums.deploymentLabels | object | `{}` |  |
| ums.extraVolumeMounts | object | `{}` |  |
| ums.fullnameOverride | string | `"xr-ums"` |  |
| ums.image.imagePullSecrets | object | `{}` |  |
| ums.image.pullPolicy | string | `"IfNotPresent"` |  |
| ums.image.registry | string | `"iartifactory.infinera.com/"` |  |
| ums.image.repository | string | `"nm/ni/user-manager"` |  |
| ums.image.tag | string | `"2.2.2-alpha.1"` |  |
| ums.ingress.className | string | `""` |  |
| ums.ingress.enabled | bool | `true` |  |
| ums.ingress.fileName | string | `"xr-ums-ingress.yaml"` |  |
| ums.ingress.paths[0].backend.service.name | string | `"xr-ums"` |  |
| ums.ingress.paths[0].backend.service.port | string | `"ums-port"` |  |
| ums.ingress.paths[0].path | string | `"/user-manager"` |  |
| ums.ingress.paths[0].pathType | string | `"Prefix"` |  |
| ums.ingress.tls | list | `[]` |  |
| ums.initContainersTpl | object | `{}` |  |
| ums.name | string | `"xr-ums"` |  |
| ums.podAnnotations | object | `{}` |  |
| ums.podLabels | object | `{}` |  |
| ums.port | int | `8080` |  |
| ums.rbac.enabled | bool | `false` |  |
| ums.rbac.roleBindingDefinitionTpl | string | `nil` |  |
| ums.rbac.serviceAccountName | string | `"user-manager"` |  |
| ums.replicas | int | `1` |  |
| ums.resources | object | `{}` |  |
| ums.restartPolicy | string | `"Always"` |  |
| ums.securityContext | object | `{}` |  |
| ums.service.labels | object | `{}` |  |
| ums.service.type | string | `"ClusterIP"` |  |
| web.config | object | `{"fileName":"xr-web-gui-service.yaml","mountPath":"/config","volume":"config"}` | Service configuration |
| web.config.fileName | string | `"xr-web-gui-service.yaml"` | Service configuration file |
| web.config.mountPath | string | `"/config"` | Configuration mount path |
| web.config.volume | string | `"config"` | Service configuration volume name |
| web.deploymentAnnotations | object | `{}` | Additional annotations for event_gateway deployment |
| web.deploymentLabels | object | `{}` | Additional labels for event_gateway deployment |
| web.extraVolumeMounts | object | `{}` | Optional extra volume mounts |
| web.fullnameOverride | string | `"web-gui"` | Full name to override |
| web.image.imagePullSecrets | object | `{}` | Image pull secrets |
| web.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| web.image.registry | string | `"pt-nexus01-prd.infinera.com/"` | Image registry |
| web.image.repository | string | `"xr-cm/web"` | Image repository |
| web.image.tag | string | `"1.2.3-2"` | Image tag. |
| web.ingress.className | string | `""` |  |
| web.ingress.enabled | bool | `true` |  |
| web.ingress.fileName | string | `"xr-web-ui-ingress.yaml"` |  |
| web.ingress.paths[0].backend.service.name | string | `"web-gui"` |  |
| web.ingress.paths[0].backend.service.port | string | `"web-gui-port"` |  |
| web.ingress.paths[0].path | string | `"/"` |  |
| web.ingress.paths[0].pathType | string | `"Prefix"` |  |
| web.ingress.tls | list | `[]` |  |
| web.initContainersTpl | object | `{}` | Init containers definition. Resolved as template |
| web.name | string | `"web-gui"` |  |
| web.podAnnotations | object | `{}` | Annotations for event_gateway pod |
| web.podLabels | object | `{}` | Labels for event_gateway pod |
| web.port | int | `8080` |  |
| web.rbac.enabled | bool | `false` | Create RBAC config |
| web.rbac.roleBindingDefinitionTpl | string | `nil` | template definition for Role/binding etc.. |
| web.rbac.serviceAccountName | string | `"web-gui"` | Name of event_gateway SA |
| web.replicas | int | `1` | Number of replicas |
| web.resources | object | `{}` | Resources limit |
| web.restartPolicy | string | `"Always"` | Restart policy for pod |
| web.securityContext | object | `{}` | Security context for pod |
| web.service.labels | object | `{}` | Labels for event_gateway service |
| web.service.type | string | `"ClusterIP"` | Service type |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
