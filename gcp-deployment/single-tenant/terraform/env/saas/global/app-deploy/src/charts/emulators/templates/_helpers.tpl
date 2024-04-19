{{/*
Expand the name of the chart.
*/}}
{{- define "emulators.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "emulators.fullname" -}}
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

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "emulators.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "emulators.labels" -}}
helm.sh/chart: {{ include "emulators.chart" . }}
{{ include "emulators.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "emulators.selectorLabels" -}}
app.kubernetes.io/name: {{ include "emulators.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "emulators.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "emulators.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
Create the template to strip the known suffixes
*/}}
{{- define "emulators.stripSuffixes" }}
{{- $value := . -}}
{{- range list "_certs_mfgcrt.pem" "_certs_mfgkey.pem" "_inv_initialize.cfg" "_inv_startup.cfg" -}}
  {{- if hasSuffix . $value -}}
    {{- $value = trimSuffix . $value -}}
  {{- end -}}
{{- end -}}
{{- $value -}}
{{- end -}}

{{/*
Create the template to get the known devices
*/}}
{{- define "emulators.getDeviceKeys" -}}
{{- $keysList := list -}}
{{- range $path, $_ := .Files.Glob "data/**" -}}
  {{- $key := trimPrefix "data/" $path | replace "/" "_" -}}
  {{- if or (hasPrefix "xr_" $key) (hasPrefix "ndu_" $key) -}}
    {{- $strippedKey := include "emulators.stripSuffixes" $key -}}
    {{- if not (has $strippedKey $keysList) -}}
      {{- $keysList = append $keysList $strippedKey -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- range $index, $value := $keysList -}}
{{- $value -}}{{- "\n" -}}
{{- end -}}
{{- end -}}
