#!/bin/bash

ENV_FILE="../hadoop.env"
HOST="ulake-Hnamenode"
CLUSTER_NAME="ulake-hadoop"
NET="ulake-network"

docker run --name $HOST \
    --restart on-failure \
    --env-file $ENV_FILE \
    -e CLUSTER_NAME=$CLUSTER_NAME \
    --expose 9870 --expose 9000 \
    --network $NET \
    -d bde2020/hadoop-namenode:2.0.0-hadoop3.2.1-java8
