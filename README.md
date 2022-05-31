# External Secrets with OpenShift GitOps

This repo contains example code that integrates [Hashicorp Vault] and [OpenShift
GitOps] ([Argo CD]) to deploy secrets from Vault to an OpenShift cluster using
[External Secrets].

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

[Argo CD]: https://github.com/argoproj/argo-cd
[External Secrets]: https://github.com/external-secrets/external-secrets
[Hashicorp Vault]: https://github.com/hashicorp/vault
[OpenShift GitOps]: https://docs.openshift.com/container-platform/4.10/cicd/gitops/understanding-openshift-gitops.html
[Vault Config Operator]: https://github.com/redhat-cop/vault-config-operator
