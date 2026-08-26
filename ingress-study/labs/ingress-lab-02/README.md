Ingress Lab 02

Scenario

A web application is running correctly behind a Kubernetes Service.

Users should access the application with:

Host: routing-lab.local
Path: /

The Deployment, Service, and backend endpoints are expected to be healthy.

The Ingress resource was created, but the routing rule does not match the expected request.

Objectives

1. Apply the broken lab.
2. Investigate without editing the manifests first.
3. Follow the traffic path:

Ingress
Service
EndpointSlice
Pod
Container

4. Identify all routing problems.
5. Document the investigation.
6. Commit the investigation separately.
7. Fix only the required fields.
8. Verify the final configuration.
9. Document the solution and verification.
10. Create the final commit.

Apply the broken lab

kubectl apply -f manifests/00-namespace.yaml
kubectl wait --for=jsonpath='{.status.phase}'=Active namespace/ingress-routing-lab --timeout=30s
kubectl apply -f manifests/01-deployment.yaml -f manifests/02-service.yaml -f manifests/03-ingress.yaml

Initial inspection

kubectl get all -n ingress-routing-lab
kubectl get ingress -n ingress-routing-lab
kubectl describe ingress routing-demo -n ingress-routing-lab
kubectl describe service routing-demo-service -n ingress-routing-lab
kubectl get endpointslice -n ingress-routing-lab -l kubernetes.io/service-name=routing-demo-service
kubectl get pods -n ingress-routing-lab --show-labels

Do not edit the manifests before completing the investigation.

Expected final route

Host: routing-lab.local
Path: /
Backend Service: routing-demo-service
Backend Service port: 80

External HTTP testing requires an active Ingress Controller.
