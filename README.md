# gke-k8s-bbl

[![CircleCI](https://circleci.com/gh/xLitil/gke-k8s-bbl.svg?style=svg)](https://circleci.com/gh/xLitil/gke-k8s-bbl)

```shell

# Install brew
...

# Install helm (Kubernetes Package Manager)
brew install kubernetes-helm

./gke-k8s-create-cluster.sh
./gke-k8s-delete-cluster.sh

./deploy-hello-world.sh
./undeploy-hello-world.sh

kubectl get po
kubectl delete pods --all

kubectl get services
kubectl get svc

kubectl get deployments

kubectl get ingress

kubectl exec -it [POD_NAME] -- /bin/bash

kubectl get pods -l 'environment in (production),tier in (frontend)'
```
