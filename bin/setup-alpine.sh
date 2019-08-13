#!/bin/sh

apk add --update ca-certificates
apk add --update -t deps curl
apk add --update -t bash
apk add --update -t git

## rsync
apk add --update -t rsync

## kubectl
## https://github.com/lachie83/k8s-kubectl/blob/master/Dockerfile

KUBE_LATEST_VERSION="v1.15.2"
curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl
chmod +x /usr/local/bin/kubectl

#apk del --purge deps
#rm /var/cache/apk/*


git clone https://github.com/yanghoon/backup-test.git
