{{- define  "DomainManager.software-manager.image" -}}
    {{- $registryName := .Values.swm.image.registry | default "" -}}
    {{- $repositoryName := .Values.swm.image.repository -}}
    {{- $tag := .Values.swm.image.tag | default .Chart.AppVersion | toString -}}
    {{- printf "%s%s:%s" $registryName $repositoryName  $tag -}}
{{- end -}}

{{- define  "DomainManager.software-manager.configName" -}}
    {{- $fullName :=  include "DomainManager.software-manager.fullname" . -}}
    {{- printf "%s-cfg" $fullName }}
{{- end -}}

{{- define  "DomainManager.software-manager.port" -}}
    {{- printf "8080" }}
{{- end -}}