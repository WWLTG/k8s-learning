# Investigation

## Observed failure

The config-reader ServiceAccount cannot get or list ConfigMaps in the rbac-lab-02 namespace

Permission checks return no

## Evidence

The rbac-client Pod uses the config-reader ServiceAccount

The Role exists with the name configmap-reader

The RoleBinding references a Role named config-reader

The API server reports that the config-reader Role does not exist

## Root cause

The roleRef name in the RoleBinding does not match the actual Role name

The RoleBinding references config-reader instead of configmap-reader

