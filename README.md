# External Secrets Operator with OpenShift GitOps

This repo contains example code that integrates [Hashicorp Vault] and [OpenShift
GitOps] ([Argo CD]) to deploy secrets from Vault to an OpenShift cluster using
[External Secrets Operator].

**IMPORTANT:** I could only get External Secrets Operator working using the
Helm chart installation method (with `installCRDs=true`). I tried to install
the operator directly in OperatorHub but the operator would not respond to CR
creation (e.g. SecretStore would create but the status would never populate).
These are the commands I used to install the Operator with Helm:

```
helm repo add external-secrets https://charts.external-secrets.io
helm install \
    external-secrets \
    external-secrets/external-secrets \
    -n external-secrets \
    --create-namespace \
    --set installCRDs=true
```

## Overview

* Install Vault
* Configure Vault for Kubernetes authentication
* Install Vault Config Operator
* Install External Secrets Operator
* Install OpenShift GitOps Operator
* Deploy Argo instance using custom image to my-app namespace
* Deploy test application to Argo instance
* External Secrets Operator will convert *ExternalSecret* objects to *Secret*
  objects
* 🍻

## Deploy to OpenShift

**First, [deploy vault](https://github.com/RyanMillerC/vault-init/)!** You will
need a fresh vault to run this.

After validating that vault is up (pods should be *Ready*), deploy manifests
under *./manifests* with make:

```bash
$ make install
```

## Uninstall

**Run this uninstall before running the vault uninstall, otherwise the
vault-config-operator CRs will hang on delete.** If you do accidentally
uninstall this first, you can patch/edit the hanging CRs to remove their
*finalizers*.

To unisntall:

```bash
$ make uninstall
```

[Argo CD]: https://github.com/argoproj/argo-cd
[External Secrets Operator]: https://github.com/external-secrets/external-secrets
[Hashicorp Vault]: https://github.com/hashicorp/vault
[OpenShift GitOps]: https://docs.openshift.com/container-platform/4.10/cicd/gitops/understanding-openshift-gitops.html
[Vault Config Operator]: https://github.com/redhat-cop/vault-config-operator
