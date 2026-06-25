# Verification

## Rollout

```bash
kubectl rollout status deployment/web-deployment -n deployment-lab-01 --timeout=60s
```

Result:


## Resource status

```bash
kubectl get deployment,replicaset,pods -n deployment-lab-01
```

Result:


## Final checks

- [ ] Deployment has 3 available replicas.
- [ ] ReplicaSet has 3 ready replicas.
- [ ] All Pods show `1/1` Ready.
- [ ] No continuing warning events exist.

## English verification

```text
All three Pods are Ready.
The Deployment is fully available.
The rollout completed successfully.
```
