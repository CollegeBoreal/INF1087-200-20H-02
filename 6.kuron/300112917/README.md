# :six: Kuron (prononcer Couronne)

Ce laboratoire permettra de créer une grappe sur le cloud public [GCP]. 

:closed_book: Copiez le `README.md` et le répertoire `.src` dans votre répertoire :id: et cocher les sections `- [x]` au fur et à mesure de votre progression.

## :o: Sur votre PC, créer votre répertoire de travail dans `git bash`

- [X] Dans le répertoire `6.Kuron` Créer un répertoire avec comme nom, votre 300112917

`$ mkdir ` 300112917

- [ ] Copier les fichiers se trouvant dans le répertoire `.` dans votre répertoire :id:

      * incluant le fichier `README.md` 

      * incluant le répertoire `.src` 


`$ cp ./README.md `300112917` `

`$ cp -r .src/* `300112917` `

- [X] Soumets ton répertoire de travail vers github `(git add, commit, push)` 


## :star: Prérequis

- [X] Compte GCP

Assures toi d'avoir ton compte sur https://console.cloud.google.com/

- [X] Identifiants GCP 

Assures toi d'avoir positionner tes identifiants `google`

*avec gitbash

```
$ export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcp/b300112917-5963c1787acf.json"
```

## :a: Créer sa grappe `kuron`

- [X] Crée ta grappe `kuron` avec 3 VM (noeuds)

* avec Powershell

```
PS > gcloud beta container clusters create "kuron" --zone "us-central1-a" `
                        --num-nodes "3" --release-channel "rapid" `
                        --machine-type "g1-small" --image-type "COS" `
                        --disk-type "pd-standard" --disk-size "30" `
                        --no-enable-stackdriver-kubernetes --no-enable-basic-auth `
                        --no-enable-master-authorized-networks `
                        --addons HorizontalPodAutoscaling,HttpLoadBalancing `
                        --enable-autoupgrade --enable-autorepair --enable-ip-alias                
```

<img src="kuron1.PNG"></img>

<img src="kuron2.PNG"></img>

:round_pushpin: Assures toi d'activer ton context avec `kubectl`, vérifie l'étoile

```
$ kubectl config get-contexts
 
```
<img src="kuron3.PNG"></img>


* Changes de contexte si ce n'est pas le cas, exemple

```
$ kubectl config set-context gke_pid_us-central1-a_kuron
```

<img src="kuron4.PNG"></img>

:round_pushpin: Visualise quelques informations sur ta grappe

```
$ kubectl cluster-info                 
```

<img src="kuron5.PNG"></img>


- [X] Vérifie que tes :three: `noeuds` (VMs) soient dans un état `Ready`

```
% kubectl get nodes

```

<img src="kuron6.PNG"></img>


## :b: Déploie ton application `kuron`

https://hub.docker.com/r/collegeboreal/kuron

Nous allons utiliser l'image `collegeboreal/kuron` pour créer notre application. Tu as un lien ci-dessus pour plus de détail pour construire l'image.

Les applications ou `pod` sont des conteneurs où tournent l'application, dans notre cas un serveur `node` nous donnant le nom du conteneur.

- [X] Utilise le fichier `kuron-deployment.yaml` pour déployer tes `pods`

```
$ kubectl apply -f kuron-deployment.yaml 
```
<img src="kuron8.PNG"></img>

- [X] Vérifie que tes :three: `pods` soient dans un état de tourner `running`

```
$ kubectl get pods                                                              

```
<img src="kuron7.PNG"></img>


## :ab: Déploie le service `kuron-deployment-service`

Le service permet la publication des ports vers l'extérieur. Le port que nous allons utiliser et le port `8080`

- [X] Utilise le fichier `kuron-deployment-service.yaml` pour ouvrir les `ports`

```
$ kubectl apply -f kuron-deployment-service.yaml 
```

:round_pushpin: Vérifie ton service et note l'adresse IP externe et le port d'accès

```
$ kubectl get services                                                          

```

<img src="kuron9.PNG"></img>


- [X] Publie ton site Internet avec les informations du service

http://35.202.139.52:8080

## :o: Teste ton application en prouvant que tes `pods` tournent sur un service redondant

- [X] Liste ton `service`

```
$ kubectl get services                                                          

```

<img src="kuron9.PNG"></img>

* Note l'adresse IP locale de ton cluster, dans ce cas `10.32.3.1` 

- [X] Liste tes `pods`

```
$ kubectl get pods                                                              

```

<img src="kuron10.PNG"></img>

* Note le nom de tes trois `pods` ou conteneurs, i.e. `kuron-deployment-8bf4f7f9f-5hm4n`, `kuron-deployment-8bf4f7f9f-d4d9l`


- [X] Tapes les commandes ci-dessous en changeant le nom des pods et l'adresse IP locale.

Le programme javascript qui tourne dans les pods récupère le nom du conteneur dans ce cas le nom du pod.

:warning: Remarque le nom du pod retourné change et n'est pas forcément le nom du pod

:bangbang: Respecte le séparateur de commande `--` devant la commande `curl`

```
$ kubectl exec kuron-deployment-8bf4f7f9f-pw5nq -- curl -s http://10.32.11.229:8080
Tu as touché kuron-deployment-8bf4f7f9f-w62nz
```

<img src="kuron11.PNG"></img>



- [X] Finalement, aller dans un pod (conteneur) et donner la taille mémoire du pod avec la commande `top`

```
$ kubectl exec --stdin --tty  kuron-deployment-8bf4f7f9f-pw5nq -- /bin/bash
```

<img src="Kuron12.PNG"></img>

```
root@kuron-deployment-8bf4f7f9f-pw5nq:/# Top
```

<img src="Kuron13.PNG"></img>


## :x: Après la fin du cours, supprime ta grappe (attendre la note finale)

1. soit par la console [`Google`](https://console.cloud.google.com/)

1. soit par la commande
```
$ gcloud container clusters delete kuron --zone "us-central1-a"
```


# [Participation](Participation.md)

# Références

https://github.com/CollegeBoreal/Tutoriels/tree/master/2.Virtualisation/2.VM/1.Docker

https://github.com/CollegeBoreal/INF1087-200-20H-02/tree/master/K.Kubernetes
