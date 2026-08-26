HPA Lab 01 Investigation

Goal

Investigate why the Horizontal Pod Autoscaler does not scale the application even while load is running.

Initial state

The lab resources were applied successfully.

The namespace was created.
The Deployment was created.
The Service was created.
The HPA was created.
The load generator Pod was created.

Observed resources

The Deployment rolled out successfully.

The application Pod became Running and Ready.

The HPA showed:

cpu: <unknown>/50%

The HPA conditions showed:

AbleToScale: True
ScalingActive: False
Reason: FailedGetResourceMetric

The HPA could not calculate CPU utilization.

Metrics API check

kubectl top failed at first with:

Metrics API not available

The cluster did not have a working Metrics API.

Metrics Server was installed as a cluster prerequisite.

After installation, Metrics Server was Running, but the APIService showed MissingEndpoints because the Metrics Server Pod was not Ready.

The Metrics Server Pod readiness probe failed with HTTP status code 500.

In the local kind environment, Metrics Server required the following argument:

--kubelet-insecure-tls

After patching the Metrics Server Deployment, the Metrics API became available.

kubectl top nodes worked.
kubectl top pods worked.

This confirmed that cluster metrics were available.

Deployment check

The Deployment was inspected with:

kubectl describe deployment hpa-demo -n hpa-lab-01

The container did not show any CPU request.

There was no Requests section under the container.

Root cause

The HPA uses CPU utilization percentage as the metric target.

CPU utilization percentage is calculated from the current CPU usage compared to the container CPU request.

The application container does not define resources.requests.cpu.

Because the CPU request is missing, the HPA cannot calculate CPU utilization for the Pod.

Conclusion

Metrics Server is now working.

The remaining problem is inside the Deployment manifest.

The Deployment must define a CPU request for the application container so the HPA can calculate CPU utilization and scale the Deployment.

