Helm Chart: Drupal
==================

A [Helm chart](https://helm.sh/) for [Drupal WxT](http://drupalwxt.org/) using [Minio](https://minio.io/) for stateful data. These are the instructions for a Kubernetes package manager to set up Drupal and its environment. You can use this to build a local development environment or a cloud native implementation.

## Installation

1. Ensure you have a running Kubernetes cluster. You can also test locally with docker for Mac.

2. Git clone the helm chart.

```sh
git clone https://github.com/drupalwxt/helm-drupal
cd helm-drupal/drupal
cp values-nfs-azurefile.yaml values-override.yaml
```

> **Note**: Currently the default install using the `values.yaml` file alone results in a Drupal installation that leverages Minio for the stateful assets. It is recommended if you are installing in Azure that you instead use the `values-nfs-azurefile.yaml` as your override file.

3. Run the following command:

```sh
helm install --name drupal -f values-override.yaml --timeout 2400 --wait .
```

> **Note**: If you have `drupal.install` set to `true`, then a site install will take place before the `helm install` command finishes. The default timeout is `300` seconds (or 5 minutes), but the Drupal install can take much longer.

4. Follow the steps presented to you once the helm install is completed.

## Documentation

Please consult the [documentation](https://github.com/drupalwxt/helm-drupal/tree/master/docs) which is provided in this repository in the `docs` folder should you wish to have more information about a recommended architecture.
