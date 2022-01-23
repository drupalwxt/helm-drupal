# Helm Chart: Drupal

A **[Helm chart][helm]** for **[Drupal WxT][wxt]**.

This chart will deploy a highly available and performant enterprise Drupal site with the following integrations:

- File Storage (Azure Files) for Stateless
- MySQL configured with ProxySQL
- PostgreSQL configured with PGBouncer
- Redis
- Varnish

Please consult our **Architectural Diagram** for a recommended setup on Azure:

- **[Architectural Diagram][architectural_diagram]**

<-- Links Referenced -->

[architectural_diagram]: https://github.com/drupalwxt/helm-drupal/blob/master/docs/diagram-drupal.pdf
[helm]: https://helm.sh/
[wxt]: https://drupalwxt.github.io
