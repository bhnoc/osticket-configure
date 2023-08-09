#!/bin/bash
wget https://github.com/osTicket/osTicket/archive/refs/tags/v1.18.tar.gz
tar -zxvf v1.18.tar.gz 
mv osTicket-1.18 app
docker build -f build/Dockerfile -t bhnoc/osticket:latest .
