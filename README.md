# Argo Vault Plugin with OpenShift GitOps

This repo contains example code that integrates [Hashicorp Vault] and [OpenShift
GitOps] ([Argo CD]) to deploy secrets from Vault to an OpenShift cluster using
the [argocd-vault-plugin].

This code is based off the process outlined in this [Red Hat Blog]. Key
differences between this implementation and the blog post:

* Blog was written for v0.x of argocd-vault-plugin, this works with v1.x
* Blog used the community Argo CD image from Docker.io, this uses the supported
  OpenShift GitOps image from Red Hat
* Blog configured Vault manually using CLI, this uses [Vault Config Operator]
  to configure Vault

## Create OpenShift GitOps (Argo CD) image with argocd-vault-plugin embedded

1. Build custom ArgoCD image with argo-vault-plugin installed:

```bash
$ make build
```

2. Push image to local registry:

```bash
$ make push
```

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

[Argo CD]: https://argoproj.github.io/cd
[argocd-vault-plugin]: https://github.com/argoproj-labs/argocd-vault-plugin
[Hashicorp Vault]:
[OpenShift GitOps]: https://docs.openshift.com/container-platform/4.10/cicd/gitops/understanding-openshift-gitops.html
[Red Hat Blog]: https://cloud.redhat.com/blog/how-to-use-hashicorp-vault-and-argo-cd-for-gitops-on-openshift
[Vault Config Operator]: https://github.com/redhat-cop/vault-config-operator
