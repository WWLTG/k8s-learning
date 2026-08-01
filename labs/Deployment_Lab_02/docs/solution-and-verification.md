#! Solution and Verification

The Deployment was rolled back to revision 2.

Kubernetes created revision 4 using the configuration from revision 2.

All three Pods became ready:

3/3 Ready

The active container image was verified as:

nginx:1.28.3-alpine

The failed ReplicaSet was scaled down to zero replicas.

