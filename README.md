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

2. Boot up datanode

- Boot service in cluster (unstable)

```
docker stack deploy -c ./docker-compose-hdfs-v3.yml ulake-hadoop
```

- Boot manually on each node (stable)

```
cd ./deployment && ./start-datanode.sh <host_name>
```

3. If datanode and namenode clusterID miss match, then clear docker volume

```
docker volume prune
```
