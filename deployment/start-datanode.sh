#!/bin/bash

# Node: namenode must be available
# Node: volume must be available

ENV_FILE="../hadoop.env"
NAMENODE="hdfs://ulake-Hnamenode:9000"
HOST="$1"
PORT=9864
NET="ulake-network"
VOLUME="/home/hieplnc/Desktop/ulake/deployment/data/hdfs"

docker run --name $HOST \
    --restart on-failure \
    --env-file $ENV_FILE \
    -e CORE_CONF_fs_defaultFS=$NAMENODE \
    -e SERVICE_PRECONDITION="ulake-Hnamenode:9870" \
    -v $VOLUME:/hadoop/dfs/data \
    -p $PORT:$PORT \
    --network $NET \
    -d bde2020/hadoop-datanode:2.0.0-hadoop3.2.1-java8
