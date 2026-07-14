
# Kubernetes RBAC Concise Concept Review

# Mental Model

Identity
Role permissions
RoleBinding
Authorization decision

# ServiceAccount

A ServiceAccount is a namespaced identity used by workloads

A Pod uses the ServiceAccount defined in the Pod specification

spec:
serviceAccountName: pod-reader

If no ServiceAccount name is defined the Pod uses the default ServiceAccount from the same namespace

# Role

A Role contains permission rules inside one namespace

A Role commonly contains these fields

rules:

* apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list", "watch"]

The empty API group represents core Kubernetes resources such as Pods and Services

# RoleBinding

A RoleBinding connects a subject to a Role

subjects defines who receives the permissions

roleRef defines which Role supplies the permissions

A subject can be a user group or ServiceAccount

A RoleBinding grants access only inside the namespace where it exists

# Permissions

A permission rule combines API groups resources and verbs

Common verbs

get reads one object

list reads a collection of objects

watch observes changes

create creates objects

update replaces an object

patch partially modifies an object

delete deletes objects

RBAC rules are additive

Kubernetes RBAC does not use explicit deny rules

# Permission Check

kubectl auth can-i get pods -n rbac-lab-01 \
--as=system:serviceaccount:rbac-lab-01:pod-reader

The expected output is yes or no

# Investigation Order

Requested action

Tested identity

ServiceAccount namespace and name

RoleBinding subjects

RoleBinding roleRef

Role rules

Actual namespace

# Official References


- https://kubernetes.io/docs/concepts/security/service-accounts/
- https://kubernetes.io/docs/reference/access-authn-authz/rbac/
- https://kubernetes.io/docs/reference/access-authn-authz/authorization/
- https://kubernetes.io/docs/reference/kubectl/generated/kubectl_auth/kubectl_auth_can-i/
