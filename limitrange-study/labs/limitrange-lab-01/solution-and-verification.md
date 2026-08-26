LimitRange Lab 01 Solution and Verification

Solution

The policy-demo Deployment used resource requests and limits that violated the Container LimitRange.

The original values were:

Requests:
CPU: 25m
Memory: 16Mi

Limits:
CPU: 600m
Memory: 512Mi

The Deployment manifest was updated with the following values:

Requests:
CPU: 100m
Memory: 64Mi

Limits:
CPU: 200m
Memory: 128Mi

The updated requests were greater than or equal to the configured minimum values.

The updated limits were lower than or equal to the configured maximum values.

The CPU limit-to-request ratio was:

200m / 100m = 2

The memory limit-to-request ratio was:

128Mi / 64Mi = 2

Both ratios were lower than the maximum allowed ratio of 4.

Apply command

kubectl apply -f labs/limitrange-lab-01/manifests/03-broken-deployment.yaml

Verification commands

kubectl rollout status deployment/policy-demo -n limitrange-lab-01

kubectl get deployment,replicaset,pod -n limitrange-lab-01

kubectl get pod policy-demo-5646cc746d-jb6gq -n limitrange-lab-01 -o jsonpath='{.spec.containers[0].resources}{"\n"}'

kubectl describe deployment policy-demo -n limitrange-lab-01

Verification results

The policy-demo Deployment successfully completed its rollout.

The Deployment reached one desired replica, one updated replica, and one available replica.

A new ReplicaSet was created from the corrected Pod template.

The new ReplicaSet successfully created one Pod.

The new Pod reached the Running state and became Ready.

The old ReplicaSet was scaled down to zero replicas.

The final Container resource values were:

Requests:
CPU: 100m
Memory: 64Mi

Limits:
CPU: 200m
Memory: 128Mi

The final values satisfied the minimum, maximum, and maximum limit-to-request ratio rules.

The defaults-demo Pod remained Running with the values injected by the LimitRanger admission plugin.

Final result

The LimitRange default injection behavior was verified successfully.

The LimitRange admission rejection behavior was verified successfully.

The policy-demo Deployment was corrected and successfully created a running Pod.

The lab was completed without generating artificial CPU or memory load.

Lessons learned

LimitRange applies default resource values to Containers that omit them.

LimitRange can reject Pod creation when resource requests or limits violate its policy.

The detailed rejection reason is visible in ReplicaSet events.

A rejected Pod does not remain Pending because the Pod object is never admitted.

Updating a Deployment creates a new ReplicaSet with the corrected Pod template.

The old ReplicaSet remains at zero replicas as part of the Deployment revision history.

