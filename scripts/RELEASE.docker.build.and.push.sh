
# RELEASE docker build and push script
# builds the docker image and pushes it to the docker hub

# exit when any command fails
set -e

# TODO: add a way of passing in an extension to the VERSION variable.
# sh ./RELEASE.docker.build.and.push.sh "amd64" OR "arm64" OR "aarch64"

# variables
# docker hub profile
PROFILE="chrwalte"
# project name
PROJECT="sele"
# version of the project
VERSION=$(cat ../VERSION)

# TODO: add docker buildx support
# TODO: update to support multiple architectures.
# docker buildx does not MAGICALLY do multi-arch builds.
# research into how to do this and update it.
# needed architectures:
# linux/amd64
# linux/arm64
# linux/aarch64

# action (docker commands with logs)
# log command
echo "[CMD]: docker build --no-cache -t $PROJECT:$VERSION .."
# run docker buildx with all kinds of options
docker build --no-cache -t $PROJECT:$VERSION ..
# log command
echo "[CMD]: docker tag $PROJECT:$VERSION $PROFILE/$PROJECT:$VERSION"
# run docker tag with all kinds of options
docker tag $PROJECT:$VERSION $PROFILE/$PROJECT:$VERSION
# log command
echo "[CMD]: docker push $PROFILE/$PROJECT:$VERSION"
# run docker push with all kinds of options
docker push $PROFILE/$PROJECT:$VERSION

# finished
echo "[INFO]: FINISHED RELEASE ($PROFILE/$PROJECT:$VERSION)!"
