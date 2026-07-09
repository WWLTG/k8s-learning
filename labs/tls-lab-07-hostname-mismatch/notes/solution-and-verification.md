TLS Lab 07 Solution and Verification

Problem

curl failed TLS verification for tls07.local.

The TLS Secret existed.
The Ingress existed.
The Service had ready endpoints.
The Pods were running.

Root cause

The certificate inside the TLS Secret did not contain tls07.local in the Subject Alternative Name.

The certificate contained:

wrong.tls.local

The requested hostname was:

tls07.local

Fix

Regenerated the server certificate with:

CN=tls07.local
SAN=DNS:tls07.local

Then recreated the Kubernetes TLS Secret manifest using the corrected certificate and applied it.

Verification commands

openssl x509 -in pki/server.crt -noout -subject -issuer -ext subjectAltName

kubectl apply -f manifests/03-tls-secret.yaml

kubectl rollout restart deployment/traefik -n traefik
kubectl rollout status deployment/traefik -n traefik

echo | openssl s_client -connect 127.0.0.1:8443 -servername tls07.local -showcerts 2>/dev/null | openssl x509 -noout -subject -issuer -ext subjectAltName

curl -v --cacert pki/root-ca.crt --resolve tls07.local:8443:127.0.0.1 https://tls07.local:8443/

Expected result

The served certificate contains:

CN=tls07.local
SAN=DNS:tls07.local

curl succeeds with normal TLS verification.

Lesson learned

A trusted CA is not enough.

The requested hostname must match the certificate Subject Alternative Name.
