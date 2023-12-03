# Varnish Helm Chart

This chart installs a Varnish deamon which can be used as a proxy to cache static web resources.

## Prerequisites Details

* Kubernetes 1.8+

## Chart Details

This chart will do the following:

* Kubernetes Deployment
* ConfigMap with `default.vcl` for configuration of Varnish
