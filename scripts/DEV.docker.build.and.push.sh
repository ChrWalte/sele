
# BETA docker build and push script
# builds the docker image and pushes it to the docker hub

# exit when any command fails
set -e

# variables
# docker hub profile
PROFILE="chrwalte"
# project name
PROJECT="sele.dev"
# version of the project
VERSION=$(cat ../VERSION)"dev"

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
echo "[INFO]: FINISHED dev ($PROFILE/$PROJECT:$VERSION)."
