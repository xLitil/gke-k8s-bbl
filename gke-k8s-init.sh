#!/bin/bash
. setenv.sh

gcloud config set compute/zone $CLUSTER_ZONE
