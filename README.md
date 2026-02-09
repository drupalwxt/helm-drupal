# Helm Charts for Drupal

A **[Helm chart][helm]** for deploying **Drupal** on Kubernetes.

This chart is designed to support a modern, stateless, enterprise-ready Drupal deployment with optional supporting services that can be enabled for local development, testing, or self-hosted environments.

## Included optional dependencies

The chart can deploy the following supporting services when enabled:

- **File Storage** – Azure Files (for stateless Drupal file storage)
- **MariaDB / MySQL-compatible database** (optional)
- **PostgreSQL** (optional)
- **Valkey (Redis-compatible cache & queue)** (optional)
- **Apache Solr** (search)
- **Varnish** (HTTP caching / reverse proxy)

> These services are intended primarily for **development, CI, and self-contained deployments**.
> In production environments, external managed services are typically recommended.

## Architecture

Please consult the **Architectural Diagram** for a recommended deployment pattern on Azure:

- **[Architectural Diagram][diagram]**

## Individual Charts

Further documentation can be found at the individual chart level:

- **[Drupal 10/11][drupal]**

## Versioning & Compatibility

We follow **semantic versioning** for chart releases:

- **Patch** → bug fixes and non-breaking improvements
- **Minor** → new features and backwards-compatible changes
- **Major** → breaking changes

For any significant chart change, the `Chart.yaml` version is bumped accordingly.

You can consult the `values.yaml` file for the full set of configurable options.

---

[diagram]: https://github.com/drupalwxt/helm-drupal/blob/main/docs/diagram-drupal.pdf
[drupal]: charts/drupal/
[helm]: https://helm.sh/
