
# docker compose redeploy script
# stops all containers listed in the docker-compose.yml file
# at the current directory, wipes the docker system, and then
# starts all the containers back up 

# exit when any command fails
set -e

# log command
echo "[CMD]: docker-compose down"
# stop all containers listed in docker-compose.yml file
docker-compose down

# log command
echo "[CMD]: docker system prune -a --volumes -f"
# clean the docker system
docker system prune -a --volumes -f

# log command
echo "[CMD]: docker-compose up -d"
# start all containers listed in docker-compose.yml file
docker-compose up -d

# finished
echo "[INFO]: FINISHED docker-compose redeploy!"
