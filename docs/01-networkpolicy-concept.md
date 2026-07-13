NetworkPolicy Concept

A NetworkPolicy controls network traffic for selected Pods.

A policy does not create traffic.
It only allows or blocks traffic for the Pods selected by spec.podSelector.

NetworkPolicy works in two independent directions.

Ingress

Traffic entering a selected Pod.

Egress

Traffic leaving a selected Pod.

A Pod can be isolated for Ingress, Egress, both, or neither.

Policies are additive.
When more than one policy selects the same Pod, all allowed rules are combined.

For a connection to succeed:

The source Pod Egress rules must allow it.
The destination Pod Ingress rules must allow it.

A NetworkPolicy requires a CNI implementation that supports policy enforcement.
