#!/bin/bash

REMOTE=s3-demo
DIR=zcp-backup-gitea

RCLONE=$REMOTE:$DIR
MOUNT=/tmp/rclone/$REMOTE/$DIR

[ -d ] || mkdir -p $MOUNT

time rclone lsd $RCLONE
df -h
rclone mount $RCLONE $MOUNT --daemon 

ls -lh $MOUNT
