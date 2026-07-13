ResourceQuota Concept

ResourceQuota limits the total resource consumption or object count inside one Namespace.

Compute resource quotas can limit totals such as:

requests.cpu
requests.memory
limits.cpu
limits.memory

Object count quotas can limit totals such as:

pods
services
configmaps
secrets
persistentvolumeclaims
count/deployments.apps

LimitRange and ResourceQuota

LimitRange works on each individual object.

It can add default requests and limits to a Container that does not define them.

ResourceQuota works on the Namespace total.

After LimitRange adds defaults, those values are counted by ResourceQuota.

Important behavior

When a new object would exceed a ResourceQuota, the API request is rejected.

For a Deployment, the Deployment object can exist while the ReplicaSet reports FailedCreate events because additional Pods were rejected.

Useful status fields

hard
The configured maximum values.

used
The values currently consumed inside the Namespace.
