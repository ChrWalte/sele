# sele

small asp.net static file share
sele comes from the word "serve" and "file"
the project came out of my need for easy static file serving
I needed to serve compiled binaries and compressed zipped files

## installing

### download compiled binaries

to run the compiled binaries one must have the following installed:

- [dotnet](https://dotnet.microsoft.com/en-us/)

the only way to download the executable is to download the source code. the compiled binaries can be seen in the .bin folder where each version will be listed along with a zip of it. the binaries are the compiled program from my Windows machine using arm64. other platform binaries will be released later on you may also compile the source code yourself using the dotnet compiler. a real download method will be developed and the binaries will be removed.

start the compiled binaries by running the executable:

`sele.exe`

or start the compiled library by running with dotnet:

`dotnet sele.dll`

### compile source code

to compile the source code one must have the following installed:

- [git source control](https://git-scm.com/)
- [dotnet](https://dotnet.microsoft.com/en-us/)

one can open the sele solution file (sele.sin) in visual studio and compile the source code.

otherwise, compile using the dotnet cli:

`dotnet build -c release`

or

`dotnet publish -c release`

## docker container

three docker containers are available:

- [[release-version]chrwalte/sele:latest](https://hub.docker.com/repository/docker/chrwalte/sele)
- [[development-version]chrwalte/sele.dev:latest](https://hub.docker.com/repository/docker/chrwalte/sele.dev)
- [STALE BETA BRANCH: FOREVER AT 0.2.1]-[[beta-version]chrwalte/sele.beta:0.2.1](https://hub.docker.com/repository/docker/chrwalte/sele.beta)

the container holds only sele and the dotnet runtime.
on startup the container will run:

`dotnet sele.dll`

sele will then follow the steps described in usage just from within the container.
the user is responsible for providing the correct files, folders, and persistance.

### docker-compose

a docker-compose file is also included in the source code.
this file can be used to run the container in a docker-compose environment.
the file supports both environment variables and a persistent volume for the configuration file and the serve folder.

to run the docker-compose file one must have the following installed:

- [docker-compose](https://docs.docker.com/compose/install/)

### kubernetes

a kubernetes deployment file (and helper scripts) are also included in the source code.
this file can be used to run the container in a kubernetes environment.
this file supports both environment variables and a persistent volume for the configuration file and the serve folder.

to run the kubernetes file one must know how to use kubernetes...
there are many ways of running kubernetes...here are a few that I have done:

first: one must have the kubernetes command line interface:

- [kubectl](https://kubernetes.io/docs/tasks/tools/)

next are the ways that one can use kubernetes (this is not all of them, this is what I have used when making this):

- [minikube](https://minikube.sigs.k8s.io/docs/) (on windows or wsl)

  - ensure minikube is installed, up, and running
  - start a minikube mount for the folder to be served: `minikube mount 'host-path':'minikube-path'`
    - Example: `minikube mount E:\\sele-share\:/sele/files`
  - run the deployment file: `kubectl apply -f kube.deploy.yml`
  - ensure everything is running: `kubectl get all`
  - expose the minikube nodeport: `minikube service sele`
    - Or: `minikube service --all`

## usage

to run the compiled binaries, one must have the following installed:

- [dotnet](https://dotnet.microsoft.com/en-us/)

start the compiled binaries by running the executable:

`sele.exe`

configuration file or/and environment variables:

sele will read the configuration file to get the settings on how to serve the files.

```jsonc
// serving file settings
"ServingFiles": {
  // the physical location of the files
  "FileLocation": "/files",

  // the request location of the files: /static/file_name
  "RequestLocation": "/static",

  // the port number to expose the files on
  "PortNumber": 80,

  // serve unsafe file types like: file (no extension)
  "ServeUnsafeFileTypes": false
}
```

sele will also check for environment variables that will override these configuration settings.

```shell
# the physical location of the files
SERVING_FILE_LOCATION=/sele/files
# the location of the files
SERVING_REQUEST_PATH=/files
# port number to serve on
PORT_NUMBER=80
# serve unsafe file types like: file (no extension)
ENABLE_UNSAFE_SERVING=false
```

sele will then serve the files from the physical location on the given port.

## contributing

create a fork of the source code repository, clone it, make the changes, and create a pull request. the pull request will be merged into the main breach.
