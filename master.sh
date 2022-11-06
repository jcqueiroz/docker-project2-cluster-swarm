#!/bin/bash
sudo docker swarm init --advertise-addr=10.10.0.250
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh
sudo apt install curl -y
sudo curl -L https://downloads.portainer.io/portainer-agent-stack.yml -o portainer-agent-stack.yml
sudo docker stack deploy --compose-file=portainer-agent-stack.yml portainer
sudo docker service create --name my_nginx --replicas 8 --publish published=8080,target=80 nginx