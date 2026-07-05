#!/usr/bin/env bash
set -euo pipefail

if ss -ltn | grep -qE '127\.0\.0\.1:9443|\[::1\]:9443'; then
  echo "Port 9443 is already listening. Stop the existing port-forward first."
  exit 1
fi

echo "Starting Traefik port-forward on https://127.0.0.1:9443"
echo "Keep this terminal open. Press Ctrl+C to stop it."

kubectl port-forward \
  -n traefik \
  service/traefik \
  9443:443
