#!/bin/bash

RECOVERY_JSON=$(oc get secret vault-recovery-keys -n vault-server -o jsonpath="{.data.recovery-keys\.json}" | base64 -d)
VAULT_ROOT_TOKEN=$(echo "$RECOVERY_JSON" | jq -r '.["root_token"]')

echo "Logging into Vault..."
oc exec -it -n vault-server vault-server-0 -- vault login "$VAULT_ROOT_TOKEN"

echo "Creating Kubernetes Role for 'my-app' namespace..."
oc exec -it -n vault-server vault-server-0 -- vault write \
            "auth/kubernetes/role/my-app" \
            bound_service_account_names="default" \
            bound_service_account_namespaces="my-app" \
            policies="kubernetes-read" \
            ttl=60m

echo "Creating SecretStore in 'my-app' namespace..."
oc create 
