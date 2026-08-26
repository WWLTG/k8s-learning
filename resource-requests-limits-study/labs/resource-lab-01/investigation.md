Resource Lab 01 Investigation

Initial symptom

The resource-demo Deployment had zero available replicas.

The created Pod remained in the Pending state and was not assigned to a node.

Commands used

kubectl get pod -n resource-lab-01

kubectl get deployment resource-demo -n resource-lab-01

kubectl describe pod resource-demo-6b69c68fbd-pjbh6 -n resource-lab-01

kubectl get node kind-control-plane -o jsonpath='{.status.allocatable.memory}{"\n"}'

kubectl get deployment resource-demo -n resource-lab-01 -o jsonpath='{.spec.template.spec.containers[0].resources}{"\n"}'

kubectl get events -n resource-lab-01 --sort-by=.metadata.creationTimestamp

Observed workload state

The Deployment showed zero ready and zero available replicas.

The ReplicaSet successfully created one Pod.

The Pod remained Pending with the following scheduling condition:

PodScheduled: False

The Pod had no assigned node:

Node: <none>

Pod events

The scheduler reported:

0/1 nodes are available: 1 Insufficient memory.

Preemption was not helpful because there were no workloads that could free enough memory for the requested amount.

Declared resource requests

CPU request:

25m

Memory request:

64Gi

Declared resource limits

CPU limit:

100m

Memory limit:

128Gi

Node allocatable resources

The kind-control-plane node reported the following allocatable memory:

16009712Ki

This is approximately 15.3Gi of allocatable memory.

Comparison between Pod requests and node capacity

The Pod requested 64Gi of memory.

The only cluster node had approximately 15.3Gi of allocatable memory.

The memory request was therefore much larger than the available node capacity.

The CPU request was small and was not the cause of the scheduling failure.

Root cause

The Deployment manifest used an incorrect memory unit and requested 64Gi instead of a small Mi value appropriate for the lightweight nginx container.

Because Kubernetes schedules Pods according to their resource requests, the scheduler could not assign the Pod to the only node.

The Pod remained Pending and the container never started.

Evidence

Pod status:

Pending

Scheduling condition:

PodScheduled: False

Assigned node:

None

Scheduler event:

FailedScheduling: Insufficient memory

Pod memory request:

64Gi

Node allocatable memory:

Approximately 15.3Gi

