# :six: Kuron (prononcer Couronne)

Ce laboratoire permettra de créer une grappe sur le cloud public [GCP]. 

:closed_book: Copiez le `README.md` et le répertoire `.src` dans votre répertoire :id: et cocher les sections `- [x]` au fur et à mesure de votre progression.

## :o: Sur votre PC, créer votre répertoire de travail dans `git bash`

- [ ] Dans le répertoire `6.Kuron` Créer un répertoire avec comme nom, votre :id:

`$ mkdir ` :id:

- [ ] Copier les fichiers se trouvant dans le répertoire `.` dans votre répertoire :id:

      * incluant le fichier `README.md` 

      * incluant le répertoire `.src` 


`$ cp ./README.md `:id:` `

`$ cp -r .src `:id:` `

- [ ] Soumettre votre répertoire de travail vers github `(git add, commit, push)` 


## :star: Prérequis

- [ ] Compte GCP

Assures toi d'avoir ton compte sur https://console.cloud.google.com/

- [ ] Identifiants GCP 

Assures toi d'avoir positionner tes identifiants `google`

```
$ export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcp/b300098957-a2662a9bd338.json"
```

## :a: Créer sa grappe `kuron`

- [ ] ta grappe `kuron` avec 3 VM (noeuds)

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

## :b: Créer une application de votre choix (docker ou docker compose)

- [ ] Copie du fichier de configuration (i.e. Dockerfile, docker-compose.yml)

- [ ] La commande `docker`, `docker-compose` utilisée pour lancer l'application

## :ab: Vérifier que l'application marche

:bulb: Faites attention au `firewall` de chaque nuage. Chaque nuage a sa propre configuration

- [ ] Décrire la configuration du `firewall`

## :o: Décriver votre application et donner les accés pour la vérification 

- [ ] Que fait l'application?

- [ ] Quel est son adresse IP?

- [ ] Quel port utilisé pour y accéder?

## :star: Autres commentaires utiles à donner

- [ ] Commentaires

[Participation](Participation.md)

# Références

https://github.com/CollegeBoreal/Tutoriels/tree/master/2.Virtualisation/2.VM/1.Docker

