#!/bin/bash

TOKEN=$(docker swarm join-token -q worker)

for i in 2 3; do
  eval $(docker-machine env node-$i)

  docker swarm join \
  --token $TOKEN   \
  --advertise-addr $(docker-machine ip node-$i) \
 $(docker-machine ip node-1):2377

done
