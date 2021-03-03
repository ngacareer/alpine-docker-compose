## Quick reference
- Created by: <a href="https://github.com/ngacareer">ngacareer</a>
- Where to get help: <a href="https://forums.docker.com/">the Docker Community Forums</a>, <a href="https://dockr.ly/slack">the Docker Community Slack</a>, or <a href="https://stackoverflow.com/search?tab=newest&amp;q=docker">Stack Overflow</a>

## Supported tags and respective Dockerfile links
- <a href="https://github.com/ngacareer/alpine-docker-compose/blob/main/Dockerfile">latest (20.10.3)</a>

## Quick reference (cont.)
- Where to file issues <a href="https://github.com/ngacareer/alpine-docker-compose/issues">https://github.com/ngacareer/alpine-docker-compose/issues</a>

## What is alpine-docker-compose ? 

Base from <a href="https://hub.docker.com/_/docker">docker</a>. The image is a Linux lightweight, It has been integrated docker and docker-compose, We can change version of Docker is installed on it, Image runs all docker command line (CLI) and connect to Docker diamon from /var/run/docker.sock

## How to use this image
- On Docker 
```
docker run -itd --name alpine-docker-compose \
     -v /var/run/docker.sock:/var/run/docker.sock \
     ngacareer/alpine-docker-compose
     
docker exec -it alpine-docker-compose sh
# dockerd --version
# docker --version
# docker-compose -version
 ```
- On Kubernetes
 ```
kubectl run alpine-docker-compose \
       -v /var/run/docker.sock:/var/run/docker.sock \
       --image=ngacareer/alpine-docker-compose
       
kubectl exec -it pod/alpine-docker-compose sh
# dockerd --version
# docker --version
# docker-compose -version
 ```
- On OpenShift
 ```
oc new-app --docker-image=ngacareer/alpine-docker-compose \
       -v /var/run/docker.sock:/var/run/docker.sock \
       --name=alpine-docker-compose
       
oc new-app --docker-image=ngacareer/testtools:noroot --name=testtools
oc exec -it $(oc get pod -l app=testtools -o jsonpath="{.items[0].metadata.name}") sh
# dockerd --version
# docker --version
# docker-compose -version
 ```
 ## License

Copyright © 2021 Ngacareer

All contents licensed under the [MIT License](LICENSE)
