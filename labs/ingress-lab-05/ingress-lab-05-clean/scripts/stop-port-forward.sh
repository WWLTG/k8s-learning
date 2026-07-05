#!/usr/bin/env bash
set -euo pipefail

pids="$(pgrep -f 'kubectl port-forward.*service/traefik.*9443:443' || true)"

if [[ -z "$pids" ]]; then
  echo "No Traefik port-forward process is using 9443."
  exit 0
fi

echo "$pids" | xargs kill
sleep 1

echo "Stopped Traefik port-forward process."
