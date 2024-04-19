{{- define  "DomainManager.host-management-service.image" -}}
    {{- $registryName := .Values.hms.image.registry | default "" -}}
    {{- $repositoryName := .Values.hms.image.repository -}}
    {{- $tag := .Values.hms.image.tag | default .Chart.AppVersion | toString -}}
    {{- printf "%s%s:%s" $registryName $repositoryName  $tag -}}
{{- end -}}

{{- define  "DomainManager.host-management-service.configName" -}}
    {{- $fullName :=  include "DomainManager.host-management-service.fullname" . -}}
    {{- printf "%s-cfg" $fullName }}
{{- end -}}

{{- define  "DomainManager.host-management-service.port" -}}
    {{- printf "8080" }}
{{- end -}}