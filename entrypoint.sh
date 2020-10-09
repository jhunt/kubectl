#!/bin/sh
set -eu
mkdir -p ~/.kube
echo "${INPUT_KUBECONFIG}" | base64 -d > ~/.kube/config
if [[ -n "${INPUT_CONTEXT:-}" ]]; then
	kubectl config use-context "${INPUT_CONTEXT}"
fi
kubectl "$@"
