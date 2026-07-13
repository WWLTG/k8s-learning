LimitRange Study

Purpose

This project studies how Kubernetes LimitRange policies control resource requests and limits inside a Namespace.

Study workflow

1. Read docs/limitrange-overview.md.
2. Review the files under examples/. Do not apply them.
3. Review commands/inspection-commands.txt.
4. Enter labs/limitrange-lab-01.
5. Initialize Git from the limitrange-study project root.
6. Preserve the untouched broken lab in the first commit.
7. Apply only the lab manifests.
8. Investigate before editing any manifest.
9. Complete investigation.md after identifying the symptoms and root cause.
10. Fix the lab step by step and verify the result.
11. Create solution-and-verification.md only after the fix is complete.

First Git commit

git init
git add .
git commit -m "Add broken LimitRange lab"

Safety

This lab does not generate CPU, memory, disk, network, or GPU load.
It uses one lightweight pause Pod and one Deployment whose invalid Pod is rejected during admission.
