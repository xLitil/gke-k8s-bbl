#!/bin/bash
. setenv.sh

NAMESPACE=default

kubectl --namespace $NAMESPACE delete -f k8s

kubectl get service
kubectl get pods
