#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_ROOT=$(dirname "${BASH_SOURCE[0]}")
echo "$(dirname ${BASH_SOURCE[0]})"

# Generate deepcopy functions
../vendor/k8s.io/code-generator/generate-groups.sh "deepcopy,client,informer,lister" \
  k8s-crd-controller/pkg/generated k8s-crd-controller/pkg/apis \
  k8s.cni.cncf.io:v1 \
  --output-base "${SCRIPT_ROOT}/../../" \
  --go-header-file "${SCRIPT_ROOT}\boilerplate.go.txt"
