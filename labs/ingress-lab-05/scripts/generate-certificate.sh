#!/usr/bin/env bash
set -euo pipefail

LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CERT_DIR="$LAB_DIR/certs"

mkdir -p "$CERT_DIR"

openssl req \
  -x509 \
  -nodes \
  -newkey rsa:2048 \
  -days 365 \
  -keyout "$CERT_DIR/tls.key" \
  -out "$CERT_DIR/tls.crt" \
  -subj "/CN=internal.local" \
  -addext "subjectAltName=DNS:internal.local"

chmod 600 "$CERT_DIR/tls.key"

echo "Certificate created: $CERT_DIR/tls.crt"
echo "Private key created: $CERT_DIR/tls.key"
