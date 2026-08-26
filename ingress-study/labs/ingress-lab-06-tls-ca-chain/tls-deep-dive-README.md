TLS Deep Dive Labs

This repository contains one broken Kubernetes TLS lab.

Current lab

labs/tls-lab-10-ca-chain

Start here

1. Open the lab directory.
2. Read README.md.
3. Apply the manifests.
4. Investigate the TLS failure.
5. Fix only the logical certificate chain problem.
6. Document your investigation and final verification.

Important rules

Do not use insecure TLS mode as final validation.
Do not change the hostname.
Do not change the Ingress host.
Do not replace the server private key.
Do not add the solution before investigation.
