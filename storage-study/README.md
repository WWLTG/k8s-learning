Kubernetes Storage Study

Goal

Understand the Kubernetes storage concepts required for a Junior DevOps role:

- Volume
- PersistentVolume (PV)
- PersistentVolumeClaim (PVC)
- StorageClass

Learning scope

- Ephemeral and persistent storage
- How a Pod mounts a Volume
- How a PVC requests storage
- How a PV provides storage
- How a StorageClass groups storage behavior
- Static and dynamic provisioning
- Basic access modes and reclaim policies
- Storage troubleshooting with kubectl

Out of scope

- CSI driver internals
- Volume snapshots
- Cloud-specific storage administration
- Distributed storage systems
- Production storage architecture

Project structure

- docs: concise concept notes and the ODT quick review
- examples: manifests for reading only
- commands: inspection and troubleshooting commands
- labs/storage-lab-01: one broken practical lab

Study workflow

1. Read docs/storage-concepts.md.
2. Review the manifests in examples without applying them.
3. Review commands/storage-inspection.md.
4. Enter the Kubernetes toolbox environment.
5. Initialize Git from the storage-study project root.
6. Preserve the untouched broken lab in the first commit.
7. Apply only labs/storage-lab-01/manifests.
8. Investigate the failure before editing any manifest.
9. Create investigation.md after the investigation.
10. Commit the investigation separately.
11. Fix only the identified root cause.
12. Verify binding, Pod startup, mounting, and persistence.
13. Create solution-and-verification.md.
14. Commit the final solution.

First Git commit

git init
git add .
git commit -m "Add broken Kubernetes Storage lab"

Important

The examples are for reading only. Do not apply them unless they are explicitly needed later.
