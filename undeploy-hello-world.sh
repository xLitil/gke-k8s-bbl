#!/bin/bash
. setenv.sh
gcloud container clusters get-credentials $CLUSTER_NAME

kubectl delete -f k8s

kubectl get service
kubectl get pods
