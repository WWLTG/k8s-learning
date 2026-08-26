Kubernetes Storage Lab 01

Objective

Investigate and repair one broken storage relationship.

The lab contains:

- One StorageClass
- One static PersistentVolume
- One PersistentVolumeClaim
- One Deployment that mounts persistent storage

Expected initial result

- The StorageClass is created.
- The PV and PVC can bind.
- The Deployment does not become Ready.
- The Pod remains Pending because one storage reference is incorrect.

Rules

- Apply the manifests without editing them first.
- Do not inspect Git history for a solution.
- Investigate from the Pod toward the storage resources.
- Use kubectl get, describe, jsonpath, and events.
- Fix only the direct root cause.
- Keep the lab lightweight.

Apply the broken lab

kubectl apply -f manifests/

Suggested first checks

kubectl get deployment,pod -n storage-lab-01
kubectl get pvc -n storage-lab-01
kubectl get pv
kubectl get storageclass

Documentation after investigation

Create investigation.md with only:

Observed failure
Evidence
Root cause

Documentation after the fix

Create solution-and-verification.md with only:

Change
Verification

Verification goals

- The PVC is Bound.
- The PV is Bound.
- The Deployment is Available.
- The Pod is Running and Ready.
- The mounted file can be read.
- The data remains after the Pod is recreated.

Cleanup after the complete lab, only when needed

kubectl delete namespace storage-lab-01
kubectl delete pv storage-lab-01-pv
kubectl delete storageclass manual-local
