#!/bin/bash

TOKEN= $(docker swarm join-token -q worker)

function creat3() {
for i in 1 2 3; do
  docker-machine create -d virtualbox node-$i
done
}

for i in 2 3; do
  
  eval ($docker-machine env node-1)

  docker swarm join \
  --token $TOKEN    \
  --advertise-addr $(docker-machine ip node-$1) \
  $(docker-machine ip node-1):2377

done

