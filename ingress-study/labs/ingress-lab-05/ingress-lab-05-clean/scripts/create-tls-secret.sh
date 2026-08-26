#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

kubectl create secret tls secure-local-tls \
  --cert="$project_dir/certs/tls.crt" \
  --key="$project_dir/certs/tls.key" \
  -n ingress-lab-05 \
  --dry-run=client \
  -o yaml | kubectl apply -f -

kubectl get secret secure-local-tls -n ingress-lab-05
