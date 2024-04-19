{{- define  "aggregation-manager.device-configuration-distributor.image" -}}
    {{- $registryName := .Values.dcd.image.registry | default "" -}}
    {{- $repositoryName := .Values.dcd.image.repository -}}
    {{- $tag := .Values.dcd.image.tag | default .Chart.AppVersion | toString -}}
    {{- printf "%s%s:%s" $registryName $repositoryName  $tag -}}
{{- end -}}

{{- define  "aggregation-manager.device-configuration-distributor.configName" -}}
    {{- $fullName :=  include "aggregation-manager.device-configuration-distributor.fullname" . -}}
    {{- printf "%s-cfg" $fullName }}
{{- end -}}

{{- define  "aggregation-manager.device-configuration-distributor.port" -}}
    {{- printf "8080" }}
{{- end -}}

{{- define  "plgd.oauth" -}}
   {{- printf "%s.%s.svc.%s:9100" $.Values.service_oauth $.Values.namespace_am $.Values.cluster.dns }}
{{- end -}}

{{- define  "aggregation-manager.mqttExtAddr" -}}
    {{- printf .Values.hostIp }}
{{- end -}}