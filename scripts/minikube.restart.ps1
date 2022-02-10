
# minikube restart script
# stops the running minikube instance, deletes it, prunes docker, and starts minikube

# stop running minikube if any
Write-Host "[CMD]: minikube stop"
minikube stop

# delete minikube if any
Write-Host "[CMD]: minikube delete"
minikube delete

# clean docker images, containers and volumes
Write-Host "[CMD]: docker system prune -a --volumes -f"
docker system prune -a --volumes -f

# start minikube
Write-Host "[CMD]: minikube start"
minikube start
