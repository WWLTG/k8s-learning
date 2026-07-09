Solution and Verification

Lab
TLS Lab 10 - Certificate Authority and Certificate Chain
Fix applied
The TLS Secret was updated to include the full certificate chain.
The new tls.crt file contains the server certificate followed by the Intermediate CA certificate.
The Root CA certificate was not added to tls.crt because the client should already trust the Root CA.
Commands used
cat pki/server.crt pki/intermediate-ca.crt > pki/server-fullchain.crt

kubectl create secret tls ca-chain-tls --cert=pki/server-fullchain.crt --key=pki/server.key --namespace=tls-lab-10 --dry-run=client -o yaml > manifests/04-tls-secret.yaml

kubectl apply -f manifests/04-tls-secret.yaml

kubectl get secret ca-chain-tls -n tls-lab-10 -o jsonpath='{.data.tls.crt}' | base64 -d > /tmp/ca-chain-served-fixed.crt

grep -c "BEGIN CERTIFICATE" /tmp/ca-chain-served-fixed.crt

curl --cacert pki/root-ca.crt --resolve ca-chain.local:8443:127.0.0.1 https://ca-chain.local:8443/

Verification
The TLS Secret now contains two certificates.
The certificate chain is:
Server Certificate
Intermediate CA Certificate
The client already trusts:
Root CA Certificate
curl with --cacert pki/root-ca.crt succeeds without using -k.

Final result

HTTPS works with proper certificate verification.

The client can build a complete certificate chain from the server certificate to the trusted Root CA.

Lessons learned
A Kubernetes TLS Secret can contain more than one certificate inside tls.crt.
For production-style TLS, tls.crt should usually contain the server certificate plus the intermediate certificate chain.
The private key must still match the server certificate.
The Root CA is normally trusted by the client and should not usually be served by the application.

