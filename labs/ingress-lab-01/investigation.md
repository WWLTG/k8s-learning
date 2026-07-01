Investigation

Symptoms

The Deployment and Service were running, but the Ingress route did not connect correctly to the backend.

The Ingress had no assigned address.

The Ingress backend appeared as:

ingress-demo-service:8080 ()

Commands used

kubectl apply -f manifests/

kubectl rollout status deployment/ingress-demo -n ingress-lab

kubectl get all -n ingress-lab

kubectl get ingress -n ingress-lab

kubectl describe ingress ingress-demo -n ingress-lab

kubectl get ingressclass

kubectl describe service ingress-demo-service -n ingress-lab

kubectl get endpointslice -n ingress-lab -l kubernetes.io/service-name=ingress-demo-service

kubectl get pods -n ingress-lab --show-labels

kubectl get pods -A

Observations

The Deployment successfully created two ready Pods.

The Service exposed port 80.

The Service targetPort pointed to the named container port http.

The Service had two healthy endpoints on port 80.

The EndpointSlice contained both Pod IP addresses.

The Pod labels matched the Service selector.

The Ingress host and path were correct.

The Ingress backend referenced Service port 8080.

The Service did not expose port 8080.

No in-cluster Ingress Controller or IngressClass was found.

The Ingress address remained empty.

Traffic path findings

Ingress

Host: ingress-lab.local

Path: /

Backend Service: ingress-demo-service

Configured backend port: 8080

The configured backend port did not exist on the Service.

Service

Service port: 80

Target port: http

Selector: app=ingress-demo

The Service configuration was healthy.

EndpointSlice

The EndpointSlice contained two ready endpoints.

Both endpoints exposed port 80.

Pod

Both Pods were Running and Ready.

The Pod labels matched the Service selector.

Container

The NGINX containers listened on port 80.

The readiness probes were successful.

Root cause

The Ingress backend referenced port 8080, but ingress-demo-service exposed port 80.

An Ingress backend must reference a Service port, not an unrelated container or target port.

Environment prerequisite

External Ingress routing also requires an active Ingress implementation.

No in-cluster Ingress Controller was found, and the Ingress address was empty.

The host-side cloud-provider-kind process must be checked separately.

Evidence

Ingress backend:

ingress-demo-service:8080 ()

Service port:

80/TCP

Service endpoints:

10.244.0.19:80
10.244.0.20:80

EndpointSlice port:

80

