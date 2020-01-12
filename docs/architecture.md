# Architecture

By: William Hearn and Zachary Seguin (Statistics Canada)

## Introduction

This document represents a high-level overview of how Drupal should be implemented in the cloud to support any of the Government of Canada procured service providers (AWS, Azure, and GCP). We are leveraging a microservices design pattern through containerization running on Kubernetes.

A key mandate is to follow the Open Source Directive as given by the Treasury Board Secretariat (C.2.3.8) which states where possible, use open standards and open source software first. Additionally, where possible expose all functionality as services (RESTFul) and leverage microservices via a containerized approach (C2.3.10).

### Key Criteria

- Ability to dynamically scale workloads based on custom metrics (CPU / memory)
- Blue-Green, and Canary style deployments
- Easily migrate workloads to different cloud providers or on-premise environments
- Design networks to be compliant with ITSG-22
- Follow the CIS Benchmarks for both Containers + Kubernetes
- Facilitate a managed service model whereby a new department can be easily onboard

Provided below is the Terraform (infrastructure as code) necessarily to install the Azure Kubernetes Service Infrastructure as well as configure with optional platform components (RBAC, Service Mesh, Policies, etc).

* Terraform for Kubernetes Infrastructure: [https://github.com/canada-ca-terraform-modules/terraform-kubernetes-aks](https://github.com/canada-ca-terraform-modules/terraform-kubernetes-aks)
* Terraform for Kubernetes Platform: [https://github.com/canada-ca-terraform-modules/terraform-kubernetes-aks-platform](https://github.com/canada-ca-terraform-modules/terraform-kubernetes-aks-platform)

To highlight that this solution can run on any cloud service provider we are currently working on support for the IBM Kubernetes Services.

* Terraform for Kubernetes Infrastructure: [https://github.com/canada-ca-terraform-modules/terraform-kubernetes-iks](https://github.com/canada-ca-terraform-modules/terraform-kubernetes-iks)
* Terraform for Kubernetes Platform: [https://github.com/canada-ca-terraform-modules/terraform-kubernetes-iks-platform](https://github.com/canada-ca-terraform-modules/terraform-kubernetes-iks-platform)

## **Components**

The components are individually described below. The components perform the same function in both the content staging and public environments.

## Kubernetes

**Recommendation:** [Kubernetes](https://kubernetes.io/)

Kubernetes is quickly becoming the lingua franca of the cloud and is supported by all cloud vendors including all offering a managed service and also works on both private / public infrastructure. The fact that most if not all cloud companies are centralizing around this solution also was a key decision point (Oracle, IBM, Pivotal, RedHat, VmWare, etc) along with the need to reduce vendor lock-in. Finally, the ability to move our workloads across cloud providers or even supporting a federated cluster across cloud providers for reliability was another key factor in the decision making.

The whole Drupal application stack can easily be installed in a distributed fashion in minutes using our helm chart which facilitates a managed service workflow (rolling updates, cronjobs, health checks, auto-scaling, etc).

* Helm chart: [https://github.com/drupalwxt/helm-drupal](https://github.com/drupalwxt/helm-drupal)

## Ingress controller

**Recommendation:** [Istio](https://istio.io/docs/tasks/traffic-management/ingress/ingress-control/)

The ingress controller is responsible for accepting external HTTP connections and routing them to backend applications based on configuration defined in Kubernetes Ingress objects. Routing can be done by domain and/or path.

## Nginx

**Recommendation:** [Nginx](https://www.nginx.com/)

Nginx is an open source web server that can also be used a reverse proxy, HTTP cache, and load balancer. Due to its root in performance optimization under scale, Nginx often outperforms similarly popular web servers and is built to offer low memory usage, and high concurrency.

> Note: It should be noted that Nginx in this model addresses the cache requirements that are needed in Drupal.

## Web (PHP-FPM)

**Recommendation:** [PHP-FPM](https://php-fpm.org/)

Drupal runs in the PHP runtime environment. PHP-FPM is the process manager organized as a master process managing pools of individual worker processes. Its architecture shares design similarities with event-driven web servers such as Nginx and allows for PHP scripts to use as much of the server&#39;s available resources as necessary without additional overhead that comes from running them inside of web server processes. The PHP-FPM master process dynamically creates and terminates worker processes (within configurable limits) as traffic to PHP scripts increases and decreases. Processing scripts in this way allows for much higher processing performance, improved security, and better stability. The primary performance benefits from using PHP-FPM are more efficient PHP handling and ability to use opcode caching.

## Database

**Recommendation:** [MySQL](https://www.mysql.com/) or [PostgreSQL](https://www.postgresql.org/)

Drupal maintains its state in a database and while supports several types only MySQL or PostgreSQL should be considered. Personally, we would highly recommend PostgreSQL based on the experience we had building / launching the Open Data portal but in the end, both run quite well with minimal operational concerns.

## Stateful Assets

Drupal stores generated CSS/JS assets and uploaded content (images, videos, etc.) in a file storage. As the architecture is designed to be distributed, this present some design considerations for us.

### Azure Files

Fully managed file shares in the cloud that are accessible via Server Message Block (SMB) protocol (also known as Common Internet File System or CIFS). Support is provided for dynamically creating and using a persistent volume with Azure Files in the Azure Kubernetes Service.

For more information on Azure Files, please see [Azure Files for applications in AKS](https://docs.microsoft.com/en-us/azure/aks/azure-files-dynamic-pv).

> Note: This is currently our recommended choice as results in a simpler installation in Azure then relying on an S3 compatible object store discussed below.

### S3 Compatible Object Store

**Recommendation:** [Minio](https://www.minio.io/)

To support S3 style object storage we will use a Drupal module ([s3fs](https://www.drupal.org/project/s3fs)) to store all of these stateful assets inside an object store. The object store can be Amazon S3 itself or another compatible store (e.g., Minio) which can work with both Azure and Google cloud storage.

## Installation Profile

![WxT](wxt.png)

[https://github.com/drupalwxt/wxt](https://github.com/drupalwxt/wxt)

Installation profiles provide site features and functions for a specific type of site as a single download containing Drupal core, contributed modules, themes, and predefined configuration. They make it possible to quickly set up a complex, use-specific site. The Canada installation profile is a sub-profile off of WxT which is a sub-profile of Lightning.

Note: The WxT profile is very light and only adds the GCWeb theme and plugins support.

## Composer Project

Project for managing your dependencies via composer.

[https://github.com/drupalwxt/site-wxt](https://github.com/drupalwxt/site-wxt)

## Continuous Integration

Currently we are running all of our CI builds using Travis CI but can be easily switched to any of the other options such as CircleCI, VSTS, Jenkins, etc.

* [https://travis-ci.org/drupalwxt/wxt](https://travis-ci.org/drupalwxt/wxt)
* [https://travis-ci.org/drupalwxt/site-wxt](https://travis-ci.org/drupalwxt/site-wxt)

> Note: We are currently moving our CI builds from Travis CI to run on GitHub Actions.

## Docker Registry

[https://hub.docker.com/r/drupalwxt/site-wxt](https://hub.docker.com/r/drupalwxt/site-wxt)

Currently we are storing all of our containers in Docker Hub.

These containers are also stored and scanned against Statistics Canada's internal docker registry namely [Artifactory](https://jfrog.com/artifactory/) which coupled with [XRay](https://jfrog.com/xray/) scans all of our containers against the known CVE's in the wild. Shoud any critical vulnerability be found we ensure that our public containers stored in Docker Hub recieve these fixes / mitigations as well.
