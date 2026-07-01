Kubernetes Secret Study

Purpose

This project introduces Kubernetes Secret and provides one broken troubleshooting lab.

Study order

1. Read concept/kubernetes-secret-concept.odt
2. Review the files under examples
3. Review commands/secret-checks.md
4. Preserve the broken lab with the first Git commit
5. Apply only labs/secret-lab-01/manifests
6. Investigate without editing the manifests
7. Complete notes/investigation.md
8. Commit the investigation
9. Fix the broken manifest
10. Complete notes/solution-and-verification.md
11. Commit the solved lab

Important rules

Do not apply the example manifests unless they are needed for a separate test.
Do not edit the broken lab before collecting evidence.
Do not place real passwords, tokens, certificates, or private keys in this repository.
Base64 encoding is not encryption.

Initial Git commit

git init
git branch -M main
git add .
git commit -m "Add broken Secret lab"

Later commit names

git commit -m "Document Secret investigation"
git commit -m "Solve and verify Secret lab"
