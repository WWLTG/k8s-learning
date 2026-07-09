StatefulSet Lab 01 Solution and Verification

Final fixes applied

Fixed the StorageClass name.

Changed storageClassName from fast-local-storage to standard.

Fixed the Headless Service selector.

Changed the Service selector from app: redis-cache to app: redis.

Fixed the StatefulSet serviceName.

Changed serviceName from redis-internal to redis-headless.

Fixed the Redis persistent data path.

Changed the volume mount path from /redis-data to /data.

Final verification commands

kubectl get pods -n statefulset-lab-01
kubectl get pvc -n statefulset-lab-01
kubectl get svc -n statefulset-lab-01
kubectl get endpoints -n statefulset-lab-01
kubectl get endpointslices -n statefulset-lab-01 -o wide
kubectl get statefulset redis -n statefulset-lab-01

DNS verification

kubectl exec -n statefulset-lab-01 dns-test -- nslookup redis-0.redis-headless.statefulset-lab-01.svc.cluster.local
kubectl exec -n statefulset-lab-01 dns-test -- nslookup redis-1.redis-headless.statefulset-lab-01.svc.cluster.local
kubectl exec -n statefulset-lab-01 dns-test -- nslookup redis-2.redis-headless.statefulset-lab-01.svc.cluster.local

Persistent data verification

kubectl exec -n statefulset-lab-01 redis-0 -- redis-cli SET labkey statefulset-fixed
kubectl exec -n statefulset-lab-01 redis-0 -- redis-cli GET labkey
kubectl delete pod redis-0 -n statefulset-lab-01
kubectl wait --for=condition=Ready pod/redis-0 -n statefulset-lab-01 --timeout=120s
kubectl exec -n statefulset-lab-01 redis-0 -- redis-cli GET labkey

Final results

All Redis Pods are Running and Ready.

redis-0 is Running and Ready.
redis-1 is Running and Ready.
redis-2 is Running and Ready.

All PVCs are Bound.

redis-data-redis-0 is Bound.
redis-data-redis-1 is Bound.
redis-data-redis-2 is Bound.

The Headless Service has endpoints.

The stable Pod DNS names resolve correctly.

Redis data survives deleting and recreating redis-0.

Lessons learned

StatefulSet depends on stable identity.

The Headless Service selector must match the Pod labels.

The StatefulSet serviceName must match the Headless Service name.

volumeClaimTemplates create one PVC for each Pod.

A wrong StorageClass blocks the first Pod and stops the StatefulSet from continuing normally.

Mounting the PVC is not enough.
The application must write data inside the mounted path.
