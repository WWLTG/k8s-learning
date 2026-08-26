# RBAC Lab 02

## Scenario

A workload uses the config-reader ServiceAccount and needs read-only access to ConfigMaps in the rbac-lab-02 namespace

The Pod is running but authorization checks return no

The lab contains one logical RBAC error

## Goal

Investigate the authorization path

ServiceAccount
RoleBinding subject
RoleBinding roleRef
Role rules
Namespace

Fix the error without adding extra permissions

## Apply

kubectl apply -f labs/rbac-lab-02/manifests/

## Baseline checks

kubectl get serviceaccount role rolebinding pod configmap -n rbac-lab-02

kubectl get pod rbac-client -n rbac-lab-02 \
  -o jsonpath='{.spec.serviceAccountName}{"\n"}'

kubectl auth can-i get configmaps -n rbac-lab-02 \
  --as=system:serviceaccount:rbac-lab-02:config-reader

kubectl auth can-i list configmaps -n rbac-lab-02 \
  --as=system:serviceaccount:rbac-lab-02:config-reader

kubectl auth can-i delete configmaps -n rbac-lab-02 \
  --as=system:serviceaccount:rbac-lab-02:config-reader

## Investigation commands

kubectl describe serviceaccount config-reader -n rbac-lab-02

kubectl describe role configmap-reader -n rbac-lab-02

kubectl describe rolebinding config-reader-binding -n rbac-lab-02

kubectl auth can-i --list -n rbac-lab-02 \
  --as=system:serviceaccount:rbac-lab-02:config-reader

kubectl get events -n rbac-lab-02 --sort-by='.lastTimestamp'

## Documentation workflow

Document the investigation before applying the fix

Use the concise structure in investigation.md

After verification complete solution-and-verification.md
