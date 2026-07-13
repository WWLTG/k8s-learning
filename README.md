NetworkPolicy Study

Scope

Pod isolation
Ingress rules
Egress rules
Pod selectors
Namespace selectors

Learning level

Junior DevOps

Project workflow

1. Read the concept files in docs.
2. Review the YAML files in examples without applying them.
3. Read the inspection commands.
4. Enter labs/networkpolicy-lab-01.
5. Apply only the broken lab manifests.
6. Test connectivity from each client.
7. Investigate before editing any manifest.
8. Complete investigation.md.
9. Commit the investigation separately.
10. Fix one problem at a time.
11. Verify every required and blocked connection.
12. Create solution-and-verification.md only after the lab works.

Important

The lab is intentionally broken.
The solution is not included.
The first Git commit preserves the untouched broken state.
All Kubernetes commands must be run inside the k8s toolbox environment.

Official reference

https://kubernetes.io/docs/concepts/services-networking/network-policies/
