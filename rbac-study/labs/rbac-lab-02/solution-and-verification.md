# Solution and Verification

## Change

Updated the RoleBinding roleRef to reference the existing Role named configmap-reader

Kept the subject linked to the config-reader ServiceAccount in the rbac-lab-02 namespace

Because roleRef cannot be changed on an existing RoleBinding the old RoleBinding was deleted and recreated

## Verification

The RoleBinding now references the configmap-reader Role

The subject is the config-reader ServiceAccount in the rbac-lab-02 namespace

Permission checks returned

get configmaps yes

list configmaps yes

watch configmaps yes

delete configmaps no

The required read permissions are granted

Delete permission remains denied because it is not included in the Role

