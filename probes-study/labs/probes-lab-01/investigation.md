Probes Lab 01 Investigation

Symptoms

Both Pods were running but showed 0/1 readiness.

The Deployment had zero available replicas.

The Service had no endpoints.

The container restart count continued to increase.

Both Pods eventually entered CrashLoopBackOff.

Commands

kubectl get pods -n probes-lab

kubectl get deployment -n probes-lab

kubectl get service -n probes-lab

kubectl get endpoints -n probes-lab

kubectl describe pod probes-demo-656d994684-hftbl -n probes-lab

kubectl get deployment probes-demo -n probes-lab -o jsonpath='{.spec.template.spec.containers[0].readinessProbe}{"\n"}{.spec.template.spec.containers[0].livenessProbe}{"\n"}'

kubectl get pods -n probes-lab -w

Observations

The container exposes port 80 with the name http.

The readiness probe requested the path /ready on the named port http.

The readiness probe received HTTP status code 404.

The failed readiness probe kept the Pods in the NotReady state.

Because the Pods were not ready, the Service endpoints remained empty.

The liveness probe requested the path / on port 8080.

Nothing inside the container was listening on port 8080.

The liveness probe failed with connection refused.

After three consecutive liveness failures, kubelet restarted the container.

Repeated liveness failures caused the restart count to increase and the Pods to enter CrashLoopBackOff.

Root cause

The readiness probe used a path that does not exist in the default nginx content.

The liveness probe used port 8080 while nginx was listening on port 80.

The incorrect readiness path prevented the Pods from becoming ready.

The incorrect liveness port caused kubelet to repeatedly restart the containers.

