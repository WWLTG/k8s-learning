Solution and Verification

Solution

Changed the requested ConfigMap key from application.properties to app.properties.

The path remains app.properties, so the file is mounted inside the container at /etc/app/app.properties.

Verification

The Deployment rolled out successfully.

The Pod is running and ready.

The configuration file was mounted successfully.

Verification Commands

kubectl rollout status deployment/configmap-volume-demo -n configmap-volume-lab

kubectl get pods -n configmap-volume-lab

kubectl exec deployment/configmap-volume-demo -n configmap-volume-lab -- cat /etc/app/app.properties

Expected File Content

APP_ENV=production

LOG_LEVEL=info

FEATURE_FLAG=enabled

