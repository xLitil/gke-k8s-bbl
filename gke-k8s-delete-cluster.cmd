REM Doc : https://cloud.google.com/sdk/gcloud/reference/container/clusters/delete

call setenv.cmd
gcloud container clusters delete %CLUSTER_NAME% --quiet
