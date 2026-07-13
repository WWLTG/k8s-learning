ResourceQuota Lab 01

Scenario

A team wants two lightweight web replicas in one Namespace.

A LimitRange supplies default Container requests and limits.

A ResourceQuota controls the total Namespace budget.

Expected state

deployment/quota-demo should have 2 available replicas.

Current state

The manifests contain one logical policy error.

Tasks

1. Apply the manifests in numeric order.
2. Check the Deployment, ReplicaSet, Pods, LimitRange, and ResourceQuota.
3. Find the admission failure in the events.
4. Compare the per-Container defaults with the Namespace totals.
5. Identify the single incorrect policy value.
6. Do not edit the Deployment to bypass the policy.
7. Record the failure, evidence, and root cause in investigation.md.
8. Commit the investigation separately.
9. Fix the policy.
10. Verify that both replicas become available.
11. Record only the change and final verification in solution-and-verification.md.

Apply

kubectl apply -f manifests/00-namespace.yaml
kubectl apply -f manifests/01-limitrange.yaml
kubectl apply -f manifests/02-resourcequota.yaml
kubectl apply -f manifests/03-deployment.yaml

Initial checks

kubectl get deployment,replicaset,pod -n resourcequota-lab-01

kubectl describe resourcequota namespace-budget -n resourcequota-lab-01

kubectl get events -n resourcequota-lab-01 --sort-by=.metadata.creationTimestamp

Cleanup

kubectl delete namespace resourcequota-lab-01

Do not delete the local lab directory.
