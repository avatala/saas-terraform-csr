{{- define  "DomainManager.transport-capacity.image" -}}
    {{- $registryName := .Values.tc.image.registry | default "" -}}
    {{- $repositoryName := .Values.tc.image.repository -}}
    {{- $tag := .Values.tc.image.tag | default .Chart.AppVersion | toString -}}
    {{- printf "%s%s:%s" $registryName $repositoryName  $tag -}}
{{- end -}}

{{- define  "DomainManager.transport-capacity.configName" -}}
    {{- $fullName :=  include "DomainManager.transport-capacity.fullname" . -}}
    {{- printf "%s-cfg" $fullName }}
{{- end -}}

{{- define  "DomainManager.transport-capacity.port" -}}
    {{- printf "8080" }}
{{- end -}}


