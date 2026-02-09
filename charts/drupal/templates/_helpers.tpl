{{/* vim: set filetype=mustache: */}}

{{/*
Renders a value that contains template.
Usage:
{{ include "common.tplvalues.render" ( dict "value" .Values.path.to.the.Value "context" $) }}
*/}}
{{- define "common.tplvalues.render" -}}
{{- if typeIs "string" .value }}
  {{- tpl .value .context }}
{{- else }}
  {{- tpl (.value | toYaml) .context }}
{{- end }}
{{- end -}}

{{/*
Expand the name of the chart.
*/}}
{{- define "drupal.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "drupal.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "backend.fullname" -}}
{{- $name := default "drupal" .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "drupal.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "drupal.serviceAccountName" -}}
{{- if .Values.drupal.serviceAccount.create }}
{{- default (include "drupal.fullname" .) .Values.drupal.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.drupal.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create common environment variables for Drupal
*/}}
{{- define "drupal.env" -}}
{{- if .Values.external.enabled }}
- name: EXTERNAL_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ template "drupal.fullname" . }}
      key: databasePassword
{{- else if and .Values.mysql.enabled }}
- name: MYSQL_PASSWORD
  valueFrom:
    secretKeyRef:
      name: "{{ .Release.Name }}-mysql"
      key: mysql-password
{{- else if .Values.postgresql.enabled }}
- name: POSTGRES_PASSWORD
  valueFrom:
    secretKeyRef:
      name: "{{ .Release.Name }}-postgresql"
      key: password
{{- end }}
{{- if .Values.redis.enabled }}
- name: REDIS_PASSWORD
  valueFrom:
    secretKeyRef:
      name: "{{ .Release.Name }}-redis-auth"
      key: default-password
{{- end }}
{{- if not .Values.drupal.usePasswordFiles }}
- name: DRUPAL_ADMIN_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "drupal.fullname" . }}
      key: password
{{- end }}
{{- end -}}

{{/*
Create initContainers for Drupal
*/}}
{{- define "drupal.initContainers" -}}
{{- if .Values.drupal.volumePermissions.enabled }}
- name: set-volume-permissions
  image: 'alpine:3.10'
  command:
    - chown
    - '-R'
    - '84:84'
    - /files/public
    - /files/private
  volumeMounts:
    - name: files-public
      mountPath: /files/public
    - name: files-private
      mountPath: /files/private
  securityContext:
    runAsUser: 0
{{- end }}
{{- if .Values.azure.sharedDisk.enabled }}
- name: init-chown
  image: 'alpine:3.10'
  command:
    - chown
    - '-R'
    - '82:82'
    - /mnt/azure
  volumeMounts:
    - name: files-public
      mountPath: /mnt/azure
{{- end }}
{{- if or (and .Values.azure.azureFile.enabled .Values.azure.azureFile.initMediaIconsFolder) (and .Values.azure.sharedDisk.enabled .Values.azure.sharedDisk.initMediaIconsFolder) }}
- name: init-media-icons-folder
  image: 'alpine:3.10'
  command:
    - mkdir
    - '-p'
    - /files/media-icons/generic
  volumeMounts:
    - name: files-public
      mountPath: /files
{{- end }}
{{- if not (eq .Values.drupal.siteRoot "/") }}
- name: init-site-root
  image: 'alpine:3.10'
  command:
    - /bin/sh
    - '-c'
    - |
      mkdir -p "/webroot$(dirname "{{ .Values.drupal.siteRoot }}")"
      ln -s /var/www/html "/webroot{{ .Values.drupal.siteRoot }}"
  volumeMounts:
    - name: webroot
      mountPath: /webroot
{{- end }}
{{- if .Values.drupal.initContainers }}
{{- toYaml .Values.drupal.initContainers }}
{{- end }}
{{- end -}}

{{/*
Create common volume mounts for Drupal
*/}}
{{- define "drupal.volumeMounts" -}}
- name: cm-drupal
  readOnly: true
  mountPath: /usr/local/etc/php/php.ini
  subPath: php.ini
- name: cm-drupal
  readOnly: true
  mountPath: /usr/local/etc/php/conf.d/opcache-recommended.ini
  subPath: opcache-recommended.ini
- name: cm-drupal
  readOnly: true
  mountPath: /usr/local/etc/php-fpm.d/www.conf
  subPath: www.conf
