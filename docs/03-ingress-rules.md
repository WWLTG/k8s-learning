Ingress Rules

Ingress rules control traffic entering selected Pods.

The policy-level podSelector chooses the destination Pods protected by the policy.

The ingress.from section chooses allowed traffic sources.

A source can be selected by:

podSelector
namespaceSelector
podSelector and namespaceSelector together

A ports section can restrict the allowed destination port and protocol.

A podSelector inside ingress.from without a namespaceSelector selects Pods only from the same Namespace as the policy.
