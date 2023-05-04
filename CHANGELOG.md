## 0.20.1-beta3

- Enable all of the WxT extension modules for default site install (drupal.extensions.enabled)
- Removed extra `values-<type>.yaml` files
- The `azureFile` and `sharedDisk` spec have been moved to under `azure`
- The storage class has been renamed and is now guarded via the `storageClass.create` flag
- Both public and private sections now have both a `spec` and `mountOptions` spec added to them
- New flag added to both `azureFile` and `sharedDisk` called disablePVCreation
- The following highlights how the new spec looks for both `azureFile` and `sharedDisk` as they are identical

```yaml

azure:
  storageClass:
    create: false

  # Azure File logic
  azureFile:
    enabled: false

    # Uncomment next line if you want to disable specifying a volume name on the public and private PVCs
    # disableVolumeName: true

    # Uncomment next line if you want to disable the manual creation of PV and let the PVC handle it automatically
    # disablePVCreation: true

    initMediaIconsFolder: true

    annotations: {}
    accessMode: ReadWriteMany
    size: 256Gi
    # storageClass: "-"

    public:
      spec: {}
        # azureFile:
        #   secretName: drupal-storage
        #   shareName: drupal-public
        #   secretNamespace: ""
        #   readOnly: false

        # csi:
        #   volumeHandle: ""
        #   volumeAttributes:
        #     resourceGroup: ""
        #     storageAccount: ""
        #     shareName: public
        #     protocol: nfs

      # mountOptions:
      #   - dir_mode=0777
      #   - file_mode=0777
      #   - uid=82
      #   - gid=82
      #   - mfsymlinks
      #   - nobrl
      #   - cache=none
```

> There are breaking changes in this release please use caution and carefully review the changes
>
> In particular please pay attention to the renamed values and the storage class name being changed
> which will cause a delete / re-create to happen.
>
> You are strongly advised to use a command similar to the following to preview your manifests
> ahead of time.

```sh
helm template . -f values-override.yaml --output-dir ../tpl
```

## 0.19.x

- Added HPA's for both Nginx and PHP-FPM
- Made the config_sync_directory configurable

## 0.18.x

- Switch to Bitnami's MySQL Helm Chart

> In general you should only be using the containerized database installs
> for testing and development and should be using a managed db solution.
>
> However if you were using a containerized installation this is a
> breaking change and you will need to backup your database and then
> restore it into the newly created database.
>
> As a result of this change the MySQL chart is now a statefulset and as
> such the PVCs are not cleaned up automatically for you and will need to
> be deleted prior.

- Updated Bitnami's PostgreSQL Helm Chart
- Removed lightningUpdate command
- Fixed missing guard for wxtUpdate
- Upgrade Redis subchart to 16.13.2

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
