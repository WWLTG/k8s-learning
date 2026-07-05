Ingress Lab 05 - TLS Termination

Goal

Investigate why HTTPS routing reaches the application but Traefik presents its default certificate instead of the certificate stored in the Kubernetes TLS Secret.

This lab contains one intentional configuration problem only.

Environment

Ingress class: traefik
Hostname: secure.local
Namespace: ingress-lab-05
Local HTTPS port: 9443

Setup

1. Apply the namespace.

kubectl apply -f manifests/00-namespace.yaml

2. Generate a valid certificate for secure.local.

chmod +x scripts/*.sh
./scripts/generate-certificate.sh

3. Create the correct TLS Secret.

./scripts/create-tls-secret.sh

4. Apply the broken lab resources.

kubectl apply -f manifests/01-deployment.yaml
kubectl apply -f manifests/02-service.yaml
kubectl apply -f manifests/03-ingress.yaml

5. Wait for the Deployment.

kubectl rollout status deployment/secure-web -n ingress-lab-05

6. Start one port-forward process in a separate terminal.

./scripts/start-port-forward.sh

Do not start the script a second time while port 9443 is listening.

7. Test HTTPS from another terminal.

curl -vk --resolve secure.local:9443:127.0.0.1 https://secure.local:9443/

Expected broken symptom

The request reaches the nginx Pod and returns HTTP 200, but the server certificate is the Traefik default certificate.

Investigation commands

kubectl get ingress -n ingress-lab-05
kubectl describe ingress secure-ingress -n ingress-lab-05
kubectl get secrets -n ingress-lab-05
kubectl describe secret secure-local-tls -n ingress-lab-05
kubectl get endpoints secure-web-service -n ingress-lab-05
kubectl logs -n traefik deployment/traefik --since=10m

Stop port-forward

./scripts/stop-port-forward.sh

Cleanup Kubernetes resources

kubectl delete namespace ingress-lab-05
