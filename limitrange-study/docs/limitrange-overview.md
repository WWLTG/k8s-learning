LimitRange Overview

Definition

A LimitRange is a namespaced policy that controls resource requests and limits for individual objects such as Containers, Pods, and PersistentVolumeClaims.

Main capabilities

default

Supplies a default resource limit when a Container does not define one.

defaultRequest

Supplies a default resource request when a Container does not define one.

min

Defines the minimum allowed request or limit for the selected resource type.

max

Defines the maximum allowed request or limit for the selected resource type.

maxLimitRequestRatio

Defines the maximum allowed ratio between a resource limit and its request.

Admission behavior

The LimitRange admission controller first applies configured defaults to a new Pod.
It then validates the final Pod specification against the configured minimum, maximum, and ratio rules.

A Pod that violates the policy is rejected with a Forbidden error.

Existing Pods

Adding or changing a LimitRange does not modify Pods that already exist.
The policy is checked when an applicable object is created or updated.

Namespace scope

A LimitRange affects only the Namespace where it exists.

LimitRange and ResourceQuota

LimitRange controls an individual Container, Pod, or PersistentVolumeClaim.

ResourceQuota controls the total resource consumption or object count for an entire Namespace.

Important notes

Avoid defining multiple LimitRange objects that provide defaults in the same Namespace.
Kubernetes does not guarantee which default value is selected.

A LimitRange does not guarantee that injected defaults are logically consistent with values already supplied by the user.
Always verify the final Pod specification.

Common resource types

Container

Controls Container CPU and memory requests and limits.

Pod

Controls the total resource values allowed for a Pod.

PersistentVolumeClaim

Controls the minimum and maximum storage request for a PVC.
