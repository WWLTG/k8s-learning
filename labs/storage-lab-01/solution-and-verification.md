Change

Updated the Deployment volume claimName from storage-app-data-claim to storage-app-data.

Verification

The Deployment successfully rolled out and the Pod became Running.

The PersistentVolumeClaim remained Bound to storage-lab-01-pv and was used by the storage-demo Pod.

After deleting the original Pod, Kubernetes created a new Pod and the previously written file remained available, confirming persistent storage.

