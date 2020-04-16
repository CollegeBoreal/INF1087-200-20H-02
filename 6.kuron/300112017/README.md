# :six: Kuron (prononcer Couronne)

Ce laboratoire permettra de créer une grappe sur le cloud public [GCP]. 

:closed_book: Copiez le `README.md` et le répertoire `.src` dans votre répertoire :id: et cocher les sections `- [x]` au fur et à mesure de votre progression.

## :o: Sur votre PC, créer votre répertoire de travail dans `git bash`

- [X] Dans le répertoire `6.Kuron` Créer un répertoire avec comme nom, votre 300112017

`$ mkdir ` 300112017

- [ ] Copier les fichiers se trouvant dans le répertoire `.` dans votre répertoire :id:

      * incluant le fichier `README.md` 

      * incluant le répertoire `.src` 


`$ cp ./README.md `300112017` `

`$ cp -r .src/* `300112017` `

- [X] Soumets ton répertoire de travail vers github `(git add, commit, push)` 


## :star: Prérequis

- [X] Compte GCP

Assures toi d'avoir ton compte sur https://console.cloud.google.com/

- [X] Identifiants GCP 

Assures toi d'avoir positionner tes identifiants `google`

*avec gitbash

```
$ export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcp/b300112017-273623-790eba8c7646.json"
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

<img src="k1.JPG"></img>



<img src="k.JPG"></img>

:round_pushpin: Assures toi d'activer ton context avec `kubectl`, vérifie l'étoile

```
$ kubectl config get-contexts
 *         gke_b300112017-273623_us-central1-a_kuron   gke_b300112017-273623_us-central1-a_kuron   gke_b300112017-273623_us-central1-a_kuron
```

* Changes de contexte si ce n'est pas le cas, exemple

```
$ kubectl config set-context gke_pid_us-central1-a_kuron
Context "gke_pid_us-central1-a_kuron" created.
```

:round_pushpin: Visualise quelques informations sur ta grappe

```
$ kubectl cluster-info                 
```

<img src="k2.JPG"></img>


- [X] Vérifie que tes :three: `noeuds` (VMs) soient dans un état `Ready`

```
% kubectl get nodes
NAME                                   STATUS   ROLES    AGE     VERSION
gke-kuron-default-pool-87718f92-pw96   Ready    <none>   6m13s   v1.16.8-gke.8
gke-kuron-default-pool-87718f92-qt15   Ready    <none>   6m13s   v1.16.8-gke.8
gke-kuron-default-pool-87718f92-sgvs   Ready    <none>   6m13s   v1.16.8-gke.8

```
## :b: Déploie ton application `kuron`

https://hub.docker.com/r/collegeboreal/kuron

Nous allons utiliser l'image `collegeboreal/kuron` pour créer notre application. Tu as un lien ci-dessus pour plus de détail pour construire l'image.

Les applications ou `pod` sont des conteneurs où tournent l'application, dans notre cas un serveur `node` nous donnant le nom du conteneur.

- [X] Utilise le fichier `kuron-deployment.yaml` pour déployer tes `pods`

```
$ kubectl apply -f kuron-deployment.yaml 
deployment.apps/kuron-deployment created
```
- [X] Vérifie que tes :three: `pods` soient dans un état de tourner `running`

```
$ kubectl get pods  
NAME                               READY   STATUS              RESTARTS   AGE
kuron-deployment-8bf4f7f9f-5n5m9   0/1     ContainerCreating   0          15s
kuron-deployment-8bf4f7f9f-766bp   0/1     ContainerCreating   0          15s
kuron-deployment-8bf4f7f9f-cdfpv   0/1     ContainerCreating   0          15s

```


## :ab: Déploie le service `kuron-deployment-service`

Le service permet la publication des ports vers l'extérieur. Le port que nous allons utiliser et le port `8080`

- [X] Utilise le fichier `kuron-deployment-service.yaml` pour ouvrir les `ports`

```
$ kubectl apply -f kuron-deployment-service.yaml 
```

:round_pushpin: Vérifie ton service et note l'adresse IP externe et le port d'accès

```
$ kubectl get services   
NAME                       TYPE           CLUSTER-IP   EXTERNAL-IP     PORT(S)          AGE
kubernetes                 ClusterIP      10.32.0.1    <none>          443/TCP          18m
kuron-deployment-service   LoadBalancer   10.32.4.98   104.154.21.73   8080:32227/TCP   6m5s
```

- [X] Publie ton site Internet avec les informations du service

http://104.154.21.73:8080

## :o: Teste ton application en prouvant que tes `pods` tournent sur un service redondant

- [X] Liste ton `service`

```
$ kubectl get services   
NAME                       TYPE           CLUSTER-IP   EXTERNAL-IP     PORT(S)          AGE
kubernetes                 ClusterIP      10.32.0.1    <none>          443/TCP          18m
kuron-deployment-service   LoadBalancer   10.32.4.98   104.154.21.73   8080:32227/TCP   6m5s

```

* Note l'adresse IP locale de ton cluster, dans ce cas `10.32.4.98` 

- [X] Liste tes `pods`

```
$ kubectl get pods 
NAME                               READY   STATUS    RESTARTS   AGE
kuron-deployment-8bf4f7f9f-5n5m9   1/1     Running   0          7m6s
kuron-deployment-8bf4f7f9f-766bp   1/1     Running   0          7m6s
kuron-deployment-8bf4f7f9f-cdfpv   1/1     Running   0          7m6s

```

* Note le nom de tes trois `pods` ou conteneurs,
```
kuron-deployment-8bf4f7f9f-5n5m9
kuron-deployment-8bf4f7f9f-766bp
kuron-deployment-8bf4f7f9f-cdfpv
````


- [X] Tapes les commandes ci-dessous en changeant le nom des pods et l'adresse IP locale.

Le programme javascript qui tourne dans les pods récupère le nom du conteneur dans ce cas le nom du pod.

:warning: Remarque le nom du pod retourné change et n'est pas forcément le nom du pod

:bangbang: Respecte le séparateur de commande `--` devant la commande `curl`

```
$ kubectl exec kuron-deployment-8bf4f7f9f-5n5m9 -- curl -s http://10.32.4.98:8080
Tu as touché kuron-deployment-8bf4f7f9f-5n5m9
```

- [X] Finalement, aller dans un pod (conteneur) et donner la taille mémoire du pod avec la commande `top`

```
$ kubectl exec --stdin --tty  kuron-deployment-8bf4f7f9f-5n5m9 -- /bin/bash
```
<img src="k3.JPG"></img>



## :x: Après la fin du cours, supprime ta grappe (attendre la note finale)

1. soit par la console [`Google`](https://console.cloud.google.com/)

1. soit par la commande
```
$ gcloud container clusters delete kuron --zone "us-central1-a"
```


# Références

https://github.com/CollegeBoreal/Tutoriels/tree/master/2.Virtualisation/2.VM/1.Docker

https://github.com/CollegeBoreal/INF1087-200-20H-02/tree/master/K.Kubernetes
