# https://github.com/gliderlabs/docker-alpine/blob/master/docs/usage.md
# https://www.sandtable.com/reduce-docker-image-sizes-using-alpine/
FROM alpine:3.7

## rsync
## https://github.com/BenoitKnecht/docker-rsync/blob/master/Dockerfile
RUN apk --update add rsync \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /package/alpine-3.7 \
    && apk fetch --no-cache rsync -R -o /package/alpine-3.7 \
    && rm /package/alpine-3.7/musl-*.apk

## kubectl
## https://github.com/lachie83/k8s-kubectl/blob/master/Dockerfile
ENV KUBE_LATEST_VERSION="v1.15.2"

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps \
 && rm /var/cache/apk/*

## rclone
## https://github.com/justintien/docker-rclone-alpine/blob/master/Dockerfile
## https://rclone.org/install/#linux-installation-from-precompiled-binary
#ENV RCLONE_VERSION=v1.48.0
#
#RUN apk add --update openssl ca-certificates fuse curl \
# && cd /tmp \
# && curl -OL https://github.com/rclone/rclone/releases/download/${RCLONE_VERSION}/rclone-${RCLONE_VERSION}-linux-arm64.zip \
# && unzip /tmp/rclone-${RCLONE_VERSION}-linux-arm64.zip \
# && mv /tmp/rclone-*-linux-arm64/rclone /usr/bin \
# && rm -r /tmp/rclone*

COPY rclone-v1.48.0-linux-arm64/rclone /usr/bin

ENTRYPOINT []
CMD []
