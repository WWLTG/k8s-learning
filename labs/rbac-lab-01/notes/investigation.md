# Investigation

## Observed failure

The pod-reader ServiceAccount cannot get or list Pods in the rbac-lab-01 namespace

kubectl auth can-i returns no

## Evidence

The rbac-client Pod uses the pod-reader ServiceAccount

The Role allows get list and watch on Pods

The RoleBinding subject references the pod-reader ServiceAccount in the default namespace

The tested identity belongs to the rbac-lab-01 namespace

## Root cause

The ServiceAccount namespace in the RoleBinding subject is incorrect

The RoleBinding grants permissions to the pod-reader ServiceAccount in the default namespace instead of the pod-reader ServiceAccount in rbac-lab-01

