ResourceQuota Study

Purpose

This project studies namespace-level resource and object quotas in Kubernetes.

Main comparison

LimitRange controls defaults and constraints for an individual Container, Pod, or PersistentVolumeClaim.

ResourceQuota controls the total resource usage and object count across a Namespace.

Project layout

docs/
Concept notes.

examples/
Reference manifests. Do not apply them as part of the lab.

commands/
Useful inspection commands.

labs/resourcequota-lab-01/
A lightweight broken lab with one logical policy error.

Lab workflow

1. Read the concept notes.
2. Review the examples and inspection commands.
3. Enter labs/resourcequota-lab-01.
4. Apply only the lab manifests.
5. Investigate without editing the manifests.
6. Create investigation.md with only the failure, evidence, and root cause.
7. Commit the investigation.
8. Fix the single policy error.
9. Verify the desired state.
10. Create a concise solution-and-verification.md.
11. Commit the solution.

All Kubernetes commands should run inside the k8s toolbox environment.
