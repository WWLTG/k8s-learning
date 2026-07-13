Observed failure

The approved client in the application namespace cannot connect to the web service.

The client in the trusted namespace cannot connect to the web service.

Evidence

The web Service has a valid Endpoint and the web Pod is Running.

The approved client has the labels app=client and access=web.

The Egress policy allows traffic to Pods with app=frontend.

The actual web Pod has app=web and tier=frontend.

The trusted Namespace has the label access=trusted.

The Ingress policy requires the Namespace label network-access=trusted.

The blocked local client and the untrusted Namespace client are blocked as expected.

The approved client cannot access the API service as expected.

DNS resolution from the approved client works.

Root cause

The Egress policy uses an incorrect Pod selector for the web Pod.

The Ingress policy uses an incorrect Namespace selector for the trusted Namespace.

