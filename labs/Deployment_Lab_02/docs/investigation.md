#! Investigation

The third Deployment revision used an invalid container image.

The new Pods entered the following state:

ImagePullBackOff

The rollout could not complete because Kubernetes was unable to pull the requested image.

The previous healthy Pods remained available during the failed rollout.

# Root Cause

The container image name was invalid:

nginx:version-does-not-exist

