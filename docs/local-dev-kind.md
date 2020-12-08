## Local Development with Kind

1. Create the local Kubernetes cluster with Kind:

```sh
kind create cluster --config kind.yaml
```

The content of the kind.yaml should be:

```sh
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  # add a mount from /path/to/my/files on the host to /files on the node
  extraMounts:
  - hostPath: /tmp/drupal/shared/drupal-public
    containerPath: /mnt/drupal/drupal-public
  - hostPath: /tmp/drupal/shared/drupal-private
    containerPath: /mnt/drupal/drupal-private
```

2. Run the Helm chart installation using the `values-hostpath-kind.yaml` file:

```sh
helm install drupal -f values-hostpath-kind.yaml .
```

> **Note**: In the example above we also enable the varnish integration.

```sh
NAMESPACE            NAME                                         READY   STATUS    RESTARTS   AGE
default              drupal-7ff76d6f74-s6zn2                      1/1     Running   0          83s
default              drupal-mysql-54c79c5658-6lggk                1/1     Running   0          83s
default              drupal-nginx-787db5cf7c-2kw2h                1/1     Running   0          83s
default              drupal-site-install-6ddxp                    1/1     Running   0          82s
default              drupal-varnish-7b75c46d6c-4nq9h              1/1     Running   0          83s
```

3. Logs the output of the site-install container:

