#!/usr/bin/env bash

set -eufx -o pipefail

kubectl create clusterrolebinding cluster-admin-binding \
    --clusterrole cluster-admin \
    --user admin || true

kubectl apply \
    -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/release-3.8/deploy/gatekeeper.yaml

kubectl apply -f policies/sync.yml