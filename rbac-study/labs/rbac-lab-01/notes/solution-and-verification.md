# Solution and Verification

## Change

Updated the ServiceAccount namespace in the RoleBinding subject

Changed the namespace from default to rbac-lab-01

The RoleBinding now grants the pod-reader Role to the correct ServiceAccount identity

## Verification

The RoleBinding subject now references

ServiceAccount pod-reader in namespace rbac-lab-01

Permission checks returned

get pods yes

list pods yes

watch pods yes

delete pods no

The required read permissions are granted

Delete permission remains denied because it is not included in the Role

