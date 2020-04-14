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

## :one: Déploiement de l'application node

https://hub.docker.com/r/collegeboreal/kuron

```
$ kubectl run kuron --image=collegeboreal/kuron --port=8080 --generator=run/v1
```




# :x: Cleanup

```
$ gcloud container clusters delete kuron --zone "us-central1-a"
```
