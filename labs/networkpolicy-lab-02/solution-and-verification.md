# Solution and Verification

# Change

Updated the NetworkPolicy namespaceSelector from access=allowed to access=trusted.

# Verification

 The trusted client successfully accessed the web Service.
 The untrusted client timed out and remained blocked.
 The web Pod, Service, and EndpointSlice remained healthy.
