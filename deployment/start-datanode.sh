#!/bin/bash

# Node: namenode must be available

ENV_FILE="../hadoop.env"
NAMENODE="hdfs://192.168.22.9:9000"
HOST="ulake-Hdatanode2"
PORT=9864

docker run --name $HOST \
    --restart always \
    --env-file $ENV_FILE \
    -e CORE_CONF_fs_defaultFS=$NAMENODE \
    -e SERVICE_PRECONDITION="192.168.22.9:9870" \
    -p $PORT:$PORT \
    -d bde2020/hadoop-datanode:2.0.0-hadoop3.2.1-java8
