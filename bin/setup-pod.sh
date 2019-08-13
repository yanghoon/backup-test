#!/bin/bash

kubectl delete -f ../resources/*.yaml
kubectl create -f ../resources/*.yaml

set -e

POD=$(kubectl get -f ../resources/*.yaml -o custom-columns='name:metadata.name' --no-headers)
NS=$(kubectl get -f ../resources/*.yaml -o custom-columns='ns:metadata.namespace' --no-headers)

sleep 3

kubectl exec -i  $POD -n $NS -- sh -c 'sh /test/setup-alpine.sh'
kubectl exec -it $POD -n $NS -- sh
