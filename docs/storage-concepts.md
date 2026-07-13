Kubernetes Storage Concepts

1. Volume

A Volume gives containers in a Pod access to storage through a mounted directory.

The Volume is declared in:

spec.volumes

The container uses it through:

spec.containers[].volumeMounts

The lifetime of the data depends on the Volume type.

Example:

emptyDir is created for a Pod and survives container restarts, but its data is removed when the Pod is removed from the node.

2. PersistentVolume

A PersistentVolume, usually called a PV, is a cluster-level storage resource.

A PV describes available storage, including:

- Capacity
- Access modes
- Storage class
- Reclaim policy
- Volume source

Common PV phases:

- Available: not yet bound
- Bound: connected to a PVC
- Released: the PVC was deleted, but the resource was not reclaimed yet
- Failed: automatic reclaiming failed

3. PersistentVolumeClaim

A PersistentVolumeClaim, usually called a PVC, is a request for storage from a workload or user.

A PVC normally requests:

- Storage capacity
- Access mode
- Storage class

A Pod does not normally mount a PV directly. It references a PVC, and the PVC binds to a suitable PV.

The binding between one PV and one PVC is exclusive.

4. StorageClass

A StorageClass describes a category of storage and how it should be provided.

Important fields include:

- provisioner
- reclaimPolicy
- volumeBindingMode
- allowVolumeExpansion

Dynamic provisioning

A StorageClass with a working provisioner can create a PV automatically after a PVC requests storage.

Static provisioning

An administrator creates the PV first. A matching PVC then binds to it.

A StorageClass can also be used as a matching label between a static PV and PVC.

5. Storage relationship

The normal relationship is:

Pod Volume
  -> PersistentVolumeClaim
  -> PersistentVolume
  -> Storage backend

The StorageClass participates in provisioning or matching the requested storage.

6. Access modes

ReadWriteOnce (RWO)

The volume can be mounted as read-write by a single node.

ReadOnlyMany (ROX)

The volume can be mounted as read-only by multiple nodes.

ReadWriteMany (RWX)

The volume can be mounted as read-write by multiple nodes.

ReadWriteOncePod (RWOP)

The volume can be mounted as read-write by a single Pod.

Support depends on the storage driver and backend.

7. Reclaim policies

Retain

The PV and its data are kept for manual handling after the PVC is deleted.

Delete

The storage resource is deleted when the claim is released, when supported by the provisioner.

8. Junior DevOps troubleshooting path

Start from the workload and follow the storage relationship:

Pod
  -> Volume definition
  -> PVC name and status
  -> PV binding and status
  -> StorageClass
  -> Events

Typical failures include:

- Wrong PVC name in the Pod
- PVC remains Pending
- PV and PVC do not match
- Requested StorageClass does not exist
- Unsupported access mode
- Requested capacity is larger than the available PV
- Mount or permission failure on the node
