# :six: Kuron Boreal


## :o: Prérequis

```
$ export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcp/b300098957-a2662a9bd338.json"
```

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
