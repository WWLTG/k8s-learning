Resource Lab 01

Scenario

A small web Deployment was added to the cluster.

The manifest passes Kubernetes API validation, but the Pod does not become Running.

The application itself is lightweight and does not contain any stress or load command.

Goal

Investigate why the Pod cannot start.

Rules

- Apply the manifests without editing them first.
- Inspect the Deployment, ReplicaSet, Pod, events, and node resources.
- Do not replace the workload image.
- Do not add nodes.
- Do not change cluster configuration.
- Fix only the resource configuration required for this small workload.
- Keep CPU and memory requests and limits after the fix.
- Do not use a stress tool.
- Document evidence before changing the manifest.

Expected final state

- The Deployment has one available replica.
- The Pod is Running and Ready.
- CPU and memory requests remain configured.
- CPU and memory limits remain configured.
- The values are appropriate for this lightweight nginx workload.
- The local lab directory remains preserved in Git.
