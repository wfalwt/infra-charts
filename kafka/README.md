## kafka deploy

### deploy kafka cluster example
```shell
helm install kafka-ixdl19 -n common kafka --set zookeeper.name=ixdl19 --set zookeeper.storageClass=data-nfs-storage --set kafka.name=ixdl19 --set kafka.storageClass=data-nfs-storage
```

### deploy parameters
- **zookeeper.name**  zookeeper cluster name 


