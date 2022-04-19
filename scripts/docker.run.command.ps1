
# docker container from image script
# runs the docker container as a docker command

# kubernetes re-deployment script
# deletes the existing deployment and the re-applys a new one

Write-Host "[CMD]: docker run -d -i --rm -p 8080:8080 -e SERVING_FILE_LOCATION=/sele/files -e SERVING_REQUEST_PATH=/f -e PORT_NUMBER=8080 -e ENABLE_UNSAFE_SERVING=false -v ./docker.static.files:/sele/files -v ./src/appsettings.json:/sele/appsettings.json --name sele101 chrwalte/sele:1.0.1"

docker run -d -i --rm -p 8080:8080 -e SERVING_FILE_LOCATION=/sele/files -e SERVING_REQUEST_PATH=/f -e PORT_NUMBER=8080 -e ENABLE_UNSAFE_SERVING=false -v ./docker.static.files:/sele/files -v ./src/appsettings.json:/sele/appsettings.json --name sele101 chrwalte/sele:1.0.1
