
# kubernetes re-deployment script
# deletes the existing deployment and the re-applys a new one

# delete existing kube deployment, if any
Write-Host "[CMD]: kubectl delete -f ./../kube.deploy.ym"
kubectl delete -f ./../kube.deploy.yml

# show current deployment
Write-Host "[CMD]: kubectl get all"
kubectl get all

# apply new deployment
Write-Host "[CMD]: kubectl apply -f ./../kube.deploy.yml"
kubectl apply -f ./../kube.deploy.yml

# show new deployment
Write-Host "[CMD]: kubectl get all"
kubectl get all

# wait for pods to be ready
Write-Host "[CMD]: kubectl get pods --watch"
kubectl get pods --watch
