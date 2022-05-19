# Argo Vault Plugin with OpenShift GitOps

Attempting to get https://github.com/argoproj-labs/argocd-vault-plugin working
with OpenShift GitOps following https://cloud.redhat.com/blog/how-to-use-hashicorp-vault-and-argo-cd-for-gitops-on-openshift.

## Deploying

1. Build custom ArgoCD image with argo-vault-plugin installed

```bash
$ make build
```

2. Push image to local registry

```bash
$ make push
```
