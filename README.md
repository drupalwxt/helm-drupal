# Helm Charts for Drupal

A **[Helm chart][helm]** for **[Drupal WxT][wxt]**.

This chart will deploy a highly available and performant enterprise Drupal site with the following integrations:

- File Storage (Azure Files) for Stateless Design
- MySQL (optionally configured with ProxySQL)
- PostgreSQL (optionally configured with PGBouncer)
- Redis
- Solr
- Varnish

Please consult our **Architectural Diagram** for a recommended setup on Azure:

- **[Architectural Diagram][diagram]**

## Individual Charts

Further documentation can be found at the individual chart level:

- **[Drupal 9/10][drupal]**

## Development

We strive to ensure for every significant changes made to the Helm Chart we will bump the `Chart.yaml` version so that there are no breaking changes introduced on your current release.

You can consult the `values.yaml` file for the full range of options available to you.

> **Note:** We try out best to follow `https://semver.org` so that it's clear patch, minor and major releases for breaking changes.

[diagram]: https://github.com/drupalwxt/helm-drupal/blob/main/docs/diagram-drupal.pdf
[drupal]: drupal/README.md
[helm]: https://helm.sh/
[wxt]: https://drupalwxt.github.io
