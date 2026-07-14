# rbac-study

A lightweight Kubernetes RBAC study project for Junior DevOps practice.

## Scope

- ServiceAccount
- Role
- RoleBinding
- Permissions
- `kubectl auth can-i`

## Project structure

```text
rbac-study/
├── docs/
│   └── Kubernetes_RBAC_Quick_Review_AR_EN.odt
├── examples/
├── commands/
└── labs/
    └── rbac-lab-01/
```

## Study workflow

1. Read `docs/rbac-concept.md`.
2. Review the example without applying it.
3. Enter `labs/rbac-lab-01/`.
4. Create the first Git commit while the lab is still broken.
5. Apply the manifests inside the `k8s` toolbox.
6. Run the baseline permission checks.
7. Investigate before changing YAML.
8. Document the investigation.
9. Fix one logical error only.
10. Verify allowed and denied actions.
11. Document the solution and create the final commit.

## First Git commit

```bash
git init
git add .
git commit -m "Add broken RBAC lab"
```

## Environment rule

Run all Kubernetes commands inside the `k8s` toolbox. The host should only start the required containers or services.
