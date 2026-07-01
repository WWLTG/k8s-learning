Ingress Lab 01

Scenario

A web application is running in the ingress-lab namespace.
The Deployment and Service appear to be available, but the Ingress route does not correctly connect to the backend.

Expected request

Host: ingress-lab.local
Path: /

Expected backend

Service: ingress-demo-service
Application response: the default NGINX welcome page

Rules

Apply only the files inside manifests.
Do not edit the manifests before investigating.
Use kubectl output as evidence.
Follow the complete traffic path.
Do not use the example manifests as replacement files.

Apply the broken lab

kubectl apply -f manifests/

Initial checks

kubectl get all -n ingress-lab
kubectl get ingress -n ingress-lab
kubectl get ingressclass

Investigation order

Ingress
Service
EndpointSlice
Pod
Container

Documentation workflow

Complete investigation.md after finding the root cause.
Commit the investigation separately.
Apply the smallest required fix.
Complete solution-and-verification.md after validation.
Create the final commit.

Suggested commit messages

Add broken Ingress lab
Document Ingress investigation
Solve Ingress lab
