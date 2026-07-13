LimitRange Lab 01

Scenario

A Namespace has a LimitRange policy for Container CPU and memory.

The lab contains two workloads.

defaults-demo

This Pod does not declare resource requests or limits.
Use it to verify whether the LimitRange injects default values.

policy-demo

This Deployment is accepted, but its ReplicaSet cannot create the required Pod.
Investigate the resource policy and the workload template to identify every violated constraint.

Objectives

1. Apply the manifests without editing them.
2. Verify the LimitRange policy.
3. Inspect the final resource values injected into defaults-demo.
4. Determine why policy-demo has no running Pod.
5. Find the evidence in the ReplicaSet events.
6. Document the symptoms, investigation commands, observations, and root cause.
7. Fix the workload only after the investigation is complete.
8. Verify that the Deployment reaches its desired state.
9. Create solution-and-verification.md after the lab is solved.

Rules

Do not apply files from the project examples directory.
Do not edit the LimitRange during the initial investigation.
Do not generate artificial CPU or memory load.
Do not delete the local lab directory after completion.

Apply order

kubectl apply -f manifests/00-namespace.yaml
kubectl apply -f manifests/01-limitrange.yaml
kubectl apply -f manifests/02-defaults-demo-pod.yaml
kubectl apply -f manifests/03-broken-deployment.yaml

Initial inspection

kubectl get limitrange -n limitrange-lab-01
kubectl get deployment,replicaset,pod -n limitrange-lab-01
kubectl get events -n limitrange-lab-01 --sort-by=.metadata.creationTimestamp

Expected learning outcomes

Understand default and defaultRequest injection.
Understand min and max enforcement.
Understand maxLimitRequestRatio enforcement.
Recognize that a Deployment can exist while Pod admission fails.
Trace the failure from Deployment to ReplicaSet events.
