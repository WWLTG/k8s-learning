Investigation

Symptoms

The Deployment and Service were running successfully.

The Ingress backend resolved to the healthy Pod endpoints.

The requested host and path did not match the configured Ingress routing rules.

Expected request

Host: routing-lab.local

Path: /

Commands used

kubectl apply -f manifests/00-namespace.yaml

kubectl wait --for=jsonpath='{.status.phase}'=Active namespace/ingress-routing-lab --timeout=30s

kubectl apply -f manifests/01-deployment.yaml -f manifests/02-service.yaml -f manifests/03-ingress.yaml

kubectl rollout status deployment/routing-demo -n ingress-routing-lab

kubectl get all -n ingress-routing-lab

kubectl get ingress -n ingress-routing-lab

kubectl describe ingress routing-demo -n ingress-routing-lab

Observations

The Deployment successfully created two ready Pods.

The Service exposed port 80.

The Ingress backend Service name and port were correct.

The Ingress backend resolved to two healthy Pod endpoints.

The configured host was:

wrong-routing.local

The configured path was:

/wrong

The required host was:

routing-lab.local

The required path was:

/

Root cause

The Ingress routing rules did not match the request used by the client.

The host value was incorrect.

The path value was incorrect.

Healthy components

Deployment

Service

EndpointSlice

Pods

Container

Broken component

Ingress routing rules

Required fix

Change the Ingress host from:

wrong-routing.local

To:

routing-lab.local

Change the Ingress path from:

/wrong

To:

/

