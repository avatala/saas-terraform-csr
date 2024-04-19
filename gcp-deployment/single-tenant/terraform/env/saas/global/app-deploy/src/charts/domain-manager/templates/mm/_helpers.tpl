{{- define  "DomainManager.module-manager.image" -}}
    {{- $registryName := .Values.hms.image.registry | default "" -}}
    {{- $repositoryName := .Values.mm.image.repository -}}
    {{- $tag := .Values.mm.image.tag | default .Chart.AppVersion | toString -}}
    {{- printf "%s%s:%s" $registryName $repositoryName  $tag -}}
{{- end -}}

{{- define  "DomainManager.module-manager.configName" -}}
    {{- $fullName :=  include "DomainManager.module-manager.fullname" . -}}
    {{- printf "%s-cfg" $fullName }}
{{- end -}}

{{- define  "DomainManager.module-manager.port" -}}
    {{- printf "8080" }}
{{- end -}}