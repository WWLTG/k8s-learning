# Investigation

 Deployment inspection


kubectl describe deployment web-deployment -n deployment-lab-01

event:
  Warning  Unhealthy  2m29s (x64 over 7m33s)  kubelet            spec.containers{nginx}: Readiness probe failed: Get "http://10.244.0.6:8080/": dial tcp 10.244.0.6:8080: connect: connection refused


 ReplicaSet inspection


kubectl describe replicaset  -n deployment-lab-01 web-deployment-985869b9c

i see 
 Port:          80/TCP (http)
    Host Port:     0/TCP (http)
    Readiness:     http-get http://:8080/ delay=3s timeout=1s period=5s #success=1 #failure=2
should be 80 



 Pod inspection


kubectl describe -n deployment-lab-01 pod web-deployment-985869b9c-dtgjx

Events:
  Type     Reason     Age                  From               Message
  ----     ------     ----                 ----               -------
  Normal   Scheduled  16m                  default-scheduler  Successfully assigned deployment-lab-01/web-deployment-985869b9c-dtgjx to kind-control-plane
  Normal   Pulling    16m                  kubelet            spec.containers{nginx}: Pulling image "nginx:1.27-alpine"
  Normal   Pulled     15m                  kubelet            spec.containers{nginx}: Successfully pulled image "nginx:1.27-alpine" in 3.332s (17.34s including waiting). Image size: 20984244 bytes.
  Normal   Created    15m                  kubelet            spec.containers{nginx}: Container created
  Normal   Started    15m                  kubelet            spec.containers{nginx}: Container started
  Warning  Unhealthy  37s (x188 over 15m)  kubelet            spec.containers{nginx}: Readiness probe failed: Get "http://10.244.0.6:8080/": dial tcp 10.244.0.6:8080: connect: connection refused




kubectl logs  -n deployment-lab-01 web-deployment-985869b9c-dtgjx 
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2026/06/25 14:03:42 [notice] 1#1: using the "epoll" event method
2026/06/25 14:03:42 [notice] 1#1: nginx/1.27.5
2026/06/25 14:03:42 [notice] 1#1: built by gcc 14.2.0 (Alpine 14.2.0) 
2026/06/25 14:03:42 [notice] 1#1: OS: Linux 7.0.12-201.fc44.x86_64
2026/06/25 14:03:42 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 524288:524288
2026/06/25 14:03:42 [notice] 1#1: start worker processes
2026/06/25 14:03:42 [notice] 1#1: start worker process 37


notes

The container is running.
The Pod is not Ready.
The events provide the strongest clue.

