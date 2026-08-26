TLS Lab 10 - Certificate Authority and Certificate Chain

Goal

Understand how a missing intermediate certificate breaks TLS certificate verification.

Scenario

A web application is exposed through Kubernetes Ingress over HTTPS.

The hostname is:

ca-chain.local

The server certificate is valid for:

ca-chain.local

The server certificate is signed by an Intermediate CA.

The Intermediate CA is signed by a Root CA.

The client trusts the Root CA.

Broken state

The Kubernetes TLS Secret contains only the server certificate.

It does not include the Intermediate CA certificate.

Expected symptom

HTTPS works only when certificate verification is disabled.

Proper certificate verification fails because the client cannot build a complete certificate chain.

Rules

Do not use insecure curl mode as final validation.
Do not change the hostname.
Do not replace the private key.
Do not change the Ingress host.
Fix only the certificate chain problem.

Suggested investigation path

Ingress
TLS Secret
Certificate
Issuer
Certificate Chain

Useful hostname

ca-chain.local

Apply the lab

kubectl apply -f manifests

Basic checks

kubectl get pods -n tls-lab-10
kubectl get svc -n tls-lab-10
kubectl get ingress -n tls-lab-10
kubectl get secret ca-chain-tls -n tls-lab-10

Test with verification

If your HTTPS endpoint uses port 8443:

curl --cacert pki/root-ca.crt --resolve ca-chain.local:8443:127.0.0.1 https://ca-chain.local:8443/

If your HTTPS endpoint uses port 443:

curl --cacert pki/root-ca.crt --resolve ca-chain.local:443:127.0.0.1 https://ca-chain.local/

Temporary insecure test

curl -k --resolve ca-chain.local:8443:127.0.0.1 https://ca-chain.local:8443/

Do not use -k as final proof.
