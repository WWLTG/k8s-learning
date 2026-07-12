Resource Lab 01 Solution and Verification

Solution

The memory units in the Deployment manifest were corrected.

The original resource configuration was:

Memory request:

64Gi

Memory limit:

128Gi

The corrected resource configuration is:

Memory request:

64Mi

Memory limit:

128Mi

The CPU values were already appropriate for the lightweight nginx workload and were not changed.

Final resource configuration

Requests:

CPU: 25m

Memory: 64Mi

Limits:

CPU: 100m

Memory: 128Mi

Commands used

kubectl apply -f labs/resource-lab-01/manifests/01-deployment.yaml

kubectl rollout status deployment/resource-demo -n resource-lab-01

kubectl get deployment,pod -n resource-lab-01

kubectl get deployment resource-demo -n resource-lab-01 -o jsonpath='{.spec.template.spec.containers[0].resources}{"\n"}'

kubectl get pod -n resource-lab-01 -o jsonpath='{.items[0].status.qosClass}{"\n"}'

Verification results

The Deployment rollout completed successfully.

The Deployment reported:

Ready replicas: 1

Available replicas: 1

Up-to-date replicas: 1

The new Pod reported:

Ready: 1/1

Status: Running

Restarts: 0

Verified resource requests

CPU request:

25m

Memory request:

64Mi

Verified resource limits

CPU limit:

100m

Memory limit:

128Mi

Quality of Service

The Pod Quality of Service class was:

Burstable

The Pod is classified as Burstable because CPU and memory requests and limits are configured, but the request values are lower than their corresponding limit values.

Final result

The corrected memory request fits within the allocatable resources of the node.

The scheduler successfully assigned the Pod to the node.

The container started without using any load generator or stress test.

The Deployment reached its desired state with one available replica.

Lessons learned

Kubernetes uses resource requests when scheduling Pods.

A valid YAML resource unit can still represent an incorrect and unrealistic value.

64Mi and 64Gi are significantly different resource quantities.

Resource limits do not determine whether a Pod initially fits on a node in this scenario. The memory request caused the scheduling failure.

Pod template changes cause a Deployment to create a new ReplicaSet and replace the old Pod.

Requests and limits should be appropriate for the workload and the available cluster capacity.

