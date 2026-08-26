Ingress Lab 05 TLS Solution and Verification

Solution

The Ingress referenced an incorrect TLS Secret name.

Incorrect value:

secure-local-certificate

The existing TLS Secret was:

secure-local-tls

The Ingress TLS configuration was updated to use:

secure-local-tls

The corrected configuration:

secretName: secure-local-tls

Verification

The Ingress configuration was checked.

Command:

kubectl describe ingress secure-ingress -n ingress-lab-05

The TLS section showed:

secure-local-tls terminates secure.local

The configured Secret name was verified.

Command:

kubectl get ingress secure-ingress -n ingress-lab-05 -o jsonpath='{.spec.tls[0].secretName}{"\n"}'

Result:

secure-local-tls

The HTTPS connection was tested using the local certificate.

Command:

curl -v --cacert certs/tls.crt --resolve secure.local:9443:127.0.0.1 https://secure.local:9443/

The server presented the expected certificate:

CN=secure.local

The certificate hostname matched:

secure.local

Certificate verification succeeded.

The application returned:

HTTP/2 200

The request reached a running Pod successfully.

Final Result

TLS termination works correctly at the Traefik Ingress Controller.

Traefik uses the secure-local-tls Secret.

The client connection is encrypted with the secure.local certificate.

The request is routed successfully through the Service to the Pods.

