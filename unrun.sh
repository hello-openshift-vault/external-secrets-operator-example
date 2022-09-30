#!/bin/bash

echo "Deleting objects under './manifests'..."
oc delete -f ./manifests
