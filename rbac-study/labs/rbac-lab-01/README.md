# RBAC Lab 01 - ServiceAccount Permission Failure

## Goal

A workload ServiceAccount should be allowed to read Pods in `rbac-lab-01`, but the authorization check returns `no`.

The lab contains exactly one logical RBAC error.

## Covered concepts

- ServiceAccount identity
- Role rules
- RoleBinding subjects and roleRef
- Namespaced permissions
- `kubectl auth can-i`

## Resource usage

This lab creates one sleeping BusyBox Pod with very small resource requests and limits. It does not generate CPU, memory, disk, or network load.

## Step 1 - Preserve the broken state

From the `rbac-study` directory:

```bash
git init
git add .
git commit -m "Add broken RBAC lab"
```

## Step 2 - Apply the lab

Run inside the `k8s` toolbox:

```bash
kubectl apply -f labs/rbac-lab-01/manifests/
```

## Step 3 - Baseline checks

```bash
kubectl get serviceaccount,role,rolebinding,pod -n rbac-lab-01

kubectl get pod rbac-client -n rbac-lab-01 \
  -o jsonpath='{.spec.serviceAccountName}{"\n"}'

kubectl auth can-i get pods -n rbac-lab-01 \
  --as=system:serviceaccount:rbac-lab-01:pod-reader

kubectl auth can-i list pods -n rbac-lab-01 \
  --as=system:serviceaccount:rbac-lab-01:pod-reader

kubectl auth can-i delete pods -n rbac-lab-01 \
  --as=system:serviceaccount:rbac-lab-01:pod-reader
```

## Expected broken behavior

- The Pod should be `Running`.
- The Pod should use `pod-reader`.
- Reading Pods should unexpectedly return `no`.
- Deleting Pods should return `no` and must remain denied after the fix.

## Investigation rules

Do not edit YAML before collecting evidence.

Trace this path:

```text
Tested identity
-> ServiceAccount
-> RoleBinding subject
-> RoleBinding roleRef
-> Role rules
-> Namespace
```

Useful commands are available in:

```text
commands/inspection-commands.md
```

## Documentation checkpoint

Complete:

```text
labs/rbac-lab-01/notes/investigation.md
```

Then commit:

```bash
git add labs/rbac-lab-01/notes/investigation.md
git commit -m "Document RBAC investigation"
```

## Fix and verification checkpoint

Change only the exact field responsible for the permission failure.

Verify that:

- `get pods` returns `yes`.
- `list pods` returns `yes`.
- `delete pods` still returns `no`.

Complete:

```text
labs/rbac-lab-01/notes/solution-and-verification.md
```

Then commit:

```bash
git add labs/rbac-lab-01
git commit -m "Solve RBAC lab"
```

## Cleanup

```bash
kubectl delete namespace rbac-lab-01
```
