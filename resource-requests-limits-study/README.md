Resource Requests and Limits Study

Purpose

This project introduces Kubernetes CPU and memory requests and limits through:
- concise concept documentation
- safe reference examples
- inspection commands
- one lightweight broken lab

Safety

This project does not use stress tools, load generators, busy loops, or large memory allocations.

The broken workload does not start. It remains Pending because its declared memory request cannot fit on the node. Declared requests do not consume the requested resource by themselves.

Study order

1. Read docs/resource-requests-and-limits.md
2. Review examples/01-basic-resources.yaml without applying it
3. Review commands/inspection-commands.txt
4. Initialize Git and preserve the broken state
5. Apply only the broken lab manifests
6. Investigate before editing the manifest
7. Complete investigation.md
8. Commit the investigation separately
9. Fix the lab interactively
10. Verify the workload
11. Create solution-and-verification.md only after solving
12. Commit the final solution

Initial Git commit

Run these commands from the project root:

git init
git add .
git commit -m "Add broken Resource Requests and Limits lab"

Important

Do not modify the broken manifest before the first commit.
Do not apply the example manifest.
Run all Kubernetes study commands inside the toolbox k8s environment.
