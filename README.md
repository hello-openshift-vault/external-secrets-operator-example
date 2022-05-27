# Argo Vault Plugin with OpenShift GitOps

Attempting to get https://github.com/argoproj-labs/argocd-vault-plugin working
with OpenShift GitOps following https://cloud.redhat.com/blog/how-to-use-hashicorp-vault-and-argo-cd-for-gitops-on-openshift.

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
