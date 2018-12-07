#!/bin/bash
. setenv.sh

# Doc : https://cloud.google.com/sdk/gcloud/reference/container/clusters/create

# Starting in Kubernetes v1.10, new clusters will no longer get compute-rw and
# storage-ro scopes added to what is specified in --scopes (though the latter
# will remain included in the default --scopes). To use these scopes, add them
# explicitly to --scopes. To use the new behavior,
# set container/new_scopes_behavior property (gcloud config set container/new_scopes_behavior true
gcloud config set container/new_scopes_behavior true

gcloud container clusters create $CLUSTER_NAME \
  --zone $CLUSTER_ZONE \
  --enable-ip-alias --enable-autoupgrade --metadata disable-legacy-endpoints=true \
  --addons=HttpLoadBalancing,KubernetesDashboard \
  --no-enable-basic-auth --no-issue-client-certificate \
  --num-nodes 3 \
  --machine-type=n1-standard-1 \
  --disk-size=10GB

# Machine type : f1-micro, n1-standard-1

gcloud container clusters describe $CLUSTER_NAME --zone $CLUSTER_ZONE > $CLUSTER_NAME-describe.log

gcloud container clusters get-credentials $CLUSTER_NAME
