Ingress Lab 05 - TLS Termination

Goal

Expose the web application through Traefik using HTTPS for secure.local.

Expected request flow

Client
HTTPS
Ingress Controller
HTTP
Service
Pod

Starting state

The Kubernetes manifests are valid and can be applied.
The application and Service should work.
TLS identity verification does not work as expected.

Rules

Do not edit the manifests before completing the investigation.
Do not use curl -k as the final verification.
Do not commit generated certificates or private keys to Git.

Lab resources

Namespace: ingress-lab-05
Deployment: secure-web
Service: secure-web-service
Ingress: secure-ingress
TLS Secret: secure-local-tls
Host: secure.local

Certificate setup

Run:

chmod +x scripts/generate-certificate.sh
./scripts/generate-certificate.sh

Create the TLS Secret:

kubectl create secret tls secure-local-tls \
  --cert=certs/tls.crt \
  --key=certs/tls.key \
  -n ingress-lab-05 \
  --dry-run=client -o yaml | kubectl apply -f -

Apply only the broken lab resources:

kubectl apply -f manifests/

Investigation order

HTTPS request
Ingress Controller
Ingress resource
TLS configuration
TLS Secret
Certificate hostname
Service
Endpoints
Pod

Useful commands

kubectl get all -n ingress-lab-05
kubectl get ingress -n ingress-lab-05
kubectl describe ingress secure-ingress -n ingress-lab-05
kubectl get secrets -n ingress-lab-05
kubectl describe secret secure-local-tls -n ingress-lab-05
kubectl get endpoints -n ingress-lab-05
kubectl get ingress secure-ingress -n ingress-lab-05 -o yaml

Find the HTTPS port exposed by the kind node:

podman port kind-control-plane

Example TLS verification when the mapped HTTPS port is 8443:

curl -v \
  --resolve secure.local:8443:127.0.0.1 \
  --cacert certs/tls.crt \
  https://secure.local:8443/

Temporary diagnostic test only:

curl -vk \
  --resolve secure.local:8443:127.0.0.1 \
  https://secure.local:8443/

Success criteria

The certificate presented by the Ingress Controller is valid for secure.local.
The certificate is trusted when curl uses certs/tls.crt.
The request reaches secure-web-service.
The response comes from a running Pod.
