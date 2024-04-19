{{- define  "DomainManager.network-service.image" -}}
    {{- $registryName := .Values.ns.image.registry | default "" -}}
    {{- $repositoryName := .Values.ns.image.repository -}}
    {{- $tag := .Values.ns.image.tag | default .Chart.AppVersion | toString -}}
    {{- printf "%s%s:%s" $registryName $repositoryName  $tag -}}
{{- end -}}

{{- define  "DomainManager.network-service.configName" -}}
    {{- $fullName :=  include "DomainManager.network-service.fullname" . -}}
    {{- printf "%s-cfg" $fullName }}
{{- end -}}

{{- define  "DomainManager.network-service.port" -}}
    {{- printf "8080" }}
{{- end -}}


