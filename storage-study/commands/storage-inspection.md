Kubernetes Storage Inspection Commands

Show StorageClasses

kubectl get storageclass
kubectl get storageclass -o wide
kubectl describe storageclass <storage-class-name>

Show PersistentVolumes

kubectl get pv
kubectl get pv -o wide
kubectl describe pv <pv-name>

Show PersistentVolumeClaims

kubectl get pvc -A
kubectl get pvc -n <namespace>
kubectl describe pvc <pvc-name> -n <namespace>

Show workload status

kubectl get deployment,pod -n <namespace>
kubectl describe pod <pod-name> -n <namespace>

Show the Volume definitions used by a Pod

kubectl get pod <pod-name> -n <namespace> \
  -o jsonpath='{.spec.volumes}'

echo

Show container Volume mounts

kubectl get pod <pod-name> -n <namespace> \
  -o jsonpath='{.spec.containers[*].volumeMounts}'

echo

Show PVC binding details

kubectl get pvc <pvc-name> -n <namespace> \
  -o jsonpath='{.status.phase}{"\n"}{.spec.volumeName}{"\n"}{.spec.storageClassName}{"\n"}'

Show PV claim reference

kubectl get pv <pv-name> \
  -o jsonpath='{.status.phase}{"\n"}{.spec.claimRef.namespace}{"/"}{.spec.claimRef.name}{"\n"}'

Show recent events

kubectl get events -n <namespace> --sort-by=.metadata.creationTimestamp

Recommended troubleshooting order

kubectl get pod -n <namespace>
kubectl describe pod <pod-name> -n <namespace>
kubectl get pvc -n <namespace>
kubectl describe pvc <pvc-name> -n <namespace>
kubectl get pv
kubectl get storageclass
kubectl get events -n <namespace> --sort-by=.metadata.creationTimestamp
