Helm Chart: Drupal
==================

A [Helm chart](https://helm.sh/) for [Drupal WxT](http://drupalwxt.org/) using [Minio](https://minio.io/) for stateful data. These are the instructions for a Kubernetes package manager to set up Drupal and its environment. You can use this to build a local development environment or a cloud native implementation.

## Installation

1. Ensure you have a running Kubernetes cluster. You can also test locally with docker for Mac.

2. Git clone the helm chart.

```sh
git clone https://github.com/drupalwxt/helm-drupal
cd helm-drupal/drupal
cp values.yaml values-override.yaml
```

3. Run the following command:

```sh
helm install --name drupal -f values-override.yaml --timeout 1200 --wait .
```

- If you have `drupal.install` set to `true`, then a site install will take place before
  the `helm install` command finishes. The default timeout is `300` seconds (or 5 minutes),
  but the Drupal install take much longer.

4. Follow the steps presented to you once the helm install is completed.
