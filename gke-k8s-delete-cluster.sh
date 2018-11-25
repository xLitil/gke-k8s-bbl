#!/bin/bash
. setenv.sh

# Doc : https://cloud.google.com/sdk/gcloud/reference/container/clusters/delete

gcloud container clusters delete $CLUSTER_NAME --quiet
