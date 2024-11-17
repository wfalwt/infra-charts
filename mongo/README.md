# ebsig MongoDB Charts
## Description
- MongoDB version on 4.2 , see [image on DockerHub](https://hub.docker.com/layers/library/mongo/4.2/images/sha256-8e4934b7587cada40588d16f6628cb2bf51d3fc1e2f5f9cfda3c223dc32917b4?context=explore)
- init replica set by [mongo-k8s-sidercar](https://github.com/cvallance/mongo-k8s-sidecar) 
- support authentication
- support mongodump backup data file with archive to specified pvc



## Value 
- **mongo.name**  mongodb replicaset name, consider as mongodb cluster instance id
- **mongo.wtCache**  wireTiger cache size (GB)
- **mongo.storage.storageClassName**  Kubernetes resource storageClass name, mongodb persistence storage
- **mongo.enablePodAntiAffinity** enable pod anti-affinity,pod will be deployed on different node

## deploy mongodb replicaset example
- use command to deploy
```shell
helm install mongo-ixdl19 -n wepaas ebsig-mongo --set mongo.name=ixdl19 --set mongo.wtCache=0.5 --set mongo.storage.storageClassName=data-nfs-storage
```
- use values.yaml
```yaml
#content for values.yaml
mongo:
  name: mindforce
  wtCache: 0.5
  auth:
    enable: false
    user: admin
    password: thankyou
    database: admin
  storage:
    storageClassName: data-nfs-storage
    capacity: 10Gi
  resoures:
    requests:
      cpu: 100m
      memory: 500Mi
    limits:
      cpu: 1000m
      memory: 2Gi
  exporter:
    enable: true
  enablePodAntiAffinity: true
  dump:
    enable: false
    cron: "59 23 * * *"
    datapvc: dump-pvc
    capacity: 10Gi
nodeSelector: {}
tolerations: []
```
**use command to deploy**
```shell
helm install mongo-mindforce -f values.yaml ebsig-charts/ebsig-mongo
```

