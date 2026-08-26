Ingress Lab 05 TLS Investigation

Symptoms

The HTTPS request reached the application successfully.

The response returned:

HTTP/2 200

However, Traefik presented its default certificate:

CN=TRAEFIK DEFAULT CERT

Investigation

The TLS Secret existed in the namespace:

secure-local-tls

The Secret type was:

kubernetes.io/tls

The Ingress resource referenced a different Secret name:

secure-local-certificate

The application, Service, Endpoints, and Pods were working correctly.

Root Cause

The secretName value in the Ingress TLS configuration did not match the existing TLS Secret name.

Existing Secret:

secure-local-tls

Ingress secretName:

secure-local-certificate

Traefik could not find the referenced Secret and used its default certificate.

