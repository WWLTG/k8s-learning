# Service Lab 03 - Cross-Namespace DNS

# Objective

Troubleshoot a client application that cannot reach a healthy Kubernetes Service located in another namespace.

# Concepts Covered

Service DNS

Short Service names

Namespace-qualified Service names

Fully qualified domain names

Cross-namespace Service discovery

ClusterIP verification

EndpointSlice verification

# Architecture

client namespace

client Deployment

backend namespace

api-service

api Deployment

# Starting State

The backend Pods are healthy.

The Service selector is correct.

The Service port and targetPort are correct.

The EndpointSlice contains healthy backend addresses.

The client repeatedly fails to reach the Service.

Do not change the backend Deployment, Service selector, Service port, or targetPort unless your investigation proves they are incorrect.

# Apply the Lab

kubectl apply -f manifests/

# Initial Inspection

kubectl get all -n backend-namespace

kubectl get all -n client-namespace

kubectl get pods -n backend-namespace --show-labels

kubectl describe svc api-service -n backend-namespace

kubectl get endpointslices -n backend-namespace

kubectl logs -n client-namespace deployment/client --tail=20

kubectl exec -n client-namespace deployment/client -- cat /etc/resolv.conf

# DNS Test Pod

kubectl run dns-test -n client-namespace --rm -it --restart=Never --image=busybox:1.36 -- nslookup api-service

# Rules

Preserve the broken state in Git before applying any fix.

Investigate from the client toward the backend.

Do not add the solution to the investigation file.

After identifying the root cause, document the investigation before applying the final fix.

# Troubleshooting Path

Client Pod

DNS lookup

Service namespace

ClusterIP

EndpointSlice

Backend Pod

Application response
