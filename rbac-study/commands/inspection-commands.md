# RBAC Inspection Commands

## Objects

```bash
kubectl get serviceaccount,role,rolebinding -n rbac-lab-01
kubectl get serviceaccount pod-reader -n rbac-lab-01 -o yaml
kubectl get role pod-reader -n rbac-lab-01 -o yaml
kubectl get rolebinding pod-reader-binding -n rbac-lab-01 -o yaml
```

## Describe

```bash
kubectl describe serviceaccount pod-reader -n rbac-lab-01
kubectl describe role pod-reader -n rbac-lab-01
kubectl describe rolebinding pod-reader-binding -n rbac-lab-01
```

## Pod identity

```bash
kubectl get pod rbac-client -n rbac-lab-01 \
  -o jsonpath='{.spec.serviceAccountName}{"\n"}'
```

## Authorization checks

```bash
kubectl auth can-i get pods -n rbac-lab-01 \
  --as=system:serviceaccount:rbac-lab-01:pod-reader

kubectl auth can-i list pods -n rbac-lab-01 \
  --as=system:serviceaccount:rbac-lab-01:pod-reader

kubectl auth can-i delete pods -n rbac-lab-01 \
  --as=system:serviceaccount:rbac-lab-01:pod-reader

kubectl auth can-i --list -n rbac-lab-01 \
  --as=system:serviceaccount:rbac-lab-01:pod-reader
```

## Events

```bash
kubectl get events -n rbac-lab-01 --sort-by='.lastTimestamp'
```
