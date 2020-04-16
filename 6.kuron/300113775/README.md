# :six: Kuron (prononcer Couronne)

Ce laboratoire permettra de créer une grappe sur le cloud public [GCP]. 

:closed_book: Copiez le `README.md` et le répertoire `.src` dans votre répertoire :id: et cocher les sections `- [x]` au fur et à mesure de votre progression.

## :o: Sur votre PC, créer votre répertoire de travail dans `git bash`

- [x] Dans le répertoire `6.Kuron` Créer un répertoire avec comme nom, votre :id:

`$ mkdir ` :id:

- [x] Copier les fichiers se trouvant dans le répertoire `.` dans votre répertoire :id:

      * incluant le fichier `README.md` 

      * incluant le répertoire `.src` 


`$ cp ./README.md `:id:` `

`$ cp -r .src/* `:id:` `

- [x] Soumets ton répertoire de travail vers github `(git add, commit, push)` 


## :star: Prérequis

- [x] Compte GCP

Assures toi d'avoir ton compte sur https://console.cloud.google.com/

- [x] Identifiants GCP 

Assures toi d'avoir positionner tes identifiants `google`

* avec Powershell

```
PS > $env:GOOGLE_APPLICATION_CREDENTIALS="C:\Users\User\.gcp\b300108234-de32988388af.json"
```

## :a: Créer sa grappe `kuron`

- [x] Crée ta grappe `kuron` avec 3 VM (noeuds)

* avec Powershell

