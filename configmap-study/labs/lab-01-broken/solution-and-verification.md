Solution and Verification

Solution

Changed the ConfigMap name from application-config to app-config.

Changed the ConfigMap key from APP_MODE to APP_ENV.

Verification

The Deployment rolled out successfully.

The Pod is running and ready.

The environment variables were verified inside the container.

APP_ENV=production

LOG_LEVEL=info

WELCOME_MESSAGE=ConfigMap lab is running

Verification Commands

kubectl rollout status deployment/configmap-demo -n configmap-lab

kubectl get pods -n configmap-lab

kubectl exec deployment/configmap-demo -n configmap-lab -- printenv APP_ENV

kubectl exec deployment/configmap-demo -n configmap-lab -- printenv LOG_LEVEL

kubectl exec deployment/configmap-demo -n configmap-lab -- printenv WELCOME_MESSAGE

