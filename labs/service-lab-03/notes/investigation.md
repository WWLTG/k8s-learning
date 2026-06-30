# Service Lab 03 - Investigation

# Symptoms

The backend api Pods were Running and Ready.

The api-service ClusterIP existed in backend-namespace.

The client Pod was Running in client-namespace.

The client repeatedly failed with:

Could not resolve host: api-service

# Commands Used

kubectl get all -n backend-namespace

kubectl get all -n client-namespace

kubectl describe svc api-service -n backend-namespace

kubectl get endpointslices -n backend-namespace

kubectl logs -n client-namespace deployment/client --tail=20

kubectl run dns-test -n client-namespace --rm -it --restart=Never --image=busybox:1.36 -- nslookup api-service

kubectl run dns-test -n client-namespace --rm -it --restart=Never --image=busybox:1.36 -- nslookup api-service.backend-namespace

kubectl run dns-test -n client-namespace --rm -it --restart=Never --image=busybox:1.36 -- nslookup api-service.backend-namespace.svc.cluster.local

kubectl run curl-test -n client-namespace --rm -it --restart=Never --image=curlimages/curl -- curl -v http://api-service.backend-namespace:8080

# Observations

The backend Deployment had two healthy Pods.

The api-service selector matched the backend Pods.

The Service port was 8080.

The targetPort resolved to container port 80.

The Service had these endpoints:

10.244.0.24:80

10.244.0.23:80

The EndpointSlice showed port 80 and both backend Pod addresses.

The client used this URL:

http://api-service:8080

The short Service name was searched inside client-namespace.

Kubernetes DNS returned NXDOMAIN for:

api-service.client-namespace.svc.cluster.local

The fully qualified Service name resolved successfully:

api-service.backend-namespace.svc.cluster.local

The resolved ClusterIP was:

10.96.28.154

A curl request using the namespace-qualified Service name succeeded:

http://api-service.backend-namespace:8080

The response returned:

HTTP/1.1 200 OK

Server: nginx/1.27.5

# Client Namespace

The client Deployment was located in:

client-namespace

A short Service name is resolved relative to the namespace of the requesting Pod.

The name api-service therefore referred to a Service expected inside client-namespace.

No Service named api-service existed in client-namespace.

# Backend Namespace

The api Deployment and api-service were located in:

backend-namespace

The backend resources were healthy and did not require changes.

# DNS Resolution

The short name failed:

api-service

The fully qualified name succeeded:

api-service.backend-namespace.svc.cluster.local

The namespace-qualified name also succeeded when tested through curl:

api-service.backend-namespace

BusyBox nslookup did not resolve the namespace-qualified name without the full cluster domain, while curl resolved it through the Pod resolver search configuration.

The fully qualified domain name is the most explicit DNS test.

# Service and ClusterIP

The Service type was ClusterIP.

The ClusterIP was:

10.96.28.154

The Service was reachable after using a DNS name that included the correct namespace.

# EndpointSlice

The EndpointSlice contained:

10.244.0.24:80

10.244.0.23:80

This proved that Service selection and backend port mapping were correct.

# Traffic Path Analysis

Client Pod in client-namespace

DNS query for api-service

Search inside client-namespace

NXDOMAIN

Correct DNS name with backend-namespace

ClusterIP 10.96.28.154

EndpointSlice

Backend Pods on port 80

nginx response

# Root Cause

The client used the short Service name api-service while the Service existed in another namespace.

The short name was resolved relative to client-namespace, where no matching Service existed.

The client must use a namespace-qualified or fully qualified Service DNS name.
