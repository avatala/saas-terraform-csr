{{- define "DomainManager.ndu-service.image" -}}
  {{- $registryName := .Values.ndus.image.registry | default "" -}}
  {{- $repositoryName := .Values.ndus.image.repository -}}
  {{- $tag := .Values.ndus.image.tag | default .Chart.AppVersion | toString -}}
  {{- printf "%s%s:%s" $registryName $repositoryName  $tag -}}
{{- end -}}

{{- define "DomainManager.ndu-service.configName" -}}
  {{- $fullName := include "DomainManager.ndu-service.fullname" . -}}
  {{- printf "%s-cfg" $fullName }}
{{- end -}}

{{- define "DomainManager.ndu-service.port" -}}
  {{- printf "8080" -}}
{{- end -}}

{{- define  "DomainManager.ndu-service.logLevel" -}}
    {{- printf "debug" }}
{{- end -}}