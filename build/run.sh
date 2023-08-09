#!/bin/bash

NETWORK='bhnoc'
HOST='osticket'
PROJECT='osticket'
DOCKER_TAG='bhnoc/osticket:latest'
docker stop osticket
docker rm osticket
docker run -d --name osticket \
              -p80:80 \
              --cap-add=IPC_LOCK \
              -p443:443 \
              --network $NETWORK \
              -h osticket \
              --restart unless-stopped \
              -v /Users/nemus/Desktop/git/bhnoc/containers/osticket/config/:/var/www/config \
              $DOCKER_TAG
