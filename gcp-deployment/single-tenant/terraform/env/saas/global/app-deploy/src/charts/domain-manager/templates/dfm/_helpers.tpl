{{- define  "DomainManager.domain-fault-management.image" -}}
    {{- $registryName := .Values.dfm.image.registry | default "" -}}
    {{- $repositoryName := .Values.dfm.image.repository -}}
    {{- $tag := .Values.dfm.image.tag | default .Chart.AppVersion | toString -}}
    {{- printf "%s%s:%s" $registryName $repositoryName  $tag -}}
{{- end -}}

{{- define  "DomainManager.domain-fault-management.configName" -}}
    {{- $fullName :=  include "DomainManager.domain-fault-management.fullname" . -}}
    {{- printf "%s-cfg" $fullName }}
{{- end -}}

{{- define  "DomainManager.domain-fault-management.port" -}}
    {{- printf "8080" }}
{{- end -}}