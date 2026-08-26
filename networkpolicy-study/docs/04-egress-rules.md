Egress Rules

Egress rules control traffic leaving selected Pods.

The policy-level podSelector chooses the source Pods protected by the policy.

The egress.to section chooses allowed destinations.

A destination can be selected by:

podSelector
namespaceSelector
podSelector and namespaceSelector together

A ports section can restrict the destination port and protocol.

When Egress is restricted, DNS traffic may also need an explicit allow rule.
