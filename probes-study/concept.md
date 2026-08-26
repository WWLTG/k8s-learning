Kubernetes Probes

Purpose

Probes allow the kubelet to check the condition of a container.
They help Kubernetes decide whether a container is ready for traffic, should be restarted, or needs more startup time.

Readiness Probe

A readiness probe decides whether a Pod can receive traffic.
When the probe fails, the Pod stays running but becomes NotReady.
Services remove that Pod from their ready endpoints.
A readiness failure does not restart the container.

Liveness Probe

A liveness probe decides whether a running container is still healthy.
When the probe fails enough times, the kubelet restarts the container.
A bad liveness probe can create unnecessary restarts or CrashLoopBackOff.

Startup Probe

A startup probe protects slow-starting applications.
While the startup probe is running, readiness and liveness checks do not control the container.
After the startup probe succeeds, the other probes begin normal operation.

Probe methods

httpGet

Sends an HTTP request to a path and port.
A response status from 200 through 399 is treated as success.

exec

Runs a command inside the container.
Exit code 0 means success.
Any other exit code means failure.

tcpSocket

Attempts to open a TCP connection to a port.
An accepted connection means success.

Important fields

initialDelaySeconds

Wait time before the first check.

periodSeconds

Time between checks.

timeoutSeconds

Maximum time allowed for one check.

failureThreshold

Number of consecutive failures before Kubernetes takes action.

successThreshold

Number of consecutive successes required after a failure.
For liveness and startup probes, this value must remain 1.

Common problems

The probe uses the wrong port.
The probe uses a path that the application does not provide.
The initial delay is too short.
The timeout is too small.
The failure threshold is too strict.
The same endpoint is used without considering readiness and liveness behavior.
The application depends on an external service and the liveness probe restarts it during an external outage.

Troubleshooting direction

Pod status
Events
Probe failure message
Container logs
Previous container logs
Application path and port
Service endpoints
