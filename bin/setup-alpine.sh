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

## rclone
## https://rclone.org/install/#linux-installation-from-precompiled-binary
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
unzip rclone-current-linux-amd64.zip
cd rclone-*-linux-amd64

cp rclone /usr/bin/
chown root:root /usr/bin/rclone
chmod 755 /usr/bin/rclone


git clone https://github.com/yanghoon/backup-test.git
