#!/usr/bin/env bash
set -euo pipefail

LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PKI_DIR="$LAB_DIR/pki"

for cert in root-ca.crt intermediate-ca.crt server.crt; do
  echo
  echo "=== $cert ==="
  openssl x509 -in "$PKI_DIR/$cert" -noout -subject -issuer -dates
  echo
  openssl x509 -in "$PKI_DIR/$cert" -noout -ext subjectAltName 2>/dev/null || true
done
