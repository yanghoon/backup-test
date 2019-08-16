#!/bin/bash

set -e

## extract 
#FILE=resources/tools-backup-test-agent.yaml
#POD=$(kubectl get -f $FILE -o custom-columns='name:metadata.name' --no-headers)
#NS=$(kubectl get -f $FILE -o custom-columns='ns:metadata.namespace' --no-headers)

#kubectl exec -it $POD -n $NS -- sh -c 'apk fetch rsync -R -o /tmp'
#kubectl cp $NS/$POD:/tmp packages/alpine/

## install
#POD=zcp-gitea-gitea-67ddcb6779-f2dsm  # pog-dev
POD=zcp-git-gitea-5449c67d99-84s69     # ski-dev
NS=zcp-system

kubectl cp packages/alpine/ $NS/$POD:/tmp
kubectl exec -it $POD -n $NS -- sh -c 'cd /tmp/alpine && rm musl*.apk && apk add --no-network --no-cache *.apk'
kubectl exec -it $POD -n $NS -- sh -c 'which rsync && rsync --version'
