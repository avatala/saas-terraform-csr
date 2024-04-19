{{- define  "DomainManager.network-connection-service.image" -}}
    {{- $registryName := .Values.ncs.image.registry | default "" -}}
    {{- $repositoryName := .Values.ncs.image.repository -}}
    {{- $tag := .Values.ncs.image.tag | default .Chart.AppVersion | toString -}}
    {{- printf "%s%s:%s" $registryName $repositoryName  $tag -}}
{{- end -}}

{{- define  "DomainManager.network-connection-service.configName" -}}
    {{- $fullName :=  include "DomainManager.network-connection-service.fullname" . -}}
    {{- printf "%s-cfg" $fullName }}
{{- end -}}

{{- define  "DomainManager.network-connection-service.port" -}}
    {{- printf "8080" }}
{{- end -}}


