#!/bin/bash
. setenv.sh
gcloud container clusters get-credentials $CLUSTER_NAME

kubectl apply -f k8s

kubectl get service $APP_NAME
echo http://[EXTERNAL_IP]
