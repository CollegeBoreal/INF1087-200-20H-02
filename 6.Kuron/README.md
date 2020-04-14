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
$ gcloud beta container clusters create "kuron" \
       --num-nodes "3" \
       --machine-type "f1-micro" \
       --zone "us-central1-a" \
       --release-channel "rapid" \
       --enable-ip-alias
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

#### :bulb: not so needed create params

```
       --project "b300098957" \
       --no-enable-basic-auth \
       --network "projects/b300098957/global/networks/default" \
       --subnetwork "projects/b300098957/regions/us-central1/subnetworks/default" \
       --default-max-pods-per-node "110" \
       --image-type "COS" --disk-type "pd-standard" --disk-size "30" \
       --no-enable-master-authorized-networks \
       --metadata disable-legacy-endpoints=true \
       --addons HorizontalPodAutoscaling,HttpLoadBalancing --enable-autoupgrade --enable-autorepair \
       --no-enable-stackdriver-kubernetes \
```

* Scopes

```
       --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append"
```
