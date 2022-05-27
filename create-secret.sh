#!/bin/bash
oc exec -n vault-server vault-server-0 -- vault kv put hub/my-app/message message="Hello World!"
