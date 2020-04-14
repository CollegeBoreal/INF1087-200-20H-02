# :six: Kuron Boreal


## :o: Prérequis


https://console.cloud.google.com/

:round_pushpin: S'assurer d'avoir positionner ses identifiants `google`

```
$ export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcp/b300098957-a2662a9bd338.json"
```

:round_pushpin: Créer sa grappe `kuron`

```
$ gcloud container clusters create kuron --num-nodes 3 --machine-type f1-micro --zone "us-central1-a"
```

:round_pushpin: Assurez vous d'activer votre context avec `kubectl`, vérifiez l'étoile

```
$ kubectl config get-contexts
CURRENT   NAME                          CLUSTER                       AUTHINFO                        NAMESPACE
*         gke_pid_us-central1-a_kuron   gke_pid_us-central1-a_kuron   gke_pid_us-central1-a_kuron   
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



# :x: Cleanup

```
$ gcloud container clusters delete kuron --zone "us-central1-a"
```
