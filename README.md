Helm Chart: Drupal
==================

A [Helm chart](https://helm.sh/) for [Drupal WxT](http://drupalwxt.org/).

These are the instructions for installing Drupal leveraging Helm.

This chart will allow you to setup and configure Drupal alongside with other integrations:

* MySQL configured with ProxySQL
* PostgreSQL configured with PGBouncer
* Redis
* Varnish

Please consult our Architectural Diagram for a recommended setup on Azure:

* [Azure AKS](https://github.com/drupalwxt/helm-drupal/blob/master/docs/azure-aks-infra.pdf)

## Installation

1. Ensure you have a running Kubernetes cluster. You can also test locally with with a variety of tooling.

* Docker Mac / Windows
* [Kind][kind]

2. Add the Helm repository location.

```sh
helm repo add drupalwxt https://drupalwxt.github.io/helm-drupal
```

3. Optionally you can git clone the helm chart and select the appropriate values file as your template.

```sh
git clone https://github.com/drupalwxt/helm-drupal
cd helm-drupal/drupal
cp values-nfs-azurefile.yaml values-override.yaml
```

> **Note**: Currently the default install using the `values.yaml` file alone results in a Drupal installation that stateful assets won't work and caching is disabled. If you want stateful assets to work you can set the disableDefaultFilesMount to true and perform the mappings based on your local development environment. You can consult the `values-hostpath-kind.yaml` or `values-hostpath-microk8s.yaml` file for further examples.

> **Note**: It is recommended that if you are installing this in a cloud environment that you use a shared file system provided by the environment you are running in for the stateful assets. An example for Azure is provided by using the `values-nfs-azurefile.yaml` as your override file which will allow for stateful assets to work across the nginx and php-fpm containers by using Azure Files (NFS). If you are using other Cloud Providers they will have similar offerings and the CSI driver will be different then `azureFile`.

> **Note:** We also provide support for the new Azure Shared Disks implementation however it is still advised to use Azure Files for the moment due. If you are running <= Kubernetes v1.19.0 you will need to manaully install the Azure CSI Driver. The instructions are given below.

```sh
curl -skSL https://raw.githubusercontent.com/kubernetes-sigs/azuredisk-csi-driver/v0.9.0/deploy/install-driver.sh | bash -s v0.9.0 --
kubectl -n kube-system get pod -o wide --watch -l app=csi-azuredisk-node
```

4. Run the following command:

### Kind

```sh
# When using the repo directly
helm install drupal -f values-kind.yaml --timeout 2400 --wait drupalwxt/drupal
# When using the local git repository
helm install drupal -f values-kind.yaml --timeout 2400 --wait .
```

### Azure Files

```sh
# When using the repo directly
helm install drupal -f values-azurefile.yaml --timeout 2400 --wait drupalwxt/drupal
# When using the local git repository
helm install drupal -f values-azurefile.yaml --timeout 2400 --wait .
```

> **Note**: If you have `drupal.install` set to `true`, then a site install will take place before the `helm install` command finishes. The default timeout is `300` seconds (or 5 minutes) of which depending on your IOPS the install could take longer.

> **Note**: The default installation with set the active them to the GCWeb variant and default content will also be installed. You can configure either of these settings in your own values-override.yaml file.

4. Follow the steps presented to you once the helm install is completed.

> **Note**: If you are working locally with Kind etc you might not have an ingress setup. In these situations you can simply use port-forward to access the service.

```
kubectl port-forward -n default svc/drupal-nginx 5000:80
```

## Development

We strive to ensure for every significant changes made to the Helm Chart we will bump the `Chart.yaml` version so that there are no breaking changes introduced on your current release.

In general, you should take note that most often the `values-kind.yaml` file is the most up-to-date and will often have newer features documented and in use.

You can consult the `values.yaml` file for the full range of options available to you.

> **Note:** We try out best to follow `https://semver.org` so that it's clear patch, minor and major releases for breaking changes.

## Documentation

Please consult the [documentation](https://github.com/drupalwxt/helm-drupal/tree/master/docs) which is provided in this repository in the `docs` folder should you wish to have more information about a recommended architecture.

<!-- Links Referenced -->

[kind]:               https://kind.sigs.k8s.io/
