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

Second issue

The Headless Service endpoints were fixed, but individual Pod DNS names still failed.

Commands used

kubectl get pod redis-0 -n statefulset-lab-01 -o jsonpath='{.spec.hostname}{"\n"}{.spec.subdomain}{"\n"}'
kubectl exec -n statefulset-lab-01 dns-test -- nslookup redis-0.redis-headless.statefulset-lab-01.svc.cluster.local
kubectl exec -n statefulset-lab-01 dns-test -- nslookup redis-1.redis-headless.statefulset-lab-01.svc.cluster.local
kubectl exec -n statefulset-lab-01 dns-test -- nslookup redis-2.redis-headless.statefulset-lab-01.svc.cluster.local

Observation

The Pods had subdomain redis-internal.
The Headless Service name is redis-headless.

Root cause

The StatefulSet serviceName did not match the Headless Service name.

Fix

Changed serviceName from redis-internal to redis-headless.

Verification

The Pods now have subdomain redis-headless.
The full Pod DNS names now resolve correctly.

Third issue

Redis data did not survive deleting redis-0.

Commands used

kubectl exec -n statefulset-lab-01 redis-0 -- redis-cli SET labkey statefulset-test
kubectl exec -n statefulset-lab-01 redis-0 -- redis-cli GET labkey
kubectl delete pod redis-0 -n statefulset-lab-01
kubectl wait --for=condition=Ready pod/redis-0 -n statefulset-lab-01 --timeout=120s
kubectl exec -n statefulset-lab-01 redis-0 -- redis-cli GET labkey

Observation

The key existed before deleting redis-0.
After redis-0 was recreated, the key was missing.

Root cause

Redis was configured to write data under /data.
The PVC was mounted under /redis-data.
Redis was writing outside the persistent volume.

Fix

Changed the volume mount path from /redis-data to /data.

Verification

After the fix, data written to redis-0 survived deleting and recreating redis-0.
