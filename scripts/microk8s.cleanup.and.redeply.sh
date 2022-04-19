
# kubernetes re-deployment script
# deletes the existing deployment and the re-applys a new one

# exit when any command fails
set -e

# TODO: get from arg:
# kube deploy file
KUBE_DEPLOY_FILE="chrwalte.kube.deploy.yml"

# delete existing kube deployment, if any
echo "[CMD]: microk8s kubectl delete -f $KUBE_DEPLOY_FILE"
microk8s kubectl delete -f $KUBE_DEPLOY_FILE

# show current deployment
echo "[CMD]: microk8s kubectl get all"
microk8s kubectl get all

# apply new deployment
echo "[CMD]: microk8s kubectl apply -f $KUBE_DEPLOY_FILE"
microk8s kubectl apply -f $KUBE_DEPLOY_FILE

# show new deployment
echo "[CMD]: microk8s kubectl get all"
microk8s kubectl get all

# wait for pods to be ready
echo "[CMD]: microk8s kubectl get pods --watch"
microk8s kubectl get pods --watch
