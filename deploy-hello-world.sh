#!/bin/bash
. setenv.sh

function getExternalIP() {
  local NAME=$2
  echo -n "Waiting for external IP ."
  local RESULT='unknow'
  while ! [[ "$RESULT" =~ ^[0-9\.]+ ]]; do
    RESULT=`kubectl  get ingress $NAME | tail -1 | awk '{print $3}'`
    sleep 1
    echo -n "."
  done
  echo
  echo "External IP found: $RESULT"
  eval "$1=\"$RESULT\""
}

function updateNoIp() {
  local NO_IP_DNS=$1
  local EXTERNAL_IP=$2
  echo "Updating IP address for $NO_IP_DNS domain : $EXTERNAL_IP"
  curl "https://$NO_IP_USERNAME:$NO_IP_PWD@dynupdate.no-ip.com/nic/update?hostname=$NO_IP_DNS&myip=$EXTERNAL_IP" -H "User-agent: $NO_IP_USERNAME-UserAgent $NO_IP_EMAIL"
}

kubectl apply -f k8s

kubectl get service hello-world-srv

EXTERNAL_IP=''
getExternalIP EXTERNAL_IP 'test-ingress'
updateNoIp $NO_IP_DNS $EXTERNAL_IP
