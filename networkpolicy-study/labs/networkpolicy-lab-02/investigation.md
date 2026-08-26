# Investigation

## Observed failure

Both trusted and untrusted clients timed out when accessing the web Service.

## Evidence

- The web Pod was running and Nginx responded locally.
- The Service had a valid EndpointSlice pointing to the web Pod.
- The trusted namespace had the label `access=trusted`.
- The NetworkPolicy allowed only namespaces with `access=allowed`.
- No namespace matched `access=allowed`.

## Root cause

The NetworkPolicy namespaceSelector used the wrong label value.

It selected `access=allowed` instead of `access=trusted`.
