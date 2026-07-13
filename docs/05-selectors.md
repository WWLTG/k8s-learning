Selectors

Policy Pod Selector

spec.podSelector selects the Pods to which the NetworkPolicy applies.

Ingress Source Pod Selector

ingress.from.podSelector selects allowed source Pods.

Egress Destination Pod Selector

egress.to.podSelector selects allowed destination Pods.

Namespace Selector

namespaceSelector selects Namespaces by Namespace labels.

Combined Selectors

When podSelector and namespaceSelector are inside the same list item, both conditions must match.

Separate List Items

When podSelector and namespaceSelector are separate list items, either source can match.

Common mistake

A Pod label and a Namespace label are different objects.
Always inspect both before writing a selector.
