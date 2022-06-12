## 0.18.x

- Switch to Bitnami's MySQL Helm Chart

> In general you should only be using the containerized database installs
> for testing and development and should be using a managed db solution.
>
> However if you were using a containerized installation this is a
> breaking change and you will need to backup your database and then
> restore it into the newly created database.

- Updated Bitnami's PostgreSQL Helm Chart

## 0.16.x

- WxT update scripts are now guarded and opt-in

> If you want to similar behavior to earlier releases where WxT updates
> are automatically run for you simply set the following.

```sh
drupal:
  lightningUpdate: true
  wxtUpdate: true
```

## 0.15.x

- Add functionality to disable volume name

## 0.14.x

- Upgrade Redis subchart to 15.7.4

> If you receive an error failing to update the `master` statefulset, run:
> `kubectl delete statefulset $release-redis-master` to remove it
> and then re-run your `helm upgrade` command.
>
> Also note that the replicas have been renamed
> from `slave` to `replicas`, and therefore
> new Redis disks will be provisioned. You may
> wish to delete the old ones after the upgrade.

## 0.12.x

- Updated extension logic, which requires WxT 4.0.7 or newer

## 0.11.x

- Added Redis sentinel
- Remove MinIO

## 0.8.x

- Added support for ProxySQL
- Added support for PGBouncer
- Updated Architectural Diagram
- Added custom mount options support for Azure Files
- Added custom php.ini mount

## 0.7.x

- Added support for Azure Shared Disk
- Added Redis integration
- Added Varnish integration

## 0.6.x

- Disabled MinIO installation default
- Default installation will set theme to GCWeb variant and provide default content
- Default installation will need to be customized by end-user for stateful assets to work
- Provided example of how to use Kind for local development
