Ingress Examples

These files are reference examples only.
Do not apply them during the first review.

01-basic-ingress.yaml

Routes one host and one path to one Service.

02-path-routing.yaml

Routes different URL paths to different Services.

03-host-routing.yaml

Routes different host names to different Services.

04-tls-ingress.yaml

Shows TLS configuration using a Kubernetes TLS Secret.

Before using any example, replace ingressClassName with a class that exists in the target cluster.
The referenced Deployments, Services, and Secrets are intentionally not included.
