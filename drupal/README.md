# drupal

![Version: 0.14.0](https://img.shields.io/badge/Version-0.14.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.2.0](https://img.shields.io/badge/AppVersion-4.2.0-informational?style=flat-square)

Drupal 9 variant of the Web Experience Toolkit (WxT).

**Homepage:** <http://www.drupal.org/project/wxt>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| sylus | william.hearn@canada.ca |  |
| zachomedia | zachary.seguin@canada.ca |  |

## Source Code

* <https://github.com/drupalwxt/wxt>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 8.6.4 |
| https://charts.bitnami.com/bitnami | redis | 15.7.4 |
| https://charts.helm.sh/stable | mysql | 1.6.2 |
| https://statcan.github.io/charts | varnish | 0.2.2 |

## Prerequisites

- Kubernetes 1.7+
- Helm v3.0.0+

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
cp values-azurefile.yaml values-override.yaml
helm install --name drupal -f values-override.yaml
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
| drupal.backup.enabled | bool | `false` |  |
| drupal.backup.filesArgs | string | `""` |  |
| drupal.backup.privateArgs | string | `""` |  |
| drupal.backup.schedule | string | `"0 0 * * *"` |  |
| drupal.backup.sqlDumpArgs | string | `""` |  |
| drupal.backup.volume | object | `{}` |  |
| drupal.cacheRebuildBeforeDatabaseMigration | bool | `true` |  |
| drupal.configSplit.enabled | bool | `false` |  |
| drupal.cron.enabled | bool | `true` |  |
| drupal.cron.schedule | string | `"0 * * * *"` |  |
| drupal.disableDefaultFilesMount | bool | `false` |  |
| drupal.extensions.enabled | bool | `false` |  |
| drupal.extraInstallScripts | string | `""` |  |
| drupal.extraSettings | string | `""` |  |
| drupal.extraUpgradeScripts | string | `""` |  |
| drupal.healthcheck.enabled | bool | `true` |  |
| drupal.image | string | `"drupalwxt/site-wxt"` |  |
| drupal.imagePullPolicy | string | `"IfNotPresent"` |  |
| drupal.install | bool | `true` |  |
| drupal.lightningUpdate | bool | `true` |  |
| drupal.migrate | bool | `true` |  |
| drupal.nodeSelector | object | `{}` |  |
| drupal.persistence.accessMode | string | `"ReadWriteOnce"` |  |
| drupal.persistence.annotations | object | `{}` |  |
| drupal.persistence.enabled | bool | `false` |  |
| drupal.persistence.size | string | `"8Gi"` |  |
| drupal.php.ini | object | `{}` |  |
| drupal.podAnnotations | object | `{}` |  |
| drupal.profile | string | `"wxt"` |  |
| drupal.reconfigure | bool | `true` |  |
| drupal.replicas | int | `1` |  |
| drupal.resources | object | `{}` |  |
| drupal.restore.convert | bool | `false` |  |
| drupal.restore.db | bool | `true` |  |
| drupal.restore.enabled | bool | `false` |  |
| drupal.restore.files | bool | `false` |  |
| drupal.restore.name | string | `"latest"` |  |
| drupal.restore.volume | object | `{}` |  |
| drupal.securityContext.fsGroup | int | `82` |  |
| drupal.securityContext.runAsGroup | int | `82` |  |
| drupal.securityContext.runAsUser | int | `82` |  |
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
| drupal.tolerations | list | `[]` |  |
| drupal.username | string | `"admin"` |  |
| drupal.version | string | `"d9"` |  |
| drupal.volumeMounts | string | `nil` |  |
| drupal.volumePermissions.enabled | bool | `false` |  |
| drupal.volumes | string | `nil` |  |
| drupal.wxtTheme | string | `"theme-gcweb"` |  |

## Nginx

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nginx.client_max_body_size | string | `"20m"` |  |
| nginx.customLocations | string | `""` |  |
| nginx.image | string | `"drupalwxt/site-wxt"` |  |
| nginx.imagePullPolicy | string | `"IfNotPresent"` |  |
| nginx.nodeSelector | object | `{}` |  |
| nginx.persistence.accessMode | string | `"ReadWriteOnce"` |  |
| nginx.persistence.annotations | object | `{}` |  |
| nginx.persistence.enabled | bool | `false` |  |
| nginx.persistence.size | string | `"8Gi"` |  |
| nginx.real_ip_header | string | `"X-Forwarded-For"` |  |
| nginx.replicas | int | `1` |  |
| nginx.resolver | string | `"kube-dns.kube-system.svc.cluster.local"` |  |
| nginx.securityContext.enabled | bool | `true` |  |
| nginx.securityContext.fsGroup | int | `33` |  |
| nginx.serviceType | string | `"ClusterIP"` |  |
| nginx.tolerations | list | `[]` |  |
| nginx.volumeMounts | string | `nil` |  |
| nginx.volumes | string | `nil` |  |

## MySQL

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| mysql.configurationFiles."mysql.cnf" | string | `"[mysqld]\nmax_allowed_packet = 256M\ninnodb_buffer_pool_size = 4096M\ninnodb_buffer_pool_instances = 4\ntable_definition_cache = 4096\ntable_open_cache = 8192\ninnodb_flush_log_at_trx_commit=2"` |  |
| mysql.enabled | bool | `true` |  |
| mysql.imageTag | string | `"5.7.28"` |  |
| mysql.mysqlDatabase | string | `"wxt"` |  |
| mysql.mysqlUser | string | `"wxt"` |  |
| mysql.nodeSelector | object | `{}` |  |
| mysql.persistence.enabled | bool | `true` |  |
| mysql.persistence.size | string | `"128Gi"` |  |
| mysql.tolerations | list | `[]` |  |

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
| postgresql.enabled | bool | `false` |  |
| postgresql.image.tag | string | `"11.6.0-debian-9-r0"` |  |
| postgresql.nodeSelector | object | `{}` |  |
| postgresql.persistence.enabled | bool | `true` |  |
| postgresql.persistence.size | string | `"50Gi"` |  |
| postgresql.postgresqlConfiguration.byteaOutput | string | `"'escape'"` |  |
| postgresql.postgresqlConfiguration.effectiveCacheSize | string | `"512MB"` |  |
| postgresql.postgresqlConfiguration.listenAddresses | string | `"'*'"` |  |
| postgresql.postgresqlConfiguration.maintenanceWorkMem | string | `"32MB"` |  |
| postgresql.postgresqlConfiguration.maxConnections | string | `"200"` |  |
| postgresql.postgresqlConfiguration.maxWalSize | string | `"512MB"` |  |
| postgresql.postgresqlConfiguration.minWalSize | string | `"512MB"` |  |
| postgresql.postgresqlConfiguration.sharedBuffers | string | `"512MB"` |  |
| postgresql.postgresqlConfiguration.walBuffers | string | `"8048kB"` |  |
| postgresql.postgresqlConfiguration.workMem | string | `"2048MB"` |  |
| postgresql.postgresqlDatabase | string | `"wxt"` |  |
| postgresql.postgresqlPassword | string | `""` |  |
| postgresql.postgresqlUsername | string | `"wxt"` |  |
| postgresql.resources | object | `{}` |  |
| postgresql.service.port | int | `5432` |  |
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
| azureFile.accessMode | string | `"ReadWriteMany"` |  |
| azureFile.annotations | object | `{}` |  |
| azureFile.enabled | bool | `false` |  |
| azureFile.initMediaIconsFolder | bool | `true` |  |
| azureFile.private.azureFile.readOnly | bool | `false` |  |
| azureFile.private.azureFile.secretName | string | `"drupal-storage"` |  |
| azureFile.private.azureFile.shareName | string | `"drupal-private"` |  |
| azureFile.public.azureFile.readOnly | bool | `false` |  |
| azureFile.public.azureFile.secretName | string | `"drupal-storage"` |  |
| azureFile.public.azureFile.shareName | string | `"drupal-public"` |  |
| azureFile.size | string | `"100Gi"` |  |
| azureFile.storageClass | string | `"azurefile"` |  |

## Shared Disk

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| sharedDisk.accessMode | string | `"ReadWriteMany"` |  |
| sharedDisk.annotations | object | `{}` |  |
| sharedDisk.enabled | bool | `false` |  |
| sharedDisk.initMediaIconsFolder | bool | `true` |  |
| sharedDisk.maxShares | int | `2` |  |
| sharedDisk.private.azureFile.readOnly | bool | `false` |  |
| sharedDisk.private.azureFile.secretName | string | `"drupal-storage"` |  |
| sharedDisk.private.azureFile.shareName | string | `"drupal-private"` |  |
| sharedDisk.size | string | `"256Gi"` |  |

## Redis

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| redis.enabled | bool | `false` |  |
| redis.master.disableCommands | list | `[]` |  |
| redis.master.service.type | string | `"ClusterIP"` |  |
| redis.replica.disableCommands | list | `[]` |  |
| redis.replica.enabled | bool | `true` |  |
| redis.replica.replicaCount | int | `2` |  |
| redis.replica.service.type | string | `"ClusterIP"` |  |
| redis.sentinel.enabled | bool | `false` |  |

## Varnish

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| varnish.affinity | object | `{}` |  |
| varnish.enabled | bool | `false` |  |
| varnish.nodeSelector | object | `{}` |  |
| varnish.resources | object | `{}` |  |
| varnish.service.port | int | `80` |  |
| varnish.service.type | string | `"ClusterIP"` |  |
| varnish.tolerations | list | `[]` |  |
| varnish.varnishConfigContent | string | `"vcl 4.0;\n\nimport std;\nimport directors;\n\nbackend nginx {\n  .host = \"{{ include \"backend.fullname\" . }}-nginx\";\n  .host_header = \"{{ include \"backend.fullname\" . }}-nginx\";\n  .port = \"80\";\n}\n\nsub vcl_init {\n  new backends = directors.round_robin();\n  backends.add_backend(nginx);\n}\n\nsub vcl_recv {\n  set req.http.X-Forwarded-Host = req.http.Host;\n  if (!req.http.X-Forwarded-Proto) {\n    set req.http.X-Forwarded-Proto = \"http\";\n  }\n\n  # Answer healthcheck\n  if (req.url == \"/_healthcheck\" || req.url == \"/healthcheck.txt\") {\n    return (synth(700, \"HEALTHCHECK\"));\n  }\n  set req.backend_hint = backends.backend();\n\n  # Answer healthcheck\n  if (req.url == \"/_healthcheck\" || req.url == \"/healthcheck.txt\") {\n    return (synth(700, \"HEALTHCHECK\"));\n  }\n  set req.backend_hint = backends.backend();\n\n  # Always cache certain file types\n  # Remove cookies that Drupal doesn't care about\n  if (req.url ~ \"(?i)\\.(asc|dat|tgz|png|gif|jpeg|jpg|ico|swf|css|js)(\\?.*)?$\") {\n    unset req.http.Cookie;\n  } else if (req.http.Cookie) {\n    set req.http.Cookie = \";\" + req.http.Cookie;\n    set req.http.Cookie = regsuball(req.http.Cookie, \"; +\", \";\");\n    set req.http.Cookie = regsuball(req.http.Cookie, \";(SESS[a-z0-9]+|SSESS[a-z0-9]+|NO_CACHE)=\", \"; \\1=\");\n    set req.http.Cookie = regsuball(req.http.Cookie, \";[^ ][^;]*\", \"\");\n    set req.http.Cookie = regsuball(req.http.Cookie, \"^[; ]+|[; ]+$\", \"\");\n    if (req.http.Cookie == \"\") {\n        unset req.http.Cookie;\n    } else {\n        return (pass);\n    }\n  }\n  # If POST, PUT or DELETE, then don't cache\n  if (req.method == \"POST\" || req.method == \"PUT\" || req.method == \"DELETE\") {\n    return (pass);\n  }\n  # Happens before we check if we have this in cache already.\n  #\n  # Typically you clean up the request here, removing cookies you don't need,\n  # rewriting the request, etc.\n  return (hash);\n  #return (pass);\n}\n\nsub vcl_backend_fetch {\n  # NEW\n  set bereq.http.Host = \"{{ include \"backend.fullname\" . }}-nginx\";\n\n  # Don't add 127.0.0.1 to X-Forwarded-For\n  set bereq.http.X-Forwarded-For = regsub(bereq.http.X-Forwarded-For, \"(, )?127\\.0\\.0\\.1$\", \"\");\n}\n\nsub vcl_backend_response {\n  if (beresp.http.Location) {\n    set beresp.http.Location = regsub(\n      beresp.http.Location,\n      \"^https?://[^/]+/\",\n      bereq.http.X-Forwarded-Proto + \"://\" + bereq.http.X-Forwarded-Host + \"/\"\n    );\n  }\n  # Only cache select response codes\n  if (beresp.status == 200 || beresp.status == 203 || beresp.status == 204 || beresp.status == 206 || beresp.status == 300 || beresp.status == 301 || beresp.status == 404 || beresp.status == 405 || beresp.status == 410 || beresp.status == 414 || beresp.status == 501) {\n    # Cache for 5 minutes\n    set beresp.ttl = 5m;\n    set beresp.grace = 12h;\n    set beresp.keep = 24h;\n  } else {\n    set beresp.ttl = 0s;\n  }\n}\n\nsub vcl_deliver {\n  # Remove identifying information\n  unset resp.http.Server;\n  unset resp.http.X-Powered-By;\n  unset resp.http.X-Varnish;\n  unset resp.http.Via;\n\n  # Comment these for easier Drupal cache tag debugging in development.\n  unset resp.http.Cache-Tags;\n  unset resp.http.X-Drupal-Cache-Contexts;\n\n  # Add Content-Security-Policy\n  # set resp.http.Content-Security-Policy = \"default-src 'self' *.example.ca *.example.ca; style-src 'self' 'unsafe-inline' *.example.ca https://fonts.googleapis.com; script-src 'self' 'unsafe-inline' 'unsafe-eval' *.example.ca  *.adobedtm.com use.fontawesome.com blob:; connect-src 'self' *.example.ca *.omtrdc.net *.demdex.net *.everesttech.net; img-src 'self' *.example.ca *.omtrdc.net *.demdex.net *.everesttech.net data:; font-src 'self' *.example.ca https://fonts.gstatic.com\";\n\n  # Add CORS Headers\n  # if (req.http.Origin ~ \"(?i)\\.example\\.ca$\") {\n  #   if (req.url ~ \"\\.(ttd|woff|woff2)(\\?.*)?$\") {\n  #     set resp.http.Access-Control-Allow-Origin = \"*\";\n  #     set resp.http.Access-Control-Allow-Methods = \"GET\";\n  #   }\n  # }\n\n  # Add X-Frame-Options\n  if (req.url ~ \"^/livechat\" || req.url ~ \"^/(en/|fr/)?entity-browser/\") {\n    set resp.http.X-Frame-Options = \"SAMEORIGIN\";\n  } else {\n    set resp.http.X-Frame-Options = \"DENY\";\n  }\n\n  set resp.http.X-Content-Type-Options = \"nosniff\";\n  set resp.http.X-XSS-Protection = \"1; mode=block\";\n\n  # Happens when we have all the pieces we need, and are about to send the\n  # response to the client.\n  #\n  # You can do accounting or modifying the final object here.\n  if (obj.hits > 0) {\n    set resp.http.X-Cache = \"HIT\";\n  } else {\n    set resp.http.X-Cache = \"MISS\";\n  }\n  # Handle errors\n  if ( (resp.status >= 500 && resp.status <= 599)\n    || resp.status == 400\n    || resp.status == 401\n    || resp.status == 403\n    || resp.status == 404) {\n    return (synth(resp.status));\n  }\n}\n\nsub vcl_synth {\n  # Remove identifying information\n  unset resp.http.Server;\n  unset resp.http.X-Powered-By;\n  unset resp.http.X-Varnish;\n  unset resp.http.Via;\n\n  # Add Content-Security-Policy\n  # set resp.http.Content-Security-Policy = \"default-src 'self' *.example.ca; style-src 'self' 'unsafe-inline' *.example.ca; script-src 'self' 'unsafe-inline' 'unsafe-eval' *.example.ca *.adobedtm.com use.fontawesome.com blob:; connect-src 'self' *.example.ca *.omtrdc.net *.demdex.net *.everesttech.net; img-src 'self' *.example.ca data:;\";\n  # set resp.http.X-Content-Type-Options = \"nosniff\";\n  # set resp.http.X-Frame-Options = \"DENY\";\n  # set resp.http.X-XSS-Protection = \"1; mode=block\";\n\n  # if (resp.status >= 500 && resp.status <= 599) {\n  #   set resp.http.Content-Type = \"text/html; charset=utf-8\";\n  #   synthetic(std.fileread(\"/data/configuration/varnish/errors/503.html\"));\n  #   return (deliver);\n  # } elseif (resp.status == 400) { # 400 - Bad Request\n  #   set resp.http.Content-Type = \"text/html; charset=utf-8\";\n  #   synthetic(std.fileread(\"/data/configuration/varnish/errors/400.html\"));\n  #   return (deliver);\n  # } elseif (resp.status == 401) { # 401 - Unauthorized\n  #   set resp.http.Content-Type = \"text/html; charset=utf-8\";\n  #   synthetic(std.fileread(\"/data/configuration/varnish/errors/401.html\"));\n  #   return (deliver);\n  # } elseif (resp.status == 403) { # 403 - Forbidden\n  #   set resp.http.Content-Type = \"text/html; charset=utf-8\";\n  #   synthetic(std.fileread(\"/data/configuration/varnish/errors/403.html\"));\n  #   return (deliver);\n  # } elseif (resp.status == 404) { # 404 - Not Found\n  #   set resp.http.Content-Type = \"text/html; charset=utf-8\";\n  #   synthetic(std.fileread(\"/data/configuration/varnish/errors/404.html\"));\n  #   return (deliver);\n  # } else\n  if (resp.status == 700) { # Respond to healthcheck\n    set resp.status = 200;\n    set resp.http.Content-Type = \"text/plain\";\n    synthetic ( {\"OK\"} );\n    return (deliver);\n  }\n}\n\n##\n# ERROR HANDLING\n##\n# sub vcl_backend_error {\n#   set beresp.http.Content-Type = \"text/html; charset=utf-8\";\n#   synthetic(std.fileread(\"/data/configuration/varnish/errors/503.html\"));\n#   return (deliver);\n# }\n"` |  |
| varnish.varnishd.image | string | `"varnish"` |  |
| varnish.varnishd.imagePullPolicy | string | `"IfNotPresent"` |  |
| varnish.varnishd.tag | string | `"6.5.1"` |  |

<!-- Links Referenced -->

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.6.0](https://github.com/norwoodj/helm-docs/releases/v1.6.0)
