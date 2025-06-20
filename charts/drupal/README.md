# drupal

![Version: 1.0.0-beta15](https://img.shields.io/badge/Version-1.0.0--beta15-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 6.1.0](https://img.shields.io/badge/AppVersion-6.1.0-informational?style=flat-square)

Helm Chart for deploying an enterprise-grade Drupal environment.

**Homepage:** <http://www.drupal.org/project/drupal>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| sylus | <william.hearn@canada.ca> |  |
| zachomedia | <zachary.seguin@canada.ca> |  |

## Source Code

* <https://github.com/drupalwxt/helm-drupal>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mysql | 9.1.7 |
| https://charts.bitnami.com/bitnami | postgresql | 11.6.6 |
| https://charts.bitnami.com/bitnami | redis | 16.13.2 |
| https://charts.bitnami.com/bitnami | solr | 7.5.1 |
| https://drupalwxt.github.io/helm-drupal | varnish | 0.2.5 |

## Prerequisites

- Kubernetes 1.21+
- Helm v3.10.0+

## Installing the Chart

To install the chart with the release name `my-release`:

```sh
helm repo add drupalwxt https://drupalwxt.github.io/helm-drupal
"drupalwxt" has been added to your repositories

helm install my-release drupalwxt/drupal
NAME: my-release
```

Optionally you can git clone the helm chart and select the appropriate values file:

```sh
git clone https://github.com/drupalwxt/helm-drupal
cd helm-drupal/drupal
helm install --name drupal -f values-<override>.yaml
```

## Ingress

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `"chart-example.local"` |  |
| ingress.path | string | `"/"` |  |
| ingress.tls | list | `[]` |  |

## Drupal

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| drupal.additionalCrons | object | `{}` |  |
| drupal.args | list | `[]` |  |
| drupal.autoscaling.enabled | bool | `false` |  |
| drupal.autoscaling.maxReplicas | int | `11` |  |
| drupal.autoscaling.minReplicas | int | `1` |  |
| drupal.autoscaling.targetCPUUtilizationPercentage | int | `50` |  |
| drupal.autoscaling.targetMemoryUtilizationPercentage | int | `50` |  |
| drupal.backup.cleanup.enabled | bool | `false` |  |
| drupal.backup.enabled | bool | `false` |  |
| drupal.backup.filesArgs | string | `""` |  |
| drupal.backup.persistence.accessMode | string | `"ReadWriteOnce"` |  |
| drupal.backup.persistence.annotations | object | `{}` |  |
| drupal.backup.persistence.enabled | bool | `false` |  |
| drupal.backup.persistence.size | string | `"8Gi"` |  |
| drupal.backup.privateArgs | string | `""` |  |
| drupal.backup.schedule | string | `"0 0 * * *"` |  |
| drupal.backup.sqlDumpArgs | string | `""` |  |
| drupal.backup.volume | object | `{}` |  |
| drupal.cacheRebuildBeforeDatabaseMigration | bool | `true` |  |
| drupal.command | list | `[]` |  |
| drupal.configSplit.enabled | bool | `false` |  |
| drupal.configSync.directory | string | `"/private/config/sync"` |  |
| drupal.cron.enabled | bool | `true` |  |
| drupal.cron.failedJobsHistoryLimit | int | `1` |  |
| drupal.cron.preInstallScripts | string | `""` |  |
| drupal.cron.schedule | string | `"0 * * * *"` |  |
| drupal.cron.successfulJobsHistoryLimit | int | `3` |  |
| drupal.dbAvailabilityScript | string | `"until drush sql:query 'SHOW TABLES;'; do echo Waiting for DB; sleep 3; done\necho DB available"` | default script used to detect when the DB is ready |
| drupal.disableDefaultFilesMount | bool | `false` |  |
| drupal.extensions.enabled | bool | `true` |  |
| drupal.extraSettings | string | `""` |  |
| drupal.healthcheck.enabled | bool | `true` |  |
| drupal.healthcheck.probes.livenessProbe.exec.command[0] | string | `"php-fpm-healthcheck"` |  |
| drupal.healthcheck.probes.livenessProbe.failureThreshold | int | `3` |  |
| drupal.healthcheck.probes.livenessProbe.initialDelaySeconds | int | `1` |  |
| drupal.healthcheck.probes.livenessProbe.periodSeconds | int | `5` |  |
| drupal.healthcheck.probes.livenessProbe.successThreshold | int | `1` |  |
| drupal.healthcheck.probes.livenessProbe.timeoutSeconds | int | `1` |  |
| drupal.healthcheck.probes.readinessProbe.exec.command[0] | string | `"php-fpm-healthcheck"` |  |
| drupal.healthcheck.probes.readinessProbe.failureThreshold | int | `3` |  |
| drupal.healthcheck.probes.readinessProbe.initialDelaySeconds | int | `1` |  |
| drupal.healthcheck.probes.readinessProbe.periodSeconds | int | `5` |  |
| drupal.healthcheck.probes.readinessProbe.successThreshold | int | `1` |  |
| drupal.healthcheck.probes.readinessProbe.timeoutSeconds | int | `1` |  |
| drupal.image | string | `"drupalwxt/site-wxt"` |  |
| drupal.imagePullPolicy | string | `"IfNotPresent"` |  |
| drupal.install | bool | `true` |  |
| drupal.migrate | bool | `true` |  |
| drupal.nodeSelector | object | `{}` |  |
| drupal.persistence.accessMode | string | `"ReadWriteOnce"` |  |
| drupal.persistence.annotations | object | `{}` |  |
| drupal.persistence.enabled | bool | `false` |  |
| drupal.persistence.size | string | `"8Gi"` |  |
| drupal.php.fpm | string | `"pm.max_children = 50\npm.start_servers = 5\npm.min_spare_servers = 5\npm.max_spare_servers = 35"` |  |
| drupal.php.ini | object | `{}` |  |
| drupal.podAnnotations | object | `{}` |  |
| drupal.postInstallScripts | string | `""` |  |
| drupal.postUpgradeScripts | string | `""` |  |
| drupal.preInstallScripts | string | `""` |  |
| drupal.preUpgradeScripts | string | `""` |  |
| drupal.profile | string | `"wxt"` |  |
| drupal.reconfigure | bool | `true` |  |
| drupal.replicas | int | `1` |  |
| drupal.resources | object | `{}` |  |
| drupal.restore.convert | bool | `false` |  |
| drupal.restore.db | bool | `true` |  |
| drupal.restore.enabled | bool | `false` |  |
| drupal.restore.files | bool | `false` |  |
| drupal.restore.name | string | `"latest"` |  |
| drupal.restore.suppressTarErrors | bool | `false` |  |
| drupal.restore.volume | object | `{}` |  |
| drupal.securityContext | object | `{}` |  |
| drupal.serviceAccount.annotations | object | `{}` |  |
| drupal.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| drupal.serviceAccount.create | bool | `true` |  |
| drupal.serviceAccount.name | string | `""` |  |
| drupal.serviceType | string | `"ClusterIP"` |  |
| drupal.services | string | `""` |  |
| drupal.siteEmail | string | `"admin@example.com"` |  |
| drupal.siteName | string | `"Drupal Install Profile (WxT)"` |  |
| drupal.siteRoot | string | `"/"` |  |
| drupal.smtp.auth.enabled | bool | `false` |  |
| drupal.smtp.auth.method | string | `"LOGIN"` |  |
| drupal.smtp.auth.password | string | `""` |  |
| drupal.smtp.auth.user | string | `""` |  |
| drupal.smtp.host | string | `"mail"` |  |
| drupal.smtp.starttls | bool | `true` |  |
| drupal.smtp.tls | bool | `true` |  |
| drupal.theme | string | `"theme-gcweb"` |  |
| drupal.tolerations | list | `[]` |  |
| drupal.updateDBBeforeDatabaseMigration | bool | `true` |  |
| drupal.username | string | `"admin"` |  |
| drupal.version | string | `"d10"` |  |
| drupal.volumeMounts | string | `nil` |  |
| drupal.volumePermissions.enabled | bool | `false` |  |
| drupal.volumes | string | `nil` |  |

## Nginx

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nginx.autoscaling.enabled | bool | `false` |  |
| nginx.autoscaling.maxReplicas | int | `11` |  |
| nginx.autoscaling.minReplicas | int | `1` |  |
| nginx.autoscaling.targetCPUUtilizationPercentage | int | `50` |  |
| nginx.autoscaling.targetMemoryUtilizationPercentage | int | `50` |  |
| nginx.client_max_body_size | string | `"20m"` |  |
| nginx.customLocations | string | `""` |  |
| nginx.gzip | bool | `true` |  |
| nginx.healthcheck.enabled | bool | `true` |  |
| nginx.healthcheck.livenessProbe.failureThreshold | int | `3` |  |
| nginx.healthcheck.livenessProbe.httpGet.path | string | `"/_healthz"` |  |
| nginx.healthcheck.livenessProbe.httpGet.port | int | `8080` |  |
| nginx.healthcheck.livenessProbe.initialDelaySeconds | int | `1` |  |
| nginx.healthcheck.livenessProbe.periodSeconds | int | `5` |  |
| nginx.healthcheck.livenessProbe.successThreshold | int | `1` |  |
| nginx.healthcheck.livenessProbe.timeoutSeconds | int | `1` |  |
| nginx.healthcheck.readinessProbe.failureThreshold | int | `3` |  |
| nginx.healthcheck.readinessProbe.httpGet.path | string | `"/_healthz"` |  |
| nginx.healthcheck.readinessProbe.httpGet.port | int | `8080` |  |
| nginx.healthcheck.readinessProbe.initialDelaySeconds | int | `1` |  |
| nginx.healthcheck.readinessProbe.periodSeconds | int | `5` |  |
| nginx.healthcheck.readinessProbe.successThreshold | int | `1` |  |
| nginx.healthcheck.readinessProbe.timeoutSeconds | int | `1` |  |
| nginx.image | string | `"drupalwxt/site-wxt"` |  |
| nginx.imagePullPolicy | string | `"IfNotPresent"` |  |
| nginx.nodeSelector | object | `{}` |  |
| nginx.real_ip_header | string | `"X-Forwarded-For"` |  |
| nginx.replicas | int | `1` |  |
| nginx.resolver | string | `"kube-dns.kube-system.svc.cluster.local"` |  |
| nginx.resources | object | `{}` |  |
| nginx.securityContext | object | `{}` |  |
| nginx.serviceType | string | `"ClusterIP"` |  |
| nginx.tolerations | list | `[]` |  |
| nginx.volumeMounts | string | `nil` |  |
| nginx.volumes | string | `nil` |  |

## MySQL

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| mysql.auth.database | string | `"wxt"` |  |
| mysql.auth.password | string | `""` |  |
| mysql.auth.rootPassword | string | `""` |  |
| mysql.auth.username | string | `"wxt"` |  |
| mysql.enabled | bool | `true` |  |
| mysql.image.tag | string | `"8.0.29-debian-11-r3"` |  |
| mysql.primary.configuration | string | `"[mysqld]\ndefault_authentication_plugin=mysql_native_password\nskip-name-resolve\nexplicit_defaults_for_timestamp\nbasedir=/opt/bitnami/mysql\nplugin_dir=/opt/bitnami/mysql/lib/plugin\nport=3306\nsocket=/opt/bitnami/mysql/tmp/mysql.sock\ndatadir=/bitnami/mysql/data\ntmpdir=/opt/bitnami/mysql/tmp\nmax_allowed_packet=16M\nbind-address=0.0.0.0\npid-file=/opt/bitnami/mysql/tmp/mysqld.pid\nlog-error=/opt/bitnami/mysql/logs/mysqld.log\ncharacter-set-server=UTF8\ncollation-server=utf8_general_ci\nslow_query_log=0\nslow_query_log_file=/opt/bitnami/mysql/logs/mysqld.log\nlong_query_time=10.0\ntransaction_isolation=\"READ-COMMITTED\"\n\nmax_allowed_packet = 256M\ninnodb_buffer_pool_size = 4096M\ninnodb_buffer_pool_instances = 4\ntable_definition_cache = 4096\ntable_open_cache = 8192\ninnodb_flush_log_at_trx_commit=2\n\n[client]\nport=3306\nsocket=/opt/bitnami/mysql/tmp/mysql.sock\ndefault-character-set=UTF8\nplugin_dir=/opt/bitnami/mysql/lib/plugin\n\n[manager]\nport=3306\nsocket=/opt/bitnami/mysql/tmp/mysql.sock\npid-file=/opt/bitnami/mysql/tmp/mysqld.pid"` |  |
| mysql.primary.persistence.enabled | bool | `true` |  |
| mysql.primary.persistence.size | string | `"128Gi"` |  |
| mysql.volumePermissions.enabled | bool | `true` |  |

### ProxySQL

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| proxysql.admin.password | string | `"password"` |  |
| proxysql.admin.user | string | `"username@hostname"` |  |
| proxysql.configuration.maxConnections | int | `2048` |  |
| proxysql.configuration.serverVersion | string | `"5.7.28"` |  |
| proxysql.configuration.stackSize | int | `1048576` |  |
| proxysql.enabled | bool | `false` |  |
| proxysql.monitor.password | string | `"password"` |  |
| proxysql.monitor.user | string | `"username@hostname"` |  |

## PostgreSQL

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| postgresql.auth.database | string | `"wxt"` |  |
| postgresql.auth.enablePostgresUser | bool | `true` |  |
| postgresql.auth.password | string | `"example"` |  |
| postgresql.auth.postgresPassword | string | `"example"` |  |
| postgresql.auth.username | string | `"wxt"` |  |
| postgresql.enabled | bool | `false` |  |
| postgresql.image.tag | string | `"14.3.0-debian-11-r3"` |  |
| postgresql.primary.configuration | string | `""` |  |
| postgresql.primary.extendedConfiguration | string | `"listen_addresses='*'\nmax_connections=200\nshared_buffers='512MB'\nwork_mem='2048MB'\neffective_cache_size='512MB'\nmaintenance_work_mem='32MB'\nmin_wal_size='512MB'\nmax_wal_size='512MB'\nbytea_output='escape'"` |  |
| postgresql.primary.persistence.enabled | bool | `true` |  |
| postgresql.primary.persistence.size | string | `"128Gi"` |  |
| postgresql.volumePermissions.enabled | bool | `true` |  |

### PGBouncer

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| pgbouncer.enabled | bool | `false` |  |
| pgbouncer.host | string | `"mypgserver.postgres.database.azure.com"` |  |
| pgbouncer.maxClientConnections | int | `400` |  |
| pgbouncer.password | string | `"password"` |  |
| pgbouncer.poolSize | int | `50` |  |
| pgbouncer.user | string | `"username@hostname"` |  |

## External

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| external.database | string | `"wxt"` |  |
| external.driver | string | `"mysql"` |  |
| external.enabled | bool | `false` |  |
| external.host | string | `"mysql.example.org"` |  |
| external.password | string | `"password"` |  |
| external.port | int | `3306` |  |
| external.user | string | `"wxt"` |  |

## Azure Files

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| azure.azureFile.accessMode | string | `"ReadWriteMany"` |  |
| azure.azureFile.annotations | object | `{}` |  |
| azure.azureFile.backup.spec | object | `{}` |  |
| azure.azureFile.enabled | bool | `false` |  |
| azure.azureFile.folders[0] | string | `"backup"` |  |
| azure.azureFile.folders[1] | string | `"private"` |  |
| azure.azureFile.folders[2] | string | `"public"` |  |
| azure.azureFile.folders[3] | string | `"tmp"` |  |
| azure.azureFile.initMediaIconsFolder | bool | `true` |  |
| azure.azureFile.private.spec | object | `{}` |  |
| azure.azureFile.protocol | string | `"smb"` |  |
| azure.azureFile.public.spec | object | `{}` |  |
| azure.azureFile.size | string | `"256Gi"` |  |
| azure.azureFile.skuName | string | `"Standard_LRS"` |  |
| azure.azureFile.tmp.spec | object | `{}` |  |

## Shared Disk

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| azure.sharedDisk.accessMode | string | `"ReadWriteMany"` |  |
| azure.sharedDisk.annotations | object | `{}` |  |
| azure.sharedDisk.enabled | bool | `false` |  |
| azure.sharedDisk.folders[0] | string | `"private"` |  |
| azure.sharedDisk.folders[1] | string | `"public"` |  |
| azure.sharedDisk.initMediaIconsFolder | bool | `true` |  |
| azure.sharedDisk.maxShares | int | `2` |  |
| azure.sharedDisk.private.spec | object | `{}` |  |
| azure.sharedDisk.public.spec | object | `{}` |  |
| azure.sharedDisk.size | string | `"256Gi"` |  |

## Redis

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| redis.commonConfiguration | string | `"# Disable AOF https://redis.io/topics/persistence#append-only-file\nappendonly no\n# Disable RDB persistence.\nsave \"\""` |  |
| redis.enabled | bool | `false` |  |
| redis.master.disableCommands | list | `[]` |  |
| redis.master.persistence.enabled | bool | `false` |  |
| redis.master.service.type | string | `"ClusterIP"` |  |
| redis.queue.enabled | bool | `true` |  |
| redis.replica.disableCommands | list | `[]` |  |
| redis.replica.enabled | bool | `false` |  |
| redis.replica.persistence.enabled | bool | `false` |  |
| redis.replica.replicaCount | int | `0` |  |
| redis.replica.service.type | string | `"ClusterIP"` |  |
| redis.sentinel.enabled | bool | `false` |  |

## Varnish

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| varnish.affinity | object | `{}` |  |
| varnish.enabled | bool | `false` |  |
| varnish.nodeSelector | object | `{}` |  |
| varnish.resources | object | `{}` |  |
| varnish.service.port | int | `8080` |  |
| varnish.service.type | string | `"ClusterIP"` |  |
| varnish.tolerations | list | `[]` |  |
| varnish.varnishConfigContent | string | `"vcl 4.0;\n\nimport std;\nimport directors;\n\nbackend nginx {\n  .host = \"{{ include \"backend.fullname\" . }}-nginx\";\n  .host_header = \"{{ include \"backend.fullname\" . }}-nginx\";\n  .port = \"8080\";\n}\n\nsub vcl_init {\n  new backends = directors.round_robin();\n  backends.add_backend(nginx);\n}\n\nsub vcl_recv {\n  set req.http.X-Forwarded-Host = req.http.Host;\n  if (!req.http.X-Forwarded-Proto) {\n    set req.http.X-Forwarded-Proto = \"http\";\n  }\n\n  # Answer healthcheck\n  if (req.url == \"/_healthcheck\" || req.url == \"/healthcheck.txt\") {\n    return (synth(700, \"HEALTHCHECK\"));\n  }\n\n  # Answer splashpage\n  # if (req.url == \"/\") {\n  #   return (synth(701, \"SPLASH\"));\n  # }\n\n  set req.backend_hint = backends.backend();\n\n  # Always cache certain file types\n  # Remove cookies that Drupal doesn't care about\n  if (req.url ~ \"(?i)\\.(asc|dat|tgz|png|gif|jpeg|jpg|ico|swf|css|js)(\\?.*)?$\") {\n    unset req.http.Cookie;\n  } else if (req.http.Cookie) {\n    set req.http.Cookie = \";\" + req.http.Cookie;\n    set req.http.Cookie = regsuball(req.http.Cookie, \"; +\", \";\");\n    set req.http.Cookie = regsuball(req.http.Cookie, \";(SESS[a-z0-9]+|SSESS[a-z0-9]+|NO_CACHE)=\", \"; \\1=\");\n    set req.http.Cookie = regsuball(req.http.Cookie, \";[^ ][^;]*\", \"\");\n    set req.http.Cookie = regsuball(req.http.Cookie, \"^[; ]+|[; ]+$\", \"\");\n    if (req.http.Cookie == \"\") {\n        unset req.http.Cookie;\n    } else {\n        return (pass);\n    }\n  }\n  # If POST, PUT or DELETE, then don't cache\n  if (req.method == \"POST\" || req.method == \"PUT\" || req.method == \"DELETE\") {\n    return (pass);\n  }\n  # Happens before we check if we have this in cache already.\n  #\n  # Typically you clean up the request here, removing cookies you don't need,\n  # rewriting the request, etc.\n  return (hash);\n  #return (pass);\n}\n\nsub vcl_backend_fetch {\n  # NEW\n  set bereq.http.Host = \"{{ include \"backend.fullname\" . }}-nginx\";\n\n  # Don't add 127.0.0.1 to X-Forwarded-For\n  set bereq.http.X-Forwarded-For = regsub(bereq.http.X-Forwarded-For, \"(, )?127\\.0\\.0\\.\\d$\", \"\");\n}\n\nsub vcl_backend_response {\n  if (beresp.http.Location && beresp.http.Location !~ \"^https://api.twitter.com/\") {\n    set beresp.http.Location = regsub(\n      beresp.http.Location,\n      \"^https?://[^/]+/\",\n      bereq.http.X-Forwarded-Proto + \"://\" + bereq.http.X-Forwarded-Host + \"/\"\n    );\n  }\n  # Only cache select response codes\n  if (beresp.status == 200 || beresp.status == 203 || beresp.status == 204 || beresp.status == 206 || beresp.status == 300 || beresp.status == 301 || beresp.status == 404 || beresp.status == 405 || beresp.status == 410 || beresp.status == 414 || beresp.status == 501) {\n    # Cache for 5 minutes\n    set beresp.ttl = 5m;\n    set beresp.grace = 12h;\n    set beresp.keep = 24h;\n  } else {\n    set beresp.ttl = 0s;\n  }\n}\n\nsub vcl_deliver {\n  # Remove identifying information\n  unset resp.http.Server;\n  unset resp.http.X-Powered-By;\n  unset resp.http.X-Varnish;\n  unset resp.http.Via;\n\n  # Comment these for easier Drupal cache tag debugging in development.\n  unset resp.http.Cache-Tags;\n  unset resp.http.X-Drupal-Cache-Contexts;\n\n  # Add Content-Security-Policy\n  # set resp.http.Content-Security-Policy = \"default-src 'self' *.example.ca *.example.ca; style-src 'self' 'unsafe-inline' *.example.ca https://fonts.googleapis.com; script-src 'self' 'unsafe-inline' 'unsafe-eval' *.example.ca  *.adobedtm.com use.fontawesome.com blob:; connect-src 'self' *.example.ca *.omtrdc.net *.demdex.net *.everesttech.net; img-src 'self' *.example.ca *.omtrdc.net *.demdex.net *.everesttech.net data:; font-src 'self' *.example.ca https://fonts.gstatic.com\";\n\n  # Add CORS Headers\n  # if (req.http.Origin ~ \"(?i)\\.example\\.ca$\") {\n  #   if (req.url ~ \"\\.(ttd|woff|woff2)(\\?.*)?$\") {\n  #     set resp.http.Access-Control-Allow-Origin = \"*\";\n  #     set resp.http.Access-Control-Allow-Methods = \"GET\";\n  #   }\n  # }\n\n  # Add X-Frame-Options\n  # if (req.url ~ \"^/(en/|fr/)?media/\") {\n  #   set resp.http.X-Frame-Options = \"SAMEORIGIN\";\n  # } else {\n  #   set resp.http.X-Frame-Options = \"DENY\";\n  # }\n\n  set resp.http.X-Content-Type-Options = \"nosniff\";\n  set resp.http.X-XSS-Protection = \"1; mode=block\";\n  set resp.http.Strict-Transport-Security = \"max-age=2629800\";\n\n  if (req.http.host ~ \"site.example.ca\") {\n    set resp.http.X-Robots-Tag = \"noindex, nofollow\";\n  }\n\n  if (req.url ~ \"^/(en/|fr/)?(search/|recherche/)site/\") {\n    set resp.http.X-Robots-Tag = \"noindex, nofollow\";\n  }\n\n  # Happens when we have all the pieces we need, and are about to send the\n  # response to the client.\n  #\n  # You can do accounting or modifying the final object here.\n  if (obj.hits > 0) {\n    set resp.http.X-Cache = \"HIT\";\n  } else {\n    set resp.http.X-Cache = \"MISS\";\n  }\n  # Handle errors\n  if ( (resp.status >= 500 && resp.status <= 599)\n    || resp.status == 400\n    || resp.status == 401\n    || resp.status == 403\n    || resp.status == 404) {\n    return (synth(resp.status));\n  }\n}\n\nsub vcl_synth {\n  # Remove identifying information\n  unset resp.http.Server;\n  unset resp.http.X-Powered-By;\n  unset resp.http.X-Varnish;\n  unset resp.http.Via;\n\n  # Add Content-Security-Policy\n  # set resp.http.Content-Security-Policy = \"default-src 'self' *.example.ca; style-src 'self' 'unsafe-inline' *.example.ca; script-src 'self' 'unsafe-inline' 'unsafe-eval' *.example.ca *.adobedtm.com use.fontawesome.com blob:; connect-src 'self' *.example.ca *.omtrdc.net *.demdex.net *.everesttech.net; img-src 'self' *.example.ca data:;\";\n  # set resp.http.X-Content-Type-Options = \"nosniff\";\n  # set resp.http.X-Frame-Options = \"DENY\";\n  # set resp.http.X-XSS-Protection = \"1; mode=block\";\n\n  set resp.http.Strict-Transport-Security = \"max-age=2629800\";\n\n  # if (resp.status >= 500 && resp.status <= 599) {\n  #   set resp.http.Content-Type = \"text/html; charset=utf-8\";\n  #   synthetic(std.fileread(\"/data/configuration/varnish/errors/503.html\"));\n  #   return (deliver);\n  # } elseif (resp.status == 400) { # 400 - Bad Request\n  #   set resp.http.Content-Type = \"text/html; charset=utf-8\";\n  #   synthetic(std.fileread(\"/data/configuration/varnish/errors/400.html\"));\n  #   return (deliver);\n  # } elseif (resp.status == 401) { # 401 - Unauthorized\n  #   set resp.http.Content-Type = \"text/html; charset=utf-8\";\n  #   synthetic(std.fileread(\"/data/configuration/varnish/errors/401.html\"));\n  #   return (deliver);\n  # } elseif (resp.status == 403) { # 403 - Forbidden\n  #   set resp.http.Content-Type = \"text/html; charset=utf-8\";\n  #   synthetic(std.fileread(\"/data/configuration/varnish/errors/403.html\"));\n  #   return (deliver);\n  # } elseif (resp.status == 404) { # 404 - Not Found\n  #   set resp.http.Content-Type = \"text/html; charset=utf-8\";\n  #   synthetic(std.fileread(\"/data/configuration/varnish/errors/404.html\"));\n  #   return (deliver);\n  # } else\n  if (resp.status == 700) { # Respond to healthcheck\n    set resp.status = 200;\n    set resp.http.Content-Type = \"text/plain\";\n    synthetic ( {\"OK\"} );\n    return (deliver);\n  }\n  # elseif (resp.status == 701) { # Respond to splash\n  #   set resp.status = 200;\n  #   set resp.http.Content-Type = \"text/html\";\n  #   synthetic(std.fileread(\"/splash/index.html\"));\n  #   return (deliver);\n  # }\n}\n\n##\n# ERROR HANDLING\n##\n# sub vcl_backend_error {\n#   set beresp.http.Content-Type = \"text/html; charset=utf-8\";\n#   synthetic(std.fileread(\"/data/configuration/varnish/errors/503.html\"));\n#   return (deliver);\n# }\n"` |  |
| varnish.varnishd.image | string | `"varnish"` |  |
| varnish.varnishd.imagePullPolicy | string | `"IfNotPresent"` |  |
| varnish.varnishd.tag | string | `"6.5.1"` |  |

<!-- Links Referenced -->

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
