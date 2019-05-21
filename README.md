Helm Chart: Drupal WxT
======================

A [Helm chart](https://helm.sh/) for [Drupal WxT](http://drupalwxt.org/) using [Minio](https://minio.io/) for stateful data. These are the instructions for a Kubernetes package manager to set up Drupal and it's environment. You can use this to build a local development environment or a cloud native implementation.  

## Installation

1. Ensure you have a running Kubernetes cluster. You can also test locally with docker for Mac.

2. Git clone the helm charts until repository is published under `gh-pages`.

```sh
git clone https://github.com/drupalwxt/helm-drupalwxt
cd helm-drupalwxt
```

3. Run the following command:

```sh
helm install --name drupal -f values.yaml .
```

4. Follow the steps presented to you once the helm install is completed.
