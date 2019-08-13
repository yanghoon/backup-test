#!/bin/bash

RCLONE=s3-demo:zcp-backup-gitea
FILE=rcat-test.tgz
DIST=".tmp/${FILE%.*}"

echo -e ".git\n.tmp\n.gitignore" > .exclude

## https://rclone.org/commands/rclone_rcat/
## https://blog.ls-al.com/tar-to-object-storage-using-rclone/
time tar --exclude-from=.exclude -zcvpf - . | rclone rcat $RCLONE/$FILE -vv
rclone lsl $RCLONE --include '*.tgz'

rm -rf $DIST && mkdir $DIST
rclone copy $RCLONE/$FILE .tmp -vv
tar -zxpf .tmp/$FILE -C $DIST

diff -NEwburq . $DIST -X .exclude
