# :six: Kuron (prononcer Couronne)

Ce laboratoire permettra de créer une grappe sur le cloud public [GCP]. 

:closed_book: Copiez le `README.md` et le répertoire `.src` dans votre répertoire :id: et cocher les sections `- [x]` au fur et à mesure de votre progression.

## :o: Sur votre PC, créer votre répertoire de travail dans `git bash`

- [X] Dans le répertoire `6.Kuron` Créer un répertoire avec comme nom, votre 300110529

`$ mkdir ` 300110529

- [ ] Copier les fichiers se trouvant dans le répertoire `.` dans votre répertoire :id:

      * incluant le fichier `README.md` 

      * incluant le répertoire `.src` 


`$ cp ./README.md `300110529` `

`$ cp -r .src/* `300110529` `

- [X] Soumets ton répertoire de travail vers github `(git add, commit, push)` 


## :star: Prérequis

- [X] Compte GCP

Assures toi d'avoir ton compte sur https://console.cloud.google.com/

- [X] Identifiants GCP 

Assures toi d'avoir positionner tes identifiants `google`

*avec gitbash

```
$ export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcp/b300110529-427726472c87.json"
```

## :a: Créer sa grappe `kuron`

- [X] Crée ta grappe `kuron` avec 3 VM (noeuds)

* avec Powershell
```
gcloud beta container clusters create "kuron" --zone "us-central1-a" `
                        --num-nodes "3" --release-channel "rapid" `
                        --machine-type "g1-small" --image-type "COS" `
                        --disk-type "pd-standard" --disk-size "30" `
                        --no-enable-stackdriver-kubernetes --no-enable-basic-auth `
                        --no-enable-master-authorized-networks `
                        --addons HorizontalPodAutoscaling,HttpLoadBalancing `
                        --enable-autoupgrade --enable-autorepair --enable-ip-alias
```

![image](photo/Kuron.PNG)

:round_pushpin: Assures toi d'activer ton context avec `kubectl`, vérifie l'étoile
```
kubectl config get-contexts
```
![image](photo/kuron1.PNG)

* Changes de contexte si ce n'est pas le cas, exemple

```
$ kubectl config set-context gke_pid_us-central1-a_kuron
Context "gke_pid_us-central1-a_kuron" created.
```

:round_pushpin: Visualise quelques informations sur ta grappe

```
$ kubectl cluster-info
Kubernetes master is running at https://35.223.160.150
GLBCDefaultBackend is running at https://35.223.160.150/api/v1/namespaces/kube-system/services/default-http-backend:http/proxy
KubeDNS is running at https://35.223.160.150/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
Metrics-server is running at https://35.223.160.150/api/v1/namespaces/kube-system/services/https:metrics-server:/proxy
```

- [X] Vérifie que tes :three: `noeuds` (VMs) soient dans un état `Ready`

```
kubectl get nodes
```
![image](photo/Kuron2.PNG)

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
NAME                               READY   STATUS    RESTARTS   AGE
kuron-deployment-8bf4f7f9f-53xun   1/1     Running   0          30m
kuron-deployment-8bf4f7f9f-7zm5t   1/1     Running   0          30m
kuron-deployment-8bf4f7f9f-6bbkA   1/1     Running   0          30m
```

## :ab: Déploie le service `kuron-deployment-service`

Le service permet la publication des ports vers l'extérieur. Le port que nous allons utiliser et le port `8080`

- [X] Utilise le fichier `kuron-deployment-service.yaml` pour ouvrir les `ports`

```
$ kubectl apply -f kuron-deployment-service.yaml 
service/kuron-deployment-service created
```

```
$ kubectl get services
NAME                       TYPE           CLUSTER-IP    EXTERNAL-IP       PORT(S)          AGE
kubernetes                 ClusterIP      10.32.0.1     <none>            443/TCP          52m
kuron-deployment-service   LoadBalancer   10.32.2.123   104.198.191.224   8080:30512/TCP   104s
```

- [X] Publie ton site Internet avec les informations du service


http://104.198.191.224:8080

## :o: Teste ton application en prouvant que tes `pods` tournent sur un service redondant

- [X] Liste ton `service`

```

$ kubectl get services   
NAME                       TYPE           CLUSTER-IP    EXTERNAL-IP       PORT(S)          AGE
kubernetes                 ClusterIP      10.32.0.1     <none>            443/TCP          52m
kuron-deployment-service   LoadBalancer   10.32.2.123   104.198.191.224   8080:30512/TCP   104s

```
     
 * Note l'adresse IP locale de ton cluster, dans ce cas `10.32.2.123` 

- [X] Liste tes `pods`

```
$ kubectl get pods 
NAME                               READY   STATUS    RESTARTS   AGE
kuron-deployment-8bf4f7f9f-53xun   1/1     Running   0          35m
kuron-deployment-8bf4f7f9f-7zm5t   1/1     Running   0          35m
kuron-deployment-8bf4f7f9f-6bbkA   1/1     Running   0          35m

```

* Note le nom de tes trois `pods` ou conteneurs,
```
kuron-deployment-8bf4f7f9f-53xun
kuron-deployment-8bf4f7f9f-7zm5t
kuron-deployment-8bf4f7f9f-6bbkA
````


- [X] Tapes les commandes ci-dessous en changeant le nom des pods et l'adresse IP locale.

Le programme javascript qui tourne dans les pods récupère le nom du conteneur dans ce cas le nom du pod.

:warning: Remarque le nom du pod retourné change et n'est pas forcément le nom du pod

:bangbang: Respecte le séparateur de commande `--` devant la commande `curl`

```
$ kubectl exec kuron-deployment-8bf4f7f9f-53xun -- curl -s http://10.32.2.123:8080
Tu as touché kuron-deployment-8bf4f7f9f-53xun
```

- [X] Finalement, aller dans un pod (conteneur) et donner la taille mémoire du pod avec la commande `top`

```
$ kubectl exec --stdin --tty  kuron-deployment-8bf4f7f9f-53xun -- /bin/bash
```

## :x: Après la fin du cours, supprime ta grappe (attendre la note finale)

1. soit par la console [`Google`](https://console.cloud.google.com/)

1. soit par la commande
```
$ gcloud container clusters delete kuron --zone "us-central1-a"
```


# Références

https://github.com/CollegeBoreal/Tutoriels/tree/master/2.Virtualisation/2.VM/1.Docker

https://github.com/CollegeBoreal/INF1087-200-20H-02/tree/master/K.Kubernetes