```
PS > gcloud beta container clusters create "kuron" --zone "us-central1-a" `
>>                         --num-nodes "3" --release-channel "rapid" `
>>                         --machine-type "g1-small" --image-type "COS" `
>>                         --disk-type "pd-standard" --disk-size "30" `
>>                         --no-enable-stackdriver-kubernetes --no-enable-basic-auth `
>>                         --no-enable-master-authorized-networks `
>>                         --addons HorizontalPodAutoscaling,HttpLoadBalancing `
>>                         --enable-autoupgrade --enable-autorepair --enable-ip-alias
WARNING: Starting with version 1.18, clusters will have shielded GKE nodes by default.
WARNING: The Pod address range limits the maximum size of the cluster. Please refer to https://cloud.google.com/kubernetes-engine/docs/how-to/flexible-pod-cidr to learn how to optimize IP address allocation.
This will enable the autorepair feature for nodes. Please see https://cloud.google.com/kubernetes-engine/docs/node-auto-repair for more information on node autorepairs.
Creating cluster kuron in us-central1-a... Cluster is being health-checked (master is healthy)...done.
Created [https://container.googleapis.com/v1beta1/projects/melodic-now-272914/zones/us-central1-a/clusters/kuron].
To inspect the contents of your cluster, go to: https://console.cloud.google.com/kubernetes/workload_/gcloud/us-central1-a/kuron?project=melodic-now-272914
kubeconfig entry generated for kuron.
NAME   LOCATION       MASTER_VERSION  MASTER_IP     MACHINE_TYPE  NODE_VERSION  NUM_NODES  STATUS
kuron  us-central1-a  1.16.8-gke.8    34.69.41.100  g1-small      1.16.8-gke.8  3          RUNNING               
                          
```



![images](cluster.JPG)



```

:round_pushpin: Assures toi d'activer ton context avec `kubectl`, vérifie l'étoile

```
```

(base) C:\Users\Armand\Developer\infrastructure\6.kuron\300113775>kubectl config get-contexts
CURRENT   NAME                                         CLUSTER                                      AUTHINFO                                     NAMESPACE
*         gke_melodic-now-272914_us-central1-a_kuron   gke_melodic-now-272914_us-central1-a_kuron   gke_melodic-now-272914_us-central1-a_kuron
                  
```

:round_pushpin: Visualise quelques informations sur ta grappe

```
(base) C:\Users\Armand>kubectl cluster-info
Kubernetes master is running at https://34.69.41.100
GLBCDefaultBackend is running at https://34.69.41.100/api/v1/namespaces/kube-system/services/default-http-backend:http/proxy
KubeDNS is running at https://34.69.41.100/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
Metrics-server is running at https://34.69.41.100/api/v1/namespaces/kube-system/services/https:metrics-server:/proxy


To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'
```

- [x] Vérifie que tes :three: `noeuds` (VMs) soient dans un état `Ready`

```
(base) C:\Users\Armand>kubectl get nodes
NAME                                   STATUS   ROLES    AGE   VERSION
gke-kuron-default-pool-8dc5d1f0-k0q3   Ready    <none>   12m   v1.16.8-gke.8
gke-kuron-default-pool-8dc5d1f0-k9b4   Ready    <none>   12m   v1.16.8-gke.8
gke-kuron-default-pool-8dc5d1f0-m40x   Ready    <none>   12m   v1.16.8-gke.8
```

## :b: Déploie ton application `kuron`

https://hub.docker.com/r/collegeboreal/kuron

Nous allons utiliser l'image `collegeboreal/kuron` pour créer notre application. Tu as un lien ci-dessus pour plus de détail pour construire l'image.

Les applications ou `pod` sont des conteneurs où tournent l'application, dans notre cas un serveur `node` nous donnant le nom du conteneur.

- [x] Utilise le fichier `kuron-deployment.yaml` pour déployer tes `pods`

```
> kubectl apply -f kuron-deployment.yaml
deployment.apps/kuron-deployment created 
```

- [x] Vérifie que tes :three: `pods` soient dans un état de tourner `running`

```
(base) C:\Users\Armand\Developer\infrastructure\6.kuron\300113775>kubectl get pods
NAME                               READY   STATUS    RESTARTS   AGE
kuron-deployment-8bf4f7f9f-dmqbt   1/1     Running   0          3m40s
kuron-deployment-8bf4f7f9f-f5ptl   1/1     Running   0          3m40s
kuron-deployment-8bf4f7f9f-f87ss   1/1     Running   0          3m40s
```

## :ab: Déploie le service `kuron-deployment-service`

Le service permet la publication des ports vers l'extérieur. Le port que nous allons utiliser et le port `8080`

- [x] Utilise le fichier `kuron-deployment-service.yaml` pour ouvrir les `ports`

```
> kubectl apply -f kuron-deployment-service.yaml
service/kuron-deployment-service created
```

:round_pushpin: Vérifie ton service et note l'adresse IP externe et le port d'accès

```

(base) C:\Users\Armand\Developer\infrastructure\6.kuron\300113775> kubectl get services
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.32.0.1    <none>        443/TCP   16m

```

- [x] Publie ton site Internet avec les informations du service

http://35.232.223.146:8080

## :o: Teste ton application en prouvant que tes `pods` tournent sur un service redondant

- [x] Liste ton `service`

```
(base) C:\Users\Armand\Developer\infrastructure\6.kuron\300113775>kubectl get services
NAME                       TYPE           CLUSTER-IP     EXTERNAL-IP      PORT(S)          AGE
kubernetes                 ClusterIP      10.32.0.1      <none>           443/TCP          46m
kuron-deployment-service   LoadBalancer   10.32.13.175   35.232.223.146   8080:32391/TCP   18m
```

* Note l'adresse IP locale de ton cluster, dans ce cas `10.32.6.255` 

- [x] Liste tes `pods`

```
(base) C:\Users\Armand\Developer\infrastructure\6.kuron\300113775>kubectl get pods
NAME                               READY   STATUS    RESTARTS   AGE
kuron-deployment-8bf4f7f9f-dmqbt   1/1     Running   0          65m
kuron-deployment-8bf4f7f9f-f5ptl   1/1     Running   0          65m
kuron-deployment-8bf4f7f9f-f87ss   1/1     Running   0          65m
```

- [x] Tapes les commandes ci-dessous en changeant le nom des pods et l'adresse IP locale.

Le programme javascript qui tourne dans les pods récupère le nom du conteneur dans ce cas le nom du pod.

:warning: Remarque le nom du pod retourné change et n'est pas forcément le nom du pod

:bangbang: Respecte le séparateur de commande `--` devant la commande `curl`

```
(base) C:\Users\Armand\Developer\infrastructure\6.kuron\300113775>kubectl exec kuron-deployment-8bf4f7f9f-dmqbt -- curl -s http://10.32.13.175:8080
Tu as touché kuron-deployment-8bf4f7f9f-f87ss
```
```
(base) C:\Users\Armand\Developer\infrastructure\6.kuron\300113775>kubectl exec kuron-deployment-8bf4f7f9f-dmqbt -- curl -s http://10.32.13.175:8080
Tu as touché kuron-deployment-8bf4f7f9f-f87ss
```
```
(base) C:\Users\Armand\Developer\infrastructure\6.kuron\300113775>kubectl exec kuron-deployment-8bf4f7f9f-dmqbt -- curl -s http://10.32.13.175:8080
Tu as touché kuron-deployment-8bf4f7f9f-f87ss
```
```
(base) C:\Users\Armand\Developer\infrastructure\6.kuron\300113775>kubectl exec kuron-deployment-8bf4f7f9f-dmqbt -- curl -s http://10.32.13.175:8080
Tu as touché kuron-deployment-8bf4f7f9f-f87ss
```
```
(base) C:\Users\Armand\Developer\infrastructure\6.kuron\300113775>kubectl exec kuron-deployment-8bf4f7f9f-dmqbt -- curl -s http://10.32.13.175:8080
Tu as touché kuron-deployment-8bf4f7f9f-f87ss
```


- [x] Finalement, aller dans un pod (conteneur) et donner la taille mémoire du pod avec la commande `top`

```
(base) C:\Users\Armand\Developer\infrastructure\6.kuron\300113775>kubectl exec --stdin --tty  kuron-deployment-8bf4f7f9f-f5ptl -- /bin/bash
root@kuron-deployment-8bf4f7f9f-f5ptl:/# top
top - 14:47:35 up 38 min,  0 users,  load average: 0.00, 0.04, 0.07
Tasks:   3 total,   1 running,   2 sleeping,   0 stopped,   0 zombie
%Cpu(s):  2.1 us,  2.1 sy,  0.0 ni, 95.8 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem:   1732772 total,  1573756 used,   159016 free,    38276 buffers
KiB Swap:        0 total,        0 used,        0 free.  1106780 cached Mem

    PID USER      PR  NI    VIRT    RES    SHR S %CPU %MEM     TIME+ COMMAND
      1 root      20   0  614436  26056  19172 S  0.0  1.5   0:00.13 node
     11 root      20   0   20248   3260   2784 S  0.0  0.2   0:00.00 bash
     16 root      20   0   21952   2524   2160 R  0.0  0.1   0:00.00 top
```

`KiB Mem:   1732772`


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