```sh
k logs drupal-site-install-XXXXX -f

DB available
 Drupal version : 9.0.8
 Site URI       : http://default
 DB driver      : mysql
 DB hostname    : drupal-mysql
 DB port        : 3306
 DB username    : wxt
 DB name        : wxt
 PHP binary     : /usr/local/bin/php
 PHP config     : /usr/local/etc/php/php.ini
 PHP OS         : Linux
 Drush script   : /var/www/vendor/drush/drush/drush
 Drush version  : 10.3.6
 Drush temp     : /tmp
 Drush configs  : /var/www/vendor/drush/drush/drush.yml
 Drupal root    : /var/www/html
 Site path      : sites/default

 You are about to:
 * DROP all tables in your 'wxt' database.

 // Do you want to continue?: yes.

 [notice] Starting Drupal installation. This takes a while.
 [notice] Performed install task: install_select_language
 [notice] Performed install task: install_select_profile
 [notice] Performed install task: install_load_profile
 [notice] Performed install task: install_verify_requirements
 [notice] Performed install task: install_verify_database_ready
 [notice] Performed install task: install_base_system
 [notice] Performed install task: install_bootstrap_full
 [notice] Performed install task: install_profile_modules
 [notice] Performed install task: install_profile_themes
 [notice] Performed install task: install_install_profile
 [notice] Translations imported: 9187 added, 0 updated, 0 removed.
 [notice] Performed install task: install_import_translations
 [notice] Performed install task: wxt_extension_configure_form
 [notice] Performed install task: install_configure_form
 [notice] metatag.metatag_defaults.global rewritten by wxt_ext_metatag
 [notice] metatag.metatag_defaults.node rewritten by wxt_ext_metatag
 [notice] metatag.metatag_defaults.taxonomy_term rewritten by wxt_ext_metatag
 [notice] metatag.metatag_defaults.user rewritten by wxt_ext_metatag
 [notice] core.entity_view_display.node.blog_post.default rewritten by wxt_ext_blog
 [notice] core.entity_form_display.node.blog_post.default rewritten by wxt_ext_blog
 [notice] views.view.blog rewritten by wxt_ext_blog
 [notice] node.type.blog_post rewritten by wxt_ext_blog
 [notice] field.field.node.blog_post.field_blog_tags rewritten by wxt_ext_blog
 [notice] field.storage.node.field_blog_tags rewritten by wxt_ext_blog
 [notice] field.field.node.blog_post.field_blog_comments rewritten by wxt_ext_blog
 [notice] menu_breadcrumb.settings rewritten by wxt_ext_breadcrumb
 [notice] image.style.linkit_result_thumbnail rewritten by wxt_ext_editor
 [notice] linkit.linkit_profile.default rewritten by wxt_ext_editor
 [notice] editor.editor.rich_text rewritten by wxt_ext_editor
 [notice] filter.format.rich_text rewritten by wxt_ext_editor
 [notice] fontawesome.settings rewritten by wxt_ext_fontawesome
 [notice] group.settings rewritten by wxt_ext_group
 [notice] pathauto.pattern.group_content rewritten by wxt_ext_group
 [notice] field.storage.node.layout_builder__layout rewritten by wxt_ext_layout
 [notice] layout_library.layout.page_two_column rewritten by wxt_ext_layout
 [notice] field.storage.node.layout_selection rewritten by wxt_ext_layout
 [notice] field.storage.node.layout_builder__translation rewritten by wxt_ext_layout
 [notice] core.entity_view_display.node.landing_page.full rewritten by wxt_ext_landing_page
 [notice] field.field.node.landing_page.layout_selection rewritten by wxt_ext_landing_page
 [notice] core.entity_form_display.node.landing_page.default rewritten by wxt_ext_landing_page
 [notice] field.field.node.landing_page.layout_builder__layout rewritten by wxt_ext_landing_page
 [notice] field.field.node.landing_page.layout_builder__translation rewritten by wxt_ext_landing_page
 [notice] field.field.node.page.layout_selection rewritten by wxt_ext_page
 [notice] core.entity_view_display.node.page.default rewritten by wxt_ext_page
 [notice] node.type.page rewritten by wxt_ext_page
 [notice] core.entity_form_display.node.page.default rewritten by wxt_ext_page
 [notice] core.entity_form_display.node.landing_page.default rewritten by wxt_ext_queue
 [notice] views.view.blocks rewritten by wxt_ext_queue
 [notice] system.theme rewritten by wxt_ext_theme
 [notice] node.settings rewritten by wxt_ext_theme
 [notice] user.settings rewritten by wxt_ext_user
 [notice] field.field.node.webform.body rewritten by wxt_ext_webform
 [notice] core.entity_view_display.node.webform.teaser rewritten by wxt_ext_webform
 [notice] core.entity_form_display.node.webform.default rewritten by wxt_ext_webform
 [notice] field.field.node.webform.webform rewritten by wxt_ext_webform
 [notice] field.storage.node.webform rewritten by wxt_ext_webform
 [notice] node.type.webform rewritten by wxt_ext_webform
 [notice] core.entity_view_display.node.webform.default rewritten by wxt_ext_webform
 [notice] Translation file not found: http://ftp.drupal.org/files/translations/9.x/drupal/drupal-9.0.8.fr.po.
 [notice] Performed install task: wxt_install_extensions
 [notice] Performed install task: install_finish_translations
 [notice] Cron run completed.
 [notice] Performed install task: install_finished
 [notice] Performed install task: wxt_import_language_config
 [success] Installation complete.
real    2m 39.86s
user    1m 37.26s
sys     0m 15.68s

 // Do you want to update wxt.theme key in wxt_library.settings config?: yes.

 [success] Cache rebuild complete.

  1/13 [==>-------------------------]   7%
  6/13 [============>---------------]  46%
 10/13 [=====================>------]  76%
 13/13 [============================] 100% [notice] Processed 13 items (13 created, 0 updated, 0 failed, 0 ignored) - done with 'wxt_file'
 [notice] Processed 0 items (0 created, 0 updated, 0 failed, 0 ignored) - done with 'wxt_file'

 1/2 [==============>-------------]  50%
 2/2 [============================] 100% [notice] Processed 2 items (2 created, 0 updated, 0 failed, 0 ignored) - done with 'wxt_node_page'

  1/13 [==>-------------------------]   7%
  3/13 [======>---------------------]  23%
  6/13 [============>---------------]  46%
 10/13 [=====================>------]  76%
 12/13 [=========================>--]  92%
 13/13 [============================] 100% [notice] Processed 13 items (13 created, 0 updated, 0 failed, 0 ignored) - done with 'wxt_media'

 1/3 [=========>------------------]  33%
 3/3 [============================] 100% [notice] Processed 3 items (3 created, 0 updated, 0 failed, 0 ignored) - done with 'wxt_media_slideshow'

 1/4 [=======>--------------------]  25%
 4/4 [============================] 100% [notice] Processed 4 items (4 created, 0 updated, 0 failed, 0 ignored) - done with 'gcweb_block'

 1/3 [=========>------------------]  33%
 3/3 [============================] 100% [notice] Processed 3 items (3 created, 0 updated, 0 failed, 0 ignored) - done with 'gcweb_block_spotlight'

 1/2 [==============>-------------]  50%
 2/2 [============================] 100% [notice] Processed 2 items (2 created, 0 updated, 0 failed, 0 ignored) - done with 'gcweb_node_landing_page'

  1/38 [>---------------------------]   2%
  8/38 [=====>----------------------]  21%
 16/38 [===========>----------------]  42%
 23/38 [================>-----------]  60%
 27/38 [===================>--------]  71%
 35/38 [=========================>--]  92%
 38/38 [============================] 100% [notice] Processed 38 items (38 created, 0 updated, 0 failed, 0 ignored) - done with 'gcweb_menu_link'
```

4. Use port-forward to access the service if an ingress is not setup:

```sh
kubectl port-forward -n default svc/drupal-varnish 5000:80
```

