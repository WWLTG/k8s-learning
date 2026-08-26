HPA Lab 01 Solution and Verification

Problem

The HPA was created and targeted the Deployment correctly, but it could not calculate CPU utilization.

The HPA showed:

cpu: <unknown>/50%

The HPA condition showed:

ScalingActive: False
Reason: FailedGetResourceMetric

Investigation summary

The application Deployment rolled out successfully.
The application Pod was Running and Ready.

At first, kubectl top did not work.

kubectl top returned:

Metrics API not available

Metrics Server was installed as a cluster prerequisite.

In the local kind environment, Metrics Server needed this argument:

--kubelet-insecure-tls

After patching Metrics Server, the Metrics API became available.

kubectl top nodes worked.
kubectl top pods worked.

After Metrics Server was fixed, the HPA still could not calculate CPU utilization for the old Pod.

The HPA event showed:

missing request for cpu in container hpa-demo

Root cause

The Deployment container did not define a CPU request.

The HPA used CPU utilization percentage as the target.

CPU utilization percentage requires a CPU request because Kubernetes calculates utilization by comparing actual CPU usage against the requested CPU.

Without resources.requests.cpu, the HPA cannot calculate the CPU percentage.

Fix

Added resource requests and limits to the application container.

The Deployment container now defines:

resources:
requests:
cpu: 100m
memory: 64Mi
limits:
cpu: 500m
memory: 128Mi

Verification

The Deployment was applied again.

The rollout completed successfully.

The HPA changed from:

cpu: <unknown>/50%

to:

cpu: 1%/50%

The HPA condition changed to:

ScalingActive: True
Reason: ValidMetricFound

The load generator was restarted.

CPU usage increased.

kubectl top pods showed CPU usage on the application Pods.

The HPA scaled the Deployment up to 5 replicas.

The HPA showed:

cpu: 194%/50%
REPLICAS: 5

Later it showed:

cpu: 158%/50%
REPLICAS: 5

Final result

The HPA is working correctly.

The Deployment can now be scaled automatically based on CPU utilization.

The lab is solved.

