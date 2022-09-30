# External Secrets Operator with OpenShift Example

This repo contains example code that integrates [Hashicorp Vault] and
[OpenShift Container Platform] to deploy secrets from Vault using
[External Secrets Operator].

## Install External Secrets Operator

**IMPORTANT: I could only get External Secrets Operator working using the
Helm chart installation method (with `installCRDs=true`).** I tried to install
the operator directly from OperatorHub but the operator would not respond to CR
creation (e.g. SecretStore would create but the status would never populate).

To install the Operator with with Helm:

```
helm repo add external-secrets https://charts.external-secrets.io
helm install \
    external-secrets \
    external-secrets/external-secrets \
    -n external-secrets \
    --create-namespace \
    --set installCRDs=true
```

## Install Vault

Use [vault-init] to install Vault.

Wait to continue until validating that Vault is up (pods should be *Ready*).

## Deploy Example Manifests

```bash
$ make install
```

## Uninstall

To unisntall:

```bash
$ make uninstall
```

[Argo CD]: https://github.com/argoproj/argo-cd
[External Secrets Operator]: https://github.com/external-secrets/external-secrets
[Hashicorp Vault]: https://github.com/hashicorp/vault
[OpenShift Container Platform]: https://docs.openshift.com/container-platform/latest
[OpenShift GitOps]: https://docs.openshift.com/container-platform/4.10/cicd/gitops/understanding-openshift-gitops.html
[Vault Config Operator]: https://github.com/redhat-cop/vault-config-operator
[vault-init](https://github.com/hello-openshift-vault/vault-init)
