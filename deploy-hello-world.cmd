call setenv.cmd
call gcloud container clusters get-credentials %CLUSTER_NAME%

kubectl apply -f k8s

Echo "Attendre un peu que l'EXTERNAL_IP soit créée"
timeout 5
kubectl get service %APP_NAME%
echo http://[EXTERNAL_IP]
