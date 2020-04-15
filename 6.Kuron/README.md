# :six: Kuron Boreal

[kubectl cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet)

## :o: Prérequis


https://console.cloud.google.com/

:round_pushpin: S'assurer d'avoir positionner ses identifiants `google`

```
$ export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcp/b300098957-a2662a9bd338.json"
```

:round_pushpin: Créer sa grappe `kuron`


```
$ gcloud beta container clusters create "kuron" --zone "us-central1-a" \
                        --num-nodes "3" --release-channel "rapid" \
                        --machine-type "g1-small" --image-type "COS" \
                        --disk-type "pd-standard" --disk-size "30" \
                        --no-enable-stackdriver-kubernetes --no-enable-basic-auth \
                        --no-enable-master-authorized-networks \
                        --addons HorizontalPodAutoscaling,HttpLoadBalancing \
                        --enable-autoupgrade --enable-autorepair --enable-ip-alias                
```

:round_pushpin: Assurez vous d'activer votre context avec `kubectl`, vérifiez l'étoile

```
$ kubectl config get-contexts
CURRENT   NAME                          CLUSTER                       AUTHINFO                        NAMESPACE
*         gke_pid_us-central1-a_kuron   gke_pid_us-central1-a_kuron   gke_pid_us-central1-a_kuron   
```

:round_pushpin: Information sur sa grappe

```
$ kubectl cluster-info                 
```

```
% kubectl get nodes
NAME                                   STATUS   ROLES    AGE     VERSION
gke-kuron-default-pool-1e3feddf-8s94   Ready    <none>   2m32s   v1.16.8-gke.8
gke-kuron-default-pool-1e3feddf-c4tn   Ready    <none>   2m32s   v1.16.8-gke.8
gke-kuron-default-pool-1e3feddf-p2j8   Ready    <none>   2m32s   v1.16.8-gke.8
```

```
% gcloud compute firewall-rules list              
NAME                                     NETWORK  DIRECTION  PRIORITY  ALLOW                         DENY  DISABLED
default-allow-icmp                       default  INGRESS    65534     icmp                                False
default-allow-internal                   default  INGRESS    65534     tcp:0-65535,udp:0-65535,icmp        False
default-allow-rdp                        default  INGRESS    65534     tcp:3389                            False
default-allow-ssh                        default  INGRESS    65534     tcp:22                              False
docker-machines                          default  INGRESS    1000      tcp:2376                            False
gke-kuron-3fd17b28-all                   default  INGRESS    1000      tcp,udp,icmp,esp,ah,sctp            False
gke-kuron-3fd17b28-ssh                   default  INGRESS    1000      tcp:22                              False
gke-kuron-3fd17b28-vms                   default  INGRESS    1000      icmp,tcp:1-65535,udp:1-65535        False
k8s-dec7e94d017bc317-node-http-hc        default  INGRESS    1000      tcp:10256                           False
k8s-fw-a91d9566cf4db4da5a6a523d802bbedb  default  INGRESS    1000      tcp:8080                            False
```


## :zero: Déploiement de l'application node

```
$ kubectl apply -f kuron-deployment.yml 
```

```
$ kubectl get pods --show-labels
NAME                               READY   STATUS    RESTARTS   AGE    LABELS
kuron-deployment-8bf4f7f9f-5hm4n   1/1     Running   0          110s   app=kuron,pod-template-hash=8bf4f7f9f
kuron-deployment-8bf4f7f9f-d4d9l   1/1     Running   0          110s   app=kuron,pod-template-hash=8bf4f7f9f
kuron-deployment-8bf4f7f9f-xw4gz   1/1     Running   0          110s   app=kuron,pod-template-hash=8bf4f7f9f
```

```
$ kubectl apply -f kuron-deployment-services.yml 
```

```
$ kubectl get services                                                          
NAME                       TYPE           CLUSTER-IP   EXTERNAL-IP    PORT(S)          AGE
kubernetes                 ClusterIP      10.32.0.1    <none>         443/TCP          25m
kuron-deployment-service   LoadBalancer   10.32.3.1    34.70.183.28   8080:30237/TCP   11m
```

```
$ kubectl get pods                                                              
NAME                               READY   STATUS    RESTARTS   AGE
kuron-deployment-8bf4f7f9f-5hm4n   1/1     Running   0          20m
kuron-deployment-8bf4f7f9f-d4d9l   1/1     Running   0          20m
kuron-deployment-8bf4f7f9f-xw4gz   1/1     Running   0          20m
```

```
$ kubectl exec kuron-deployment-8bf4f7f9f-5hm4n -- curl -s http://10.32.3.1:8080
You've hit kuron-deployment-8bf4f7f9f-d4d9l
```

```
$ kubectl exec kuron-deployment-8bf4f7f9f-5hm4n -- curl -s http://10.32.3.1:8080
You've hit kuron-deployment-8bf4f7f9f-5hm4n
```

```
$ kubectl exec kuron-deployment-8bf4f7f9f-5hm4n -- curl -s http://10.32.3.1:8080
You've hit kuron-deployment-8bf4f7f9f-5hm4n
```

```
$ kubectl exec kuron-deployment-8bf4f7f9f-5hm4n -- curl -s http://10.32.3.1:8080
You've hit kuron-deployment-8bf4f7f9f-5hm4n
```

```
$ kubectl exec kuron-deployment-8bf4f7f9f-5hm4n -- curl -s http://10.32.3.1:8080
You've hit kuron-deployment-8bf4f7f9f-xw4gz
```

http://34.70.183.28:8080

## :one: Déploiement de l'application node

https://hub.docker.com/r/collegeboreal/kuron

:round_pushpin: Créer son premier `pod` par le biais d'un `Replication Controller`

```
$ kubectl run kuron --image=collegeboreal/kuron --port=8080 --generator=run-pod/v1
```

:round_pushpin: Vérifier son premier `pod`

```
$ kubectl get pods
NAME          READY   STATUS              RESTARTS   AGE
kuron-l4z2b   0/1     ContainerCreating   0          2m48s
```

:round_pushpin: Vérifier avancement


```
$ kubectl describe pod
```




# :x: Cleanup

```
$ gcloud container clusters delete kuron --zone "us-central1-a"
```

#### References

```
--project "b300098957" \
--metadata disable-legacy-endpoints=true \
--scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append"
--network "projects/b300098957/global/networks/default" \
--subnetwork "projects/b300098957/regions/us-central1/subnetworks/default" \
--default-max-pods-per-node "110" \
```

