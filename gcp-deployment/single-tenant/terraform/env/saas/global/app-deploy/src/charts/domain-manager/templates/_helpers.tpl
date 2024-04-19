{{/*
Expand the name of the chart.
*/}}
{{- define "DomainManager.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "DomainManager.fullname" -}}
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

{{- define "DomainManager.event-gateway.fullname" -}}
{{- if .Values.eg.fullnameOverride }}
{{- .Values.eg.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Values.eg.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Release.Name $name .Values.eg.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "DomainManager.host-management-service.fullname" -}}
{{- if .Values.hms.fullnameOverride }}
{{- .Values.hms.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Values.hms.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Release.Name $name .Values.hms.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "DomainManager.device-aggregator.fullname" -}}
{{- if .Values.da.fullnameOverride }}
{{- .Values.da.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Values.da.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Release.Name $name .Values.da.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "DomainManager.module-manager.fullname" -}}
{{- if .Values.mm.fullnameOverride }}
{{- .Values.mm.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Values.mm.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Release.Name $name .Values.mm.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "DomainManager.network-connection-service.fullname" -}}
{{- if .Values.ncs.fullnameOverride }}
{{- .Values.ncs.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Values.ncs.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Release.Name $name .Values.ncs.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "DomainManager.network-service.fullname" -}}
{{- if .Values.ns.fullnameOverride }}
{{- .Values.ns.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Values.ns.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Release.Name $name .Values.ns.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "DomainManager.transport-capacity.fullname" -}}
{{- if .Values.tc.fullnameOverride }}
{{- .Values.tc.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Values.tc.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Release.Name $name .Values.tc.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "DomainManager.web-gui.fullname" -}}
{{- if .Values.web.fullnameOverride }}
{{- .Values.web.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Values.web.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Release.Name $name .Values.web.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "DomainManager.software-manager.fullname" -}}
{{- if .Values.swm.fullnameOverride }}
{{- .Values.swm.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Values.swm.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Release.Name $name .Values.swm.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "DomainManager.ndu-service.fullname" -}}
{{- if .Values.ndus.fullnameOverride }}
{{- .Values.ndus.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Values.ndus.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Release.Name $name .Values.ndus.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "DomainManager.user-manager.fullname" -}}
{{- if .Values.ums.fullnameOverride }}
{{- .Values.ums.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Values.ums.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Release.Name $name .Values.ums.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "DomainManager.domain-fault-management.fullname" -}}
{{- if .Values.dfm.fullnameOverride }}
{{- .Values.dfm.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Values.dfm.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" .Release.Name $name .Values.dfm.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "DomainManager.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "DomainManager.labels" -}}
helm.sh/chart: {{ include "DomainManager.chart" . }}
{{ include "DomainManager.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "DomainManager.selectorLabels" -}}
app.kubernetes.io/name: {{ include "DomainManager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "DomainManager.event-gateway.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.eg.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "DomainManager.host-management-service.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.hms.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "DomainManager.device-aggregator.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.da.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "DomainManager.module-manager.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.mm.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "DomainManager.network-connection-service.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.ncs.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "DomainManager.network-service.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.ns.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "DomainManager.transport-capacity.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.tc.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "DomainManager.web-gui.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.web.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "DomainManager.software-manager.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.swm.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "DomainManager.ndu-service.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.ndus.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "DomainManager.user-manager.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.ums.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "DomainManager.domain-fault-management.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.dfm.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define  "DomainManager.keycloakOAuthUrl" -}}
     {{- printf "http://keycloak-oauth2-proxy.%s.svc.%s/oauth2/auth" .Values.namespace_keycloak .Values.cluster.dns }}
{{- end -}}


{{/*
Define common annotations
*/}}
{{- define "DomainManager.common-ingress.annotations" -}}
nginx.ingress.kubernetes.io/proxy-read-timeout: "3600"
nginx.ingress.kubernetes.io/proxy-send-timeout: "3600"
nginx.ingress.kubernetes.io/auth-url: {{ include "DomainManager.keycloakOAuthUrl" . }}
nginx.ingress.kubernetes.io/auth-response-headers: "x-auth-request-user, x-auth-request-access-token, x-auth-request-email"
nginx.ingress.kubernetes.io/proxy-buffer-size: "16k"
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "DomainManager.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "DomainManager.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "DomainManager.tplvalues.render" -}}
    {{- if typeIs "string" .value }}
        {{- tpl .value .context }}
    {{- else }}
        {{- tpl (.value | toYaml) .context }}
    {{- end }}
{{- end -}}


{{- define  "DomainManager.mongoDBSrvAddr" -}}
     {{- printf "mongodb-headless.%s.svc.%s" $.Values.namespace_inf $.Values.cluster.dns }}
{{- end -}}

{{- define  "DomainManager.mongoDBAddr" -}}
     {{- printf "mongodb-headless.%s.svc.%s:27017" $.Values.namespace_inf $.Values.cluster.dns }}
{{- end -}}

{{- define  "DomainManager.jetstreamSrvAddr" -}}
   {{- printf "%s.%s.svc.%s" $.Values.service_nats $.Values.namespace_inf $.Values.cluster.dns }}
{{- end -}}

{{- define  "DomainManager.jetstreamAddr" -}}
   {{- printf "nats://%s.%s.svc.%s:4222" $.Values.service_nats $.Values.namespace_inf $.Values.cluster.dns }}
{{- end -}}

{{- define "DomainManager.temporalAddr" -}}
{{- printf "dm-temporal-frontend-headless.%s.svc.%s:7233" $.Release.Namespace $.Values.cluster.dns }}
{{- end -}}

{{- define  "DomainManager.plgdAddr" -}}
   {{- printf "%s.%s.svc.%s:9100" $.Values.service_http_gw $.Values.namespace_am $.Values.cluster.dns }}
{{- end -}}

{{- define  "DomainManager.plgdGRPCgw" -}}
   {{- printf "%s.%s.svc.%s:9100" $.Values.service_grpc_gw $.Values.namespace_am $.Values.cluster.dns }}

{{- end -}}

{{- define  "DomainManager.plgdJetstream" -}}
   {{- printf "nats://%s.%s.svc.%s:4222" $.Values.service_nats_am $.Values.namespace_am $.Values.cluster.dns }}
{{- end -}}

{{- define  "plgd.oauth" -}}
   {{- printf "%s.%s.svc.%s:9100" $.Values.service_oauth $.Values.namespace_am $.Values.cluster.dns }}
{{- end -}}
{{- define  "DomainManager.keycloakAddr" -}}
     {{- printf "http://keycloak-keycloakx-headless.%s.svc.%s:8080/realms/xr-cm" $.Values.namespace_keycloak $.Values.cluster.dns }}
{{- end -}}
{{- define  "DomainManager.busybox.image" -}}
    {{- printf "busybox:1.35" }}
{{- end -}}

{{- define  "DomainManager.temporal-admin-tools.image" -}}
    {{- printf "temporalio/admin-tools:1.21.2" }}
{{- end -}}

{{- define  "DomainManager.nats-box.image" -}}
    {{- printf "natsio/nats-box:0.13.3" }}
{{- end -}}
