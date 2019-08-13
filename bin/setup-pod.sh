#!/bin/bash

FILE=resources/tools-backup-test-agent.yaml

kubectl delete -f $FILE
kubectl apply -f $(dirname $FILE)
kubectl apply -f $(dirname $FILE)/*.local

set -e

POD=$(kubectl get -f $FILE -o custom-columns='name:metadata.name' --no-headers)
NS=$(kubectl get -f $FILE -o custom-columns='ns:metadata.namespace' --no-headers)

sleep 3

kubectl cp bin/setup-alpine.sh $NS/$POD:setup-alpine.sh
kubectl exec -i  $POD -n $NS -- sh -c 'sh /setup-alpine.sh'
kubectl exec -it $POD -n $NS -- sh
