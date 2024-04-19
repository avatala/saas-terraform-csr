{{- define  "DomainManager.web-gui.image" -}}
    {{- $registryName := .Values.ncs.image.registry | default "" -}}
    {{- $repositoryName := .Values.web.image.repository -}}
    {{- $tag := .Values.web.image.tag | default .Chart.AppVersion | toString -}}
    {{- printf "%s%s:%s" $registryName $repositoryName  $tag -}}
{{- end -}}

{{- define  "DomainManager.web-gui.configName" -}}
    {{- $fullName :=  include "DomainManager.web-gui.fullname" . -}}
    {{- printf "%s-cfg" $fullName }}
{{- end -}}

{{- define  "DomainManager.web-gui.port" -}}
    {{- printf "8080" }}
{{- end -}}


