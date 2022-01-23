# Helm Charts: Drupal

A **[Helm chart][helm]** for **[Drupal WxT][wxt]**.

This chart will deploy a highly available and performant enterprise Drupal site with the following integrations:

- File Storage (Azure Files) for Stateless
- MySQL configured with ProxySQL
- PostgreSQL configured with PGBouncer
- Redis
- Varnish

Please consult our **Architectural Diagram** for a recommended setup on Azure:

- **[Architectural Diagram][architectural_diagram]**

Further documentation can be found at the individual chart level:

- **[Drupal 9][drupal9]**
- **[Drupal 7][drupal7]**

<-- Links Referenced -->

[architectural_diagram]: https://github.com/drupalwxt/helm-drupal/blob/master/docs/diagram-drupal.pdf
[drupal7]: https://github.com/drupalwxt/helm-drupal/tree/master/drupal7
[drupal9]: https://github.com/drupalwxt/helm-drupal/tree/master/drupal
[helm]: https://helm.sh/
[wxt]: https://drupalwxt.github.io
