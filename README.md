Helm Chart: Drupal
==================

A [Helm chart](https://helm.sh/) for [Drupal WxT](http://drupalwxt.org/).

These are the instructions for leveraging Helm (Kubernetes package manager) to set up Drupal and its environment.

You can use this chart to build a local development environment or a cloud native implementation.

## Installation

1. Ensure you have a running Kubernetes cluster. You can also test locally with with a variety of tooling.

* Docker Mac / Windows
* [Kind][kind]

2. Git clone the helm chart and select the appropriate values file as your template.

```sh
git clone https://github.com/drupalwxt/helm-drupal
cd helm-drupal/drupal
cp values-nfs-azurefile.yaml values-override.yaml
```

> **Note**: Currently the default install using the `values.yaml` file alone results in a Drupal installation that stateful assets won't work and caching is disabled. If you want stateful assets to work you can either enable MinIO or more preferably set the disableDefaultFilesMount to true and perform the mappings based on your local development environment. You can consult the `values-hostpath-kind.yaml` or `values-hostpath-microk8s.yaml` file for further examples.

> **Note**: It is recommended that if you are installing this in a cloud environment that you use a shared file system provided by the environment you are running in for the stateful assets. An example for Azure is provided by using the `values-nfs-azurefile.yaml` as your override file which will allow for stateful assets to work across the nginx and php-fpm containers by using Azure Files (NFS). If you are using other Cloud Providers they will have similar offerings and the CSI driver will be different then `azureFile`.

3. Run the following command:

```sh
helm install drupal -f values-override.yaml --timeout 2400 --wait .
```

> **Note**: If you have `drupal.install` set to `true`, then a site install will take place before the `helm install` command finishes. The default timeout is `300` seconds (or 5 minutes) of which depending on your IOPS the install could take longer.

> **Note**: The default installation with set the active them to the GCWeb variant and default content will also be installed. You can configure either of these settings in your own values-override.yaml file.

4. Follow the steps presented to you once the helm install is completed.

> **Note**: If you are working locally with Kind etc you might not have an ingress setup. In these situations you can simply use port-forward to access the service.

```
kubectl port-forward -n default svc/drupal-nginx 5000:80
```

## Documentation

Please consult the [documentation](https://github.com/drupalwxt/helm-drupal/tree/master/docs) which is provided in this repository in the `docs` folder should you wish to have more information about a recommended architecture.

<!-- Links Referenced -->

[kind]:               https://kind.sigs.k8s.io/
