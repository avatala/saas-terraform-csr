{{/*
Expand the name of the chart.
*/}}
{{- define "aggregation-manager.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "aggregation-manager.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "aggregation-manager.aggregation-fault-management.fullname" -}}
{{- if .Values.afm.fullnameOverride }}
{{- .Values.afm.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Values.afm.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Release.Name $name .Values.afm.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "aggregation-manager.device-configuration-distributor.fullname" -}}
{{- if .Values.dcd.fullnameOverride }}
{{- .Values.dcd.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Values.dcd.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Release.Name $name .Values.dcd.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "aggregation-manager.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "aggregation-manager.labels" -}}
helm.sh/chart: {{ include "aggregation-manager.chart" . }}
{{ include "aggregation-manager.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "aggregation-manager.selectorLabels" -}}
app.kubernetes.io/name: {{ include "aggregation-manager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "aggregation-manager.aggregation-fault-management.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.afm.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "aggregation-manager.device-configuration-distributor.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.dcd.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{/*
Create the name of the service account to use
*/}}
{{- define "aggregation-manager.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "aggregation-manager.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define  "aggregation-manager.mongoDBSrvAddr" -}}
     {{- printf "mongodb-headless.%s.svc.%s" $.Values.namespace_inf $.Values.cluster.dns }}
{{- end -}}

{{- define  "aggregation-manager.mongoDBAddr" -}}
     {{- printf "mongodb-headless.%s.svc.%s:27017" $.Values.namespace_inf $.Values.cluster.dns }}
{{- end -}}

{{- define  "aggregation-manager.jetstreamSrvAddr" -}}
   {{- printf "%s.%s.svc.%s" $.Values.service_nats $.Values.namespace_inf $.Values.cluster.dns }}
{{- end -}}

{{- define  "aggregation-manager.jetstreamAddr" -}}
   {{- printf "nats://%s.%s.svc.%s:4222" $.Values.service_nats $.Values.namespace_inf $.Values.cluster.dns }}
{{- end -}}

{{- define  "aggregation-manager.plgdAddr" -}}
   {{- printf "%s.%s.svc.%s:9100" $.Values.service_http_gw $.Values.namespace_am $.Values.cluster.dns }}
{{- end -}}

{{- define  "aggregation-manager.plgdGRPCgw" -}}
   {{- printf "%s.%s.svc.%s:9100" $.Values.service_grpc_gw $.Values.namespace_am $.Values.cluster.dns }}

{{- end -}}

{{- define  "aggregation-manager.plgdJetstream" -}}
   {{- printf "nats://%s.%s.svc.%s:4222" $.Values.service_nats_am $.Values.namespace_am $.Values.cluster.dns }}
{{- end -}}

{{- define  "aggregation-manager.mqtt" -}}
     {{- printf "mqtts://%s.%s.svc.%s:8883" $.Values.service_mqtt $.Values.namespace_inf $.Values.cluster.dns }}
{{- end -}}

{{- define  "aggregation-manager.mqttSrvAddr" -}}
   {{- printf "%s.%s.svc.%s" $.Values.service_mqtt $.Values.namespace_inf $.Values.cluster.dns }}
{{- end -}}

{{- define  "aggregation-manager.keycloakOAuthUrl" -}}
     {{- printf "http://keycloak-oauth2-proxy.%s.svc.%s/oauth2/auth" .Values.namespace_keycloak .Values.cluster.dns }}
{{- end -}}

{{- define "aggregation-manager.common-ingress.annotations" -}}
nginx.ingress.kubernetes.io/proxy-read-timeout: "3600"
nginx.ingress.kubernetes.io/proxy-send-timeout: "3600"
nginx.ingress.kubernetes.io/auth-url: {{ include "aggregation-manager.keycloakOAuthUrl" . }}
nginx.ingress.kubernetes.io/auth-response-headers: "x-auth-request-user, x-auth-request-access-token, x-auth-request-email"
nginx.ingress.kubernetes.io/proxy-buffer-size: "16k"
{{- end }}

{{- define  "aggregation-manager.keycloakAddr" -}}
     {{- printf "http://keycloak-keycloakx-headless.%s.svc.%s:8080/realms/xr-cm" $.Values.namespace_keycloak $.Values.cluster.dns }}
{{- end -}}

{{- define  "aggregation-manager.busybox.image" -}}
    {{- printf "busybox:1.35" }}
{{- end -}}


{{- define  "aggregation-manager.nats-box.image" -}}
    {{- printf "natsio/nats-box:0.13.3" }}
{{- end -}}
