{{- define  "DomainManager.user-manager.image" -}}
    {{- $registryName := .Values.ums.image.registry | default "" -}}
    {{- $repositoryName := .Values.ums.image.repository -}}
    {{- $tag := .Values.ums.image.tag | default .Chart.AppVersion | toString -}}
    {{- printf "%s%s:%s" $registryName $repositoryName  $tag -}}
{{- end -}}

{{- define  "DomainManager.user-manager.configName" -}}
    {{- $fullName :=  include "DomainManager.user-manager.fullname" . -}}
    {{- printf "%s-cfg" $fullName }}
{{- end -}}

{{- define  "DomainManager.user-manager.port" -}}
    {{- printf "8080" }}
{{- end -}}

{{- define  "DomainManager.user-manager.clientId" -}}
   {{- printf "xr-web-client" }}
{{- end -}}

{{- define  "DomainManager.user-manager.clientSecret" -}}
   {{- printf "xr-web-client" }}
{{- end -}}

{{- define  "DomainManager.user-manager.issuerAlias" -}}
   {{- join "," .Values.global.keycloak.hosts -}}
{{- end -}}

{{- define  "DomainManager.user-manager.hasAuthPrefix" -}}
   {{- printf "false" }}
{{- end -}}

