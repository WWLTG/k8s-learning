NetworkPolicy Lab 02 - Namespace Selector Incident

Scenario

A web application is running in its own namespace.

A trusted client namespace should be allowed to access the web Service.

An untrusted client namespace should be blocked.

Expected behavior

The trusted client can access the web Service.

The untrusted client cannot access the web Service.

Starting incident

The web Deployment is healthy.

The Service has an Endpoint.

Both clients fail to access the web Service.

Investigation path

Client Pod
Service
Endpoint
Destination Pod
NetworkPolicy

Rules

Do not edit the manifests before completing the baseline tests.

Investigate the Service and Endpoint before assuming the application is broken.

Document only the observed failure, evidence, and root cause.
