# :six: Kuron Boreal


## :o: Prérequis


https://console.cloud.google.com/

:round_pushpin: S'assurer d'avoir positionner ses identifiants `google`

```
$ export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcp/b300098957-a2662a9bd338.json"
```

:round_pushpin: Créer sa grappe `kuron`

Assurez vous d'avoir un cluster GCP  disponible:

```
$ gcloud container clusters create kuron --num-nodes 3 --machine-type f1-micro --zone "us-central1-a"
```

## :one: Déploiement de l'application node

collegeboreal/kuron




# Cleanup

```
$ gcloud container clusters delete kuron --zone "us-central1-a"
```
