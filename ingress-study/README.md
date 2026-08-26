Ingress Study

Purpose

This project reviews the Kubernetes Ingress concept through short documentation, reference examples, inspection commands, and one broken troubleshooting lab.

Study order

1. Read concept.md or Ingress-Concept.odt.
2. Review the files inside examples.
3. Review inspection-commands.md.
4. Apply only the broken lab manifests.
5. Investigate without editing the manifests first.
6. Complete investigation.md.
7. Commit the investigation.
8. Fix the lab.
9. Complete solution-and-verification.md.
10. Commit the final solution.

Important rules

The example manifests are for reading and reference only.
Do not apply the examples unless they are explicitly needed.
The lab starts in a broken state.
Do not edit the lab before collecting evidence.
Follow this troubleshooting path:

Ingress
Service
EndpointSlice
Pod
Container

Ingress Controller requirement

An Ingress resource requires an Ingress Controller for real traffic routing.
Before end-to-end testing, confirm that the cluster has an installed Ingress Controller and an appropriate IngressClass.
The lab does not install or manage an Ingress Controller.
