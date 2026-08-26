Ingress Concept

What Ingress does

Ingress provides HTTP and HTTPS routing from outside a Kubernetes cluster to Services inside the cluster.

An Ingress resource stores routing rules.
An Ingress Controller reads those rules and configures a proxy or load balancer that handles the traffic.

Traffic flow

Client
Ingress Controller
Ingress Resource
Service
EndpointSlice
Pod
Container

Ingress Resource

An Ingress resource can route traffic using:

Host names
URL paths
Backend Service names
Service ports
TLS configuration

Ingress Controller

An Ingress resource does not process traffic by itself.
At least one Ingress Controller must be installed in the cluster for the rules to be fulfilled.

IngressClass

IngressClass identifies the controller that should process an Ingress resource.
The Ingress can select a class with:

ingressClassName

If the field is not set, the cluster may use a default IngressClass when one is configured.

Host-based routing

Different host names can route to different Services.

frontend.example.local
api.example.local

Path-based routing

Different paths under the same host can route to different Services.

example.local/
example.local/api

Path types

Prefix

Matches the configured path and matching subpaths.

/api
/api/users
/api/products

Exact

Matches only the exact path.

/api

It does not match:

/api/users

ImplementationSpecific

Path matching behavior is defined by the selected Ingress Controller.
Use it only when controller-specific behavior is required.

Backend Service and port

The Ingress backend points to a Kubernetes Service.
The backend port must match a port exposed by that Service.
It does not normally point directly to the container port.

Example relationship

Ingress backend port: 80
Service port: 80
Service targetPort: 8080
Container port: 8080

TLS

Ingress can terminate HTTPS when a TLS Secret is configured.
The Secret normally contains:

tls.crt
tls.key

The Secret must exist in the same namespace as the Ingress resource.

Important limitations

Ingress is designed mainly for HTTP and HTTPS traffic.
Behavior can differ between Ingress Controller implementations.
The Ingress API is stable, but new networking features are generally developed through the Gateway API.

Troubleshooting path

Ingress
Service
EndpointSlice
Pod
Container

Common problems

Ingress Controller is not installed.
The selected IngressClass does not exist.
The host name does not resolve to the controller address.
The request Host header does not match the Ingress rule.
The path or pathType is incorrect.
The backend Service name is incorrect.
The backend Service port is incorrect.
The Service selector does not match the Pod labels.
The EndpointSlice has no ready endpoints.
The container is not listening on the expected port.
The application does not serve the requested path.
