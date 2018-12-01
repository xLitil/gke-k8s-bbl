#!/bin/bash
. setenv.sh

kubectl delete -f k8s

kubectl get service
kubectl get pods
