#!/bin/bash

# Node: namenode must be available
# Node: volume must be available

HOST="$1"
STATIC_IP="$2"
ENV_FILE="../hadoop.env"
NAMENODE="hdfs://ulake-Hnamenode:9000"
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
    --ip $STATIC_IP \
    -d bde2020/hadoop-datanode:2.0.0-hadoop3.2.1-java8
