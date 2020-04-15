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

- [ ] Soumets ton répertoire de travail vers github `(git add, commit, push)` 


## :star: Prérequis

- [ ] Compte GCP

Assures toi d'avoir ton compte sur https://console.cloud.google.com/

- [ ] Identifiants GCP 

Assures toi d'avoir positionner tes identifiants `google`

```
$ export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcp/b300098957-a2662a9bd338.json"
```

## :a: Créer sa grappe `kuron`

- [ ] Crée ta grappe `kuron` avec 3 VM (noeuds)

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

![image](images/Kuron-cluster.png)

:round_pushpin: Assures toi d'activer ton context avec `kubectl`, vérifie l'étoile

```
$ kubectl config get-contexts
CURRENT   NAME                          CLUSTER                       AUTHINFO                        NAMESPACE
*         gke_pid_us-central1-a_kuron   gke_pid_us-central1-a_kuron   gke_pid_us-central1-a_kuron   
```

* Changes de contexte si ce n'est pas le cas, exemple

```
$ kubectl config set-context gke_pid_us-central1-a_kuron
```

:round_pushpin: Visualise quelques informations sur ta grappe

```
$ kubectl cluster-info                 
```

- [ ] Vérifie que tes :three: `noeuds` (VMs) soient dans un état `Ready`

```
% kubectl get nodes
NAME                                   STATUS   ROLES    AGE     VERSION
gke-kuron-default-pool-1e3feddf-8s94   Ready    <none>   2m32s   v1.16.8-gke.8
gke-kuron-default-pool-1e3feddf-c4tn   Ready    <none>   2m32s   v1.16.8-gke.8
gke-kuron-default-pool-1e3feddf-p2j8   Ready    <none>   2m32s   v1.16.8-gke.8
```

## :b: Déploie ton application `kuron`

Les applications ou `pod` sont des conteneurs où tournent l'application, dans notre cas un serveur `node` nous donnant le nom du conteneur.

- [ ] Utilise le fichier `kuron-deployment.yml` pour déployer tes `pods`

```
$ kubectl apply -f kuron-deployment.yml 
```

- [ ] Vérifie que tes :three: `pods` soient dans un état de tourner `running`

```
$ kubectl get pods                                                              
NAME                               READY   STATUS    RESTARTS   AGE
kuron-deployment-8bf4f7f9f-5hm4n   1/1     Running   0          20m
kuron-deployment-8bf4f7f9f-d4d9l   1/1     Running   0          20m
kuron-deployment-8bf4f7f9f-xw4gz   1/1     Running   0          20m
```

## :ab: Déploie le service `kuron-deployment-service`

Le service permet la publication des ports vers l'extérieur. Le port que nous allons utiliser et le port `8080`

- [ ] Utilise le fichier `kuron-deployment-services.yml` pour ouvrir les `ports`

```
$ kubectl apply -f kuron-deployment-services.yml 
```

:round_pushpin: Vérifie ton service et note l'adresse IP externe et le port d'accès

```
$ kubectl get services                                                          
NAME                       TYPE           CLUSTER-IP   EXTERNAL-IP    PORT(S)          AGE
kubernetes                 ClusterIP      10.32.0.1    <none>         443/TCP          25m
kuron-deployment-service   LoadBalancer   10.32.3.1    34.70.183.28   8080:30237/TCP   11m
```

- [ ] Publie ton site Internet avec les informations du service

http://34.70.183.28:8080

## :o: Teste ton application en prouvant que tes `pods` tournent sur un service redondant

- [ ] Liste ton `service`

```
$ kubectl get services                                                          
NAME                       TYPE           CLUSTER-IP   EXTERNAL-IP    PORT(S)          AGE
kubernetes                 ClusterIP      10.32.0.1    <none>         443/TCP          25m
kuron-deployment-service   LoadBalancer   10.32.3.1    34.70.183.28   8080:30237/TCP   11m
```

* Note l'adresse IP locale de ton cluster, dans ce cas `10.32.3.1` 

- [ ] Liste tes `pods`

```
$ kubectl get pods                                                              
NAME                               READY   STATUS    RESTARTS   AGE
kuron-deployment-8bf4f7f9f-5hm4n   1/1     Running   0          20m
kuron-deployment-8bf4f7f9f-d4d9l   1/1     Running   0          20m
kuron-deployment-8bf4f7f9f-xw4gz   1/1     Running   0          20m
```

* Note le nom de tes trois `pods` ou conteneurs, i.e. `kuron-deployment-8bf4f7f9f-5hm4n`, `kuron-deployment-8bf4f7f9f-d4d9l`


- [ ] Tapes les commandes ci-dessous en changeant le nom des pods et l'adresse IP locale.

Le programme javascript qui tourne dans les pods récupère le nom du conteneur dans ce cas le nom du pod.

:warning: Remarque le nom du pod retourné change et n'est pas forcément le nom du pod

:bangbang: Respecte le séparateur de commande `--` devant la commande `curl`

```
$ kubectl exec kuron-deployment-8bf4f7f9f-5hm4n -- curl -s http://10.32.3.1:8080
Tu as touché kuron-deployment-8bf4f7f9f-d4d9l
```

```
$ kubectl exec kuron-deployment-8bf4f7f9f-5hm4n -- curl -s http://10.32.3.1:8080
Tu as touché kuron-deployment-8bf4f7f9f-5hm4n
```

```
$ kubectl exec kuron-deployment-8bf4f7f9f-5hm4n -- curl -s http://10.32.3.1:8080
Tu as touché kuron-deployment-8bf4f7f9f-5hm4n
```

```
$ kubectl exec kuron-deployment-8bf4f7f9f-5hm4n -- curl -s http://10.32.3.1:8080
Tu as touché kuron-deployment-8bf4f7f9f-5hm4n
```

```
$ kubectl exec kuron-deployment-8bf4f7f9f-5hm4n -- curl -s http://10.32.3.1:8080
Tu as touché kuron-deployment-8bf4f7f9f-xw4gz
```

- [ ] Finalement, aller dans un pod (conteneur) et donner la taille mémoire du pod avec la commande `top`

```
$ kubectl exec --stdin --tty  kuron-deployment-8bf4f7f9f-5hm4n -- /bin/bash
```

KiB Mem:   1732772


## :x: Après la fin du cours, supprime ta grappe (attendre la note finale)

1. soit par la console [`Google`](https://console.cloud.google.com/)

1. soit par la commande
```
$ gcloud container clusters delete kuron --zone "us-central1-a"
```


# [Participation](Participation.md)

# Références

https://github.com/CollegeBoreal/Tutoriels/tree/master/2.Virtualisation/2.VM/1.Docker
