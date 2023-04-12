xhost +local:*
docker compose -f ./ForHost/docker-compose-linux.yml up -d
docker exec -it forhost-robotics-1 bash
