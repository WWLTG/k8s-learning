TLS Lab 07 Investigation
Symptom

curl fails with certificate hostname verification error.

Commands used

kubectl get all -n tls-lab-07
kubectl get ingress -n tls-lab-07
kubectl describe ingress hostname-demo-ingress -n tls-lab-07
kubectl get secret hostname-mismatch-tls -n tls-lab-07 -o jsonpath='{.data.tls\.crt}' | base64 -d | openssl x509 -noout -subject -issuer -ext subjectAltName
echo | openssl s_client -connect 127.0.0.1:8443 -servername tls07.local -showcerts 2>/dev/null | openssl x509 -noout -subject -issuer -ext subjectAltName
curl -v --cacert pki/root-ca.crt --resolve tls07.local:8443:127.0.0.1 https://tls07.local:8443/

Observations
Pods are running.
Service has ready endpoints.
Ingress routes host tls07.local to hostname-demo-service.
The Kubernetes TLS Secret exists.
The Secret certificate subject is wrong.tls.local.
The Secret certificate SAN is DNS:wrong.tls.local.
The requested hostname is tls07.local.
Traefik serves TRAEFIK DEFAULT CERT for tls07.local.

Certificate details
Secret certificate:
subject=CN=wrong.tls.local
issuer=CN=TLS Lab 07 Root CA
SAN=DNS:wrong.tls.local

Served certificate:
subject=CN=TRAEFIK DEFAULT CERT
issuer=CN=TRAEFIK DEFAULT CERT

Requested hostname
tls07.local

Root cause
The certificate inside the TLS Secret does not contain tls07.local in the Subject Alternative Name.
The certificate only contains wrong.tls.local.
Because the requested hostname does not match the certificate SAN, TLS hostname verification fails.
In this Traefik setup, Traefik falls back to the default certificate instead of serving the mismatched certificate.

Next step
Fix the hostname mismatch by making the certificate SAN match the Ingress host.
