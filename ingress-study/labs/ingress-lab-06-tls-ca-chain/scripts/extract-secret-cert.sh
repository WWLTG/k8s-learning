#!/usr/bin/env bash
set -euo pipefail

kubectl get secret ca-chain-tls -n tls-lab-10 -o jsonpath='{.data.tls\.crt}' | base64 -d > /tmp/ca-chain-tls.crt
openssl x509 -in /tmp/ca-chain-tls.crt -noout -subject -issuer -dates
