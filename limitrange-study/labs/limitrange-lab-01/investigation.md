LimitRange Lab 01 Investigation

Symptoms

The defaults-demo Pod was created successfully and reached the Running state.

The policy-demo Deployment was created, but it had zero available replicas.

The Deployment reported the following condition:

ReplicaFailure: True
Reason: FailedCreate

No Pod with the app=policy-demo label was created.

Initial resource state

The defaults-demo Pod did not define resource requests or limits in its original manifest.

The policy-demo Container defined the following resources:

Requests:
CPU: 25m
Memory: 16Mi

Limits:
CPU: 600m
Memory: 512Mi

Inspection commands

kubectl get limitrange -n limitrange-lab-01

kubectl describe limitrange container-resource-policy -n limitrange-lab-01

kubectl describe pod defaults-demo -n limitrange-lab-01

kubectl describe deployment policy-demo -n limitrange-lab-01

kubectl describe replicaset policy-demo-8696899cc -n limitrange-lab-01

kubectl get pods -n limitrange-lab-01 -l app=policy-demo

kubectl get events -n limitrange-lab-01 --sort-by=.metadata.creationTimestamp

Observations

The defaults-demo Pod was annotated by the LimitRanger admission plugin.

The LimitRange injected the following resource values into the defaults-demo Container:

Requests:
CPU: 100m
Memory: 64Mi

Limits:
CPU: 200m
Memory: 128Mi

The Pod was classified as Burstable because its requests and limits were not equal.

LimitRange policy

The Container resource policy defined the following constraints:

Minimum:
CPU: 50m
Memory: 32Mi

Maximum:
CPU: 500m
Memory: 256Mi

Maximum limit-to-request ratio:
CPU: 4
Memory: 4

Default request:
CPU: 100m
Memory: 64Mi

Default limit:
CPU: 200m
Memory: 128Mi

Default injection result

The defaults-demo Container did not define any resources.

The LimitRanger admission plugin added both default requests and default limits before the Pod was stored and scheduled.

The defaults-demo Pod was accepted because the injected values satisfied all LimitRange constraints.

Admission failure evidence

The ReplicaSet events reported that Pod creation was forbidden.

The CPU request was 25m, which was lower than the required minimum of 50m.

The memory request was 16Mi, which was lower than the required minimum of 32Mi.

The CPU limit was 600m, which was higher than the allowed maximum of 500m.

The memory limit was 512Mi, which was higher than the allowed maximum of 256Mi.

The CPU limit-to-request ratio was:

600m / 25m = 24

The maximum allowed CPU ratio was 4.

The memory limit-to-request ratio was:

512Mi / 16Mi = 32

The maximum allowed memory ratio was 4.

The ReplicaSet controller repeatedly attempted to create the Pod, but every attempt was rejected by the LimitRanger admission plugin.

Root cause

The resource requests and limits in the policy-demo Deployment violated every major constraint defined by the Container LimitRange.

The requests were below the configured minimum values.

The limits were above the configured maximum values.

The limit-to-request ratios were higher than the configured maximum ratios.

The Deployment and ReplicaSet objects were accepted because their templates are not running Containers.

The actual Pod was rejected when the ReplicaSet attempted to create it.

The failure occurred during admission before scheduling, so no Pending Pod was created.

Lessons learned

LimitRange defaults are injected when an applicable object is admitted.

LimitRange validates the final Container resource values after default injection.

A Deployment can exist while its ReplicaSet cannot create Pods.

ReplicaSet events contain the detailed admission rejection message.

A LimitRange admission failure is different from a scheduler failure.

A scheduler failure usually leaves a Pod in the Pending state.

An admission failure prevents the Pod object from being created.

