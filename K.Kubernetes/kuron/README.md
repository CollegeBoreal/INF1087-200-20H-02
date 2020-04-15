# Build kuron image


```
$ docker build --tag kuron .
```

```
$ docker run --name kuron-container --publish 8080:8080 --detach kuron
```

```
$ curl localhost:8080
You've hit 66d7b8a75754
```

```
$ docker tag kuron collegeboreal/kuron
```

```
$ docker login
```

```
$ docker push collegeboreal/kuron
The push refers to repository [docker.io/collegeboreal/kuron]
e349017e9786: Pushed 
ab90d83fa34a: Mounted from library/node 
8ee318e54723: Mounted from library/node 
e6695624484e: Mounted from library/node 
da59b99bbd3b: Mounted from library/node 
5616a6292c16: Mounted from library/node 
f3ed6cb59ab0: Mounted from library/node 
654f45ecb7e3: Mounted from library/node 
2c40c66f7667: Mounted from library/node 
latest: digest: sha256:0b4b251265d6dae45e070b9467e22796c38a98b16f88a3c642f860a6cc355b11 size: 2213
```
