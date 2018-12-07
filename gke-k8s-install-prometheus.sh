#!/bin/bash
. setenv.sh

kubectl create clusterrolebinding myname-cluster-admin-binding-2 \
    --clusterrole=cluster-admin --user=system:serviceaccount:kube-system:default

helm init
# Wait tiller
sleep 10

helm install \
    stable/prometheus-operator \
    --name prometheus-operator \
    --namespace monitoring

# prometheus Custom Resource Definitions or CRDs
kubectl get crd

kubectl get pods -n monitoring

nohup kubectl port-forward -n monitoring prometheus-prometheus-operator-prometheus-0 9090 &
nohup kubectl port-forward $(kubectl get  pods --selector=app=grafana -n  monitoring --output=jsonpath="{.items..metadata.name}") -n monitoring  3000 &
# login : admin / prom-operator
