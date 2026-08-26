Resource Requests and Limits

Overview

Kubernetes uses resource requests and limits to describe how much CPU and memory a container needs and how much it may use.

Requests

A request is the amount of a resource Kubernetes uses when scheduling a Pod.

The scheduler checks whether a node has enough allocatable resources for the sum of the Pod container requests.

A request is not a command that immediately consumes that amount of CPU or memory.

CPU request example:

cpu: 100m

This means one tenth of one CPU.

Memory request example:

memory: 64Mi

This means 64 mebibytes.

Limits

A limit is the maximum amount of a resource that the container is allowed to use.

CPU limits are enforced by throttling CPU time.

Memory limits are enforced reactively. A container that exceeds its memory limit can be terminated by the kernel with an out-of-memory event.

Requests and limits together

A common pattern is:

requests:
  cpu: 50m
  memory: 64Mi
limits:
  cpu: 200m
  memory: 128Mi

The request helps Kubernetes place the Pod.

The limit protects the node and other workloads from unexpected resource usage.

CPU units

1 CPU means one CPU unit.

500m means half a CPU.

100m means one tenth of a CPU.

CPU values are absolute quantities.

Memory units

Common binary units are:

Ki
Mi
Gi

Be careful with unit spelling.

64Mi is very different from 64Gi.

A unit typo can make a valid manifest impossible to schedule.

Scheduling behavior

Scheduling is based primarily on requests.

If no node has enough allocatable capacity for a Pod request, the Pod stays Pending.

The useful evidence normally appears in:

kubectl describe pod

kubectl get events

Limits and missing requests

When a limit is specified but the matching request is omitted, Kubernetes can copy the limit value and use it as the request unless an admission mechanism has already supplied a default.

Pod totals

For normal container-level resources, the Pod request for a resource is the sum of the requests of all containers in the Pod.

The Pod limit is similarly the sum of the container limits.

Quality of Service

Kubernetes assigns a Quality of Service class to each Pod.

Guaranteed

Every container has CPU and memory requests and limits, and each request equals its matching limit.

Burstable

At least one container has a CPU or memory request or limit, but the Pod does not meet all Guaranteed requirements.

BestEffort

No container has CPU or memory requests or limits.

The QoS class can be inspected with:

kubectl get pod POD_NAME -n NAMESPACE -o jsonpath='{.status.qosClass}{"\n"}'

Relationship with HPA

CPU-based HPA utilization is commonly calculated relative to the CPU request.

Incorrect or missing CPU requests can therefore make HPA behavior incorrect or unavailable.

Scope of this project

This project focuses on container-level CPU and memory requests and limits.

LimitRange and ResourceQuota are separate namespace policy concepts and will be studied in later projects.
