Pod Isolation

Pods are non-isolated by default.

A Pod becomes isolated for Ingress when at least one NetworkPolicy selects it and includes Ingress in policyTypes.

A Pod becomes isolated for Egress when at least one NetworkPolicy selects it and includes Egress in policyTypes.

An empty rule list blocks all traffic for that direction.

Example meaning

podSelector: {}

Selects all Pods in the policy Namespace.

ingress: []

Allows no incoming traffic.

egress: []

Allows no outgoing traffic.

Isolation is based on labels, not Pod names.
