StatefulSet Lab 01 Investigation

Symptoms

redis-0 was Pending.
The PVC redis-data-redis-0 was Pending.
The StatefulSet created only redis-0 at first.
redis-1 and redis-2 were not created until redis-0 became healthy.
The Headless Service had no endpoints.

Commands used

kubectl get pods -n statefulset-lab-01
kubectl get pvc -n statefulset-lab-01
kubectl get svc -n statefulset-lab-01
kubectl get endpoints -n statefulset-lab-01
kubectl describe statefulset redis -n statefulset-lab-01
kubectl get storageclass
kubectl describe pvc redis-data-redis-0 -n statefulset-lab-01

Observations

The cluster has a default StorageClass named standard.
The StatefulSet requested a StorageClass named fast-local-storage.
The PVC stayed Pending.
The PVC event showed:

storageclass.storage.k8s.io "fast-local-storage" not found

After changing the StorageClass to standard and recreating the StatefulSet and PVC, all Redis Pods became Running and Ready.
All three PVCs became Bound.

Root cause found so far

The first root cause was a wrong StorageClass name in volumeClaimTemplates.

Current remaining issue

The Headless Service still has no endpoints even though all Redis Pods are Running.

Notes

StatefulSet creates Pods in order.
If redis-0 is blocked, redis-1 and redis-2 do not continue normally.
