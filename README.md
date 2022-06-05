# Ulake hadoop system

Basing on docker-hadoop [project](https://github.com/big-data-europe/docker-hadoop)
of big-data-europe. This fork version is modified to become the storage system of
ulake project which is a private data lake project of USTH university.

# Note

(2022-06-05)
For deploying hdfs cluster on docker swarm:

1. Boot up namenode

```
cd ./deployment && ./start-namenode.sh
```

2. Boot up datanode cluster

```
docker stack deploy -c ./docker-compose-hdfs-v4.yml ulake-hadoop
```

3. If datanode and namenode clusterID miss match, then clear docker volume

```
docker volume prune
```