- name: cm-drupal
  mountPath: /var/www/html/sites/default/settings.php
  subPath: settings.php
  readOnly: true
- name: cm-drupal
  mountPath: /var/www/html/sites/default/extra.settings.php
  subPath: extra.settings.php
  readOnly: true
- name: cm-drupal
  mountPath: /var/www/html/sites/default/services.yml
  subPath: services.yml
  readOnly: true
- name: ssmtp
  mountPath: /etc/ssmtp/ssmtp.conf
  subPath: ssmtp.conf
  readOnly: true
- name: twig-cache
  mountPath: /cache/twig
{{- if not .Values.drupal.disableDefaultFilesMount }}
- name: files
  mountPath: /var/www/html/sites/default/files
  subPath: public
- name: files
  mountPath: /private
  subPath: private
{{- end }}
{{- if not (eq .Values.drupal.siteRoot "/") }}
- name: webroot
  mountPath: /webroot
{{- end }}
{{- end -}}

{{/*
Create common volumes for Drupal
*/}}
{{- define "drupal.volumes" -}}
{{- $fullName := include "drupal.fullname" . -}}
- name: cm-drupal
  configMap:
    name: {{ $fullName }}
- name: ssmtp
  secret:
    secretName: {{ $fullName }}-ssmtp
    items:
      - key: ssmtp.conf
        path: ssmtp.conf
- name: twig-cache
  emptyDir: {}
{{- if .Values.drupal.persistence.enabled }}
- name: files
  persistentVolumeClaim:
    claimName: {{ $fullName }}-drupal
{{- else if or (.Values.azure.azureFile.enabled) (.Values.azure.sharedDisk.enabled) }}
- name: files-public
  persistentVolumeClaim:
    claimName: {{ $fullName }}-public
- name: files-private
  persistentVolumeClaim:
    claimName: {{ $fullName }}-private
{{- else if not .Values.drupal.disableDefaultFilesMount }}
- name: files
  emptyDir: {}
{{- end }}
{{- if not (eq .Values.drupal.siteRoot "/") }}
- name: webroot
  emptyDir: {}
{{- end }}
{{- if .Values.drupal.volumes }}
{{ toYaml .Values.drupal.volumes }}
{{- end }}
{{- end -}}

{{/*
Create connection pooler for Drupal
*/}}
{{- define "drupal.connectionPooler" -}}
{{- if .Values.proxysql.enabled }}
- name: proxysql
  image: proxysql/proxysql:2.1.0
  imagePullPolicy: Always
  ports:
    - containerPort: 6032
    - containerPort: 6033
  volumeMounts:
    - name: configfiles
      mountPath: "/etc/proxysql"
      readOnly: true
  livenessProbe:
    tcpSocket:
      port: 6032
    periodSeconds: 60
  command: ["/usr/bin/proxysql", "--initial", "-f", "-c", "/etc/proxysql/proxysql.conf"]
  securityContext:
    allowPrivilegeEscalation: false
    runAsUser: 0
    runAsGroup: 999
{{- else if .Values.pgbouncer.enabled }}
- name: pgbouncer
  image: mcr.microsoft.com/azure-oss-db-tools/pgbouncer-sidecar:latest
  imagePullPolicy: Always
  ports:
    - containerPort: 5432
  volumeMounts:
    - name: configfiles
      mountPath: "/etc/pgbouncer"
      readOnly: true
  livenessProbe:
    tcpSocket:
      port: 5432
    periodSeconds: 60
  lifecycle:
    preStop:
      exec:
        command: ["/bin/sh", "-c", "killall -INT pgbouncer && sleep 120"]
  securityContext:
    allowPrivilegeEscalation: false
    capabilities:
      drop: ['all']
{{- end  }}
{{- end -}}

{{/*
Create connection pooler for Drupal
*/}}
{{- define "drupal.connectionPooler.volumes" -}}
{{- $fullName := include "drupal.fullname" . -}}
{{- if .Values.proxysql.enabled }}
- name: configfiles
  secret:
    secretName: {{ $fullName }}-proxysql
{{- else if .Values.pgbouncer.enabled }}
- name: configfiles
  secret:
    secretName: {{ $fullName }}-pgbouncer
{{- end }}
{{- end -}}
