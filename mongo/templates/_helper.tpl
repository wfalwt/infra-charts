{{ define "ClusterRoleBindingApiVersion" }}
{{ if .Capabilities.APIVersions.Has "rbac.authorization.k8s.io/v1/ClusterRoleBinding" }}
rbac.authorization.k8s.io/v1
{{ else }}
rbac.authorization.k8s.io/v1beta1
{{ end }}
{{ end }}

{{ define "CronJobApiVersion" }}
{{ if .Capabilities.APIVersions.Has "batch/v1beta1/CronJob" }}
batch/v1beta1
{{ else }}
batch/v1
{{ end }}
{{ end }}