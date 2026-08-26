NetworkPolicy Debugging Method

1. Confirm the source and destination Pods are Running.
2. Confirm the Service has endpoints.
3. Test the connection before changing anything.
4. List policies in the relevant Namespace.
5. Find which policies select the source Pod.
6. Find which policies select the destination Pod.
7. Inspect Pod labels.
8. Inspect Namespace labels.
9. Compare selectors character by character.
10. Check allowed ports and protocols.
11. Remember that source Egress and destination Ingress must both allow the connection.
12. Retest from the same source Pod after every change.
