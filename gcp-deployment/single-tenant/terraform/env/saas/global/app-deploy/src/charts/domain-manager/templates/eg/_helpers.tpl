{{- define  "DomainManager.event-gateway.image" -}}
    {{- $registryName := .Values.eg.image.registry | default "" -}}
    {{- $repositoryName := .Values.eg.image.repository -}}
    {{- $tag := .Values.eg.image.tag | default .Chart.AppVersion | toString -}}
    {{- printf "%s%s:%s" $registryName $repositoryName  $tag -}}
{{- end -}}

{{- define  "DomainManager.event-gateway.configName" -}}
    {{- $fullName :=  include "DomainManager.event-gateway.fullname" . -}}
    {{- printf "%s-cfg" $fullName }}
{{- end -}}

{{- define  "DomainManager.event-gateway.port" -}}
    {{- printf "8080" }}
{{- end -}}