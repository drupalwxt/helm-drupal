# Helm Charts for Drupal

A **[Helm chart][helm]** for **[Drupal WxT][wxt]**.

This chart will deploy a highly available and performant enterprise Drupal site with the following integrations:

- File Storage (Azure Files) for Stateless Design
- MySQL configured with ProxySQL
- PostgreSQL configured with PGBouncer
- Redis
- Varnish

Please consult our **Architectural Diagram** for a recommended setup on Azure:

- **[Architectural Diagram][architectural_diagram]**

## Individual Charts

Further documentation can be found at the individual chart level:

- **[Drupal 9][drupal9]**
- **[Drupal 7][drupal7]**

## Development

We strive to ensure for every significant changes made to the Helm Chart we will bump the `Chart.yaml` version so that there are no breaking changes introduced on your current release.

You can consult the `values.yaml` file for the full range of options available to you.

> **Note:** We try out best to follow `https://semver.org` so that it's clear patch, minor and major releases for breaking changes.

[architectural_diagram]: https://github.com/drupalwxt/helm-drupal/blob/master/docs/diagram-drupal.pdf
[drupal7]: drupal7/README.md
[drupal9]: drupal/README.md
[helm]: https://helm.sh/
[wxt]: https://drupalwxt.github.io
