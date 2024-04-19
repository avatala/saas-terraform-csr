{{- define  "aggregation-manager.aggregation-fault-management.image" -}}
    {{- $registryName := .Values.afm.image.registry | default "" -}}
    {{- $repositoryName := .Values.afm.image.repository -}}
    {{- $tag := .Values.afm.image.tag | default .Chart.AppVersion | toString -}}
    {{- printf "%s%s:%s" $registryName $repositoryName  $tag -}}
{{- end -}}

{{- define  "aggregation-manager.aggregation-fault-management.configName" -}}
    {{- $fullName :=  include "aggregation-manager.aggregation-fault-management.fullname" . -}}
    {{- printf "%s-cfg" $fullName }}
{{- end -}}

{{- define  "aggregation-manager.aggregation-fault-management.port" -}}
    {{- printf "8080" }}
{{- end -}}