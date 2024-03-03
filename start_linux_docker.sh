docker compose -f ./docker_scripts/host/docker-compose.yml up -d
sudo docker exec -it forhost-robotics-1 bash -c 'DISPLAY=host.docker.internal:0 bash'
