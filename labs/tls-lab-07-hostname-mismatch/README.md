TLS Lab 07

Certificate hostname mismatch

Goal

Investigate a TLS failure where the certificate is trusted by the provided CA, but the certificate hostname does not match the Ingress host.

Rules

Do not change the Deployment first.
Do not change the Service first.
Start from the TLS client error.
Inspect the served certificate.
Compare the requested hostname with the certificate SAN.
Document the investigation before applying the fix.

Expected starting behavior

The application should be reachable only if certificate hostname verification is ignored.

The normal TLS verification should fail.
