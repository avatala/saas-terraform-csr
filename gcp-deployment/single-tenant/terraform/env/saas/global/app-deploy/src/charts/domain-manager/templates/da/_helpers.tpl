{{- define  "DomainManager.device-aggregator.image" -}}
    {{- $registryName := .Values.da.image.registry | default "" -}}
    {{- $repositoryName := .Values.da.image.repository -}}
    {{- $tag := .Values.da.image.tag | default .Chart.AppVersion | toString -}}
    {{- printf "%s%s:%s" $registryName $repositoryName  $tag -}}
{{- end -}}

{{- define  "DomainManager.device-aggregator.configName" -}}
    {{- $fullName :=  include "DomainManager.device-aggregator.fullname" . -}}
    {{- printf "%s-cfg" $fullName }}
{{- end -}}

{{- define  "DomainManager.device-aggregator.port" -}}
    {{- printf "8080" }}
{{- end -}}

{{- define  "DomainManager.device-aggregator.dataCertsDir" -}}
    {{- printf "/data/certs" }}
{{- end -}}

{{- define  "DomainManager.device-aggregator.dataFileCAPool" -}}
    {{- $CertsDir :=  include "DomainManager.device-aggregator.dataCertsDir" . -}}
    {{- $fileName :=  "ca.crt" }}
    {{- printf "%s/%s" $CertsDir $fileName }}
{{- end -}}

{{- define  "DomainManager.device-aggregator.internalCertsDir" -}}
    {{- $CertsDir :=  include "DomainManager.device-aggregator.dataCertsDir" . -}}
    {{- $internal :=  "internal" }}
    {{- printf "%s/%s" $CertsDir $internal }}
{{- end -}}

{{- define  "DomainManager.device-aggregator.internalKeyFile" -}}
    {{- $internalDir :=  include "DomainManager.device-aggregator.dataCertsDir" . -}}
    {{- printf "%s/tls.key" $internalDir }}
{{- end -}}

{{- define  "DomainManager.device-aggregator.internalCertFile" -}}
   {{- $internalDir :=  include "DomainManager.device-aggregator.dataCertsDir" . -}}
    {{- printf "%s/tls.crt" $internalDir }}
{{- end -}}

{{- define  "plgd.oauth" -}}
   {{- printf "%s.%s.svc.%s:9100" $.Values.service_oauth $.Values.namespace_am $.Values.cluster.dns }}
{{- end -}}