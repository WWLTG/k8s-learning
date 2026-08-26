Horizontal Pod Autoscaler Concept

What HPA does
Horizontal Pod Autoscaler automatically changes the number of Pod replicas for a scalable workload.

Common scalable targets
- Deployment
- StatefulSet
- ReplicaSet

HPA usually does not scale DaemonSet workloads.

Main idea
HPA watches metrics, compares the current value with the target value, and updates the replica count.

Common metric source
CPU utilization is the most common first learning example.

Important requirement for CPU utilization
For CPU utilization based HPA, the container should define CPU requests.

Without CPU requests, Kubernetes cannot calculate utilization percentage correctly.

Metrics pipeline
HPA needs metrics from the Kubernetes metrics API.

In many local clusters, you need Metrics Server for resource metrics.

Important fields
apiVersion
Use autoscaling/v2.

scaleTargetRef
This points the HPA to the workload that should be scaled.

minReplicas
The lowest number of replicas HPA can keep.

maxReplicas
The highest number of replicas HPA can create.

metrics
This defines what HPA watches.

Example CPU target
averageUtilization: 50

This means HPA tries to keep average CPU utilization close to 50 percent of requested CPU.

Common symptoms
TARGETS shows <unknown>/50%.

The HPA event says it cannot get metrics.

The HPA event says missing request for cpu.

Pods are running, but replicas do not increase.

Debugging direction
1. Check the HPA object.
2. Check HPA events.
3. Check Metrics Server or metrics API.
4. Check Pod metrics with kubectl top.
5. Check Deployment resource requests.
6. Check load traffic.
7. Check replica changes.

References
Kubernetes HPA concept:
https://kubernetes.io/docs/concepts/workloads/autoscaling/horizontal-pod-autoscale/

Kubernetes HPA walkthrough:
https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/

Kubernetes HPA API autoscaling/v2:
https://kubernetes.io/docs/reference/kubernetes-api/autoscaling/horizontal-pod-autoscaler-v2/

Metrics Server:
https://kubernetes-sigs.github.io/metrics-server/
