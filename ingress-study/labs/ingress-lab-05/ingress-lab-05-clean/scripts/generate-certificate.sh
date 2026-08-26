#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cert_dir="$project_dir/certs"

mkdir -p "$cert_dir"

openssl req -x509 \
  -nodes \
  -newkey rsa:2048 \
  -days 365 \
  -keyout "$cert_dir/tls.key" \
  -out "$cert_dir/tls.crt" \
  -subj "/CN=secure.local" \
  -addext "subjectAltName=DNS:secure.local"

chmod 600 "$cert_dir/tls.key"

echo
echo "Certificate created for secure.local"
openssl x509 \
  -in "$cert_dir/tls.crt" \
  -noout \
  -subject \
  -ext subjectAltName
