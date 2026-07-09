Investigation

Lab

TLS Lab 6  Certificate Authority and Certificate Chain

Symptoms

The application is reachable over HTTPS when certificate verification is disabled.

curl -k succeeds.

The application fails when curl verifies the certificate using the trusted Root CA.

curl --cacert pki/root-ca.crt fails with:

unable to get local issuer certificate

Commands used

kubectl get pods -n tls-lab-10

kubectl get svc -n tls-lab-10

kubectl describe ingress -n tls-lab-10

kubectl describe secret ca-chain-tls -n tls-lab-10

curl -k --resolve ca-chain.local:8443:127.0.0.1 https://ca-chain.local:8443/

curl --cacert pki/root-ca.crt --resolve ca-chain.local:8443:127.0.0.1 https://ca-chain.local:8443/

kubectl get secret ca-chain-tls -n tls-lab-10 -o jsonpath='{.data.tls\.crt}' | base64 -d > /tmp/ca-chain-served.crt

grep -c "BEGIN CERTIFICATE" /tmp/ca-chain-served.crt

openssl x509 -in /tmp/ca-chain-served.crt -noout -subject -issuer

Observations

Pods are running.

The Service has healthy Endpoints.

The Ingress routes traffic to the correct Service.

The TLS Secret exists and has type kubernetes.io/tls.

HTTPS works only when certificate verification is disabled.

The served certificate is issued by TLS Lab Intermediate CA.

The TLS Secret contains only one certificate.

Root cause

The TLS Secret contains only the server certificate.

It does not include the Intermediate CA certificate.

Because of that, the client cannot build a complete certificate chain from the server certificate to the trusted Root CA.
