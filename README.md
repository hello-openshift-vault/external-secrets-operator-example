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

Deploy manifests under *./manifests* in order:

```bash
$ make install
```

## Uninstall

```bash
$ make uninstall
```
