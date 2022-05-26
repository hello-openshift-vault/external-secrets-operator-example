FROM registry.redhat.io/openshift-gitops-1/argocd-rhel8:v1.5.1

USER 0

# Install the AVP plugin (as root so we can copy to /usr/local/bin)
RUN curl -L -o /usr/local/bin/argocd-vault-plugin \
  https://github.com/argoproj-labs/argocd-vault-plugin/releases/download/v1.11.0/argocd-vault-plugin_1.11.0_linux_amd64 \
  && chmod +x /usr/local/bin/argocd-vault-plugin

USER 999
