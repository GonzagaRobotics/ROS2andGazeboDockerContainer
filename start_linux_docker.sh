xhost +local:*
docker compose -f ./host/DockerDev/docker-compose-linux.yml up -d
docker exec -it forhost-robotics-1 bash
