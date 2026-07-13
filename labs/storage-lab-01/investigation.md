Observed failure

The storage-demo Pod remains Pending and is not scheduled to the node.

Evidence

The PersistentVolumeClaim storage-app-data is Bound to storage-lab-01-pv.

The Pod references a PersistentVolumeClaim named storage-app-data-claim.

The scheduler reports:

persistentvolumeclaim "storage-app-data-claim" not found

Root cause

The Deployment references the wrong PersistentVolumeClaim name. The existing claim is storage-app-data, but the Pod specification requests storage-app-data-claim.

