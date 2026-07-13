Changed the Egress Pod selector from app=frontend to app=web.

Changed the Ingress Namespace selector from network-access=trusted to access=trusted.

Verification

The approved client in the application Namespace can access the web service.

The blocked client in the application Namespace cannot access the web service.

The client in the trusted Namespace can access the web service.

The client in the untrusted Namespace cannot access the web service.

The approved client cannot access the API service.

DNS resolution from the approved client works.

