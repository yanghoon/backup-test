#!/bin/bash

POD=zcp-gitea-gitea-67ddcb6779-trkmp
NS=zcp-system

time bin/krsync.sh -avz --progress --stats $POD@$NS:/data .tmp/gitea-data --exclude 'data/gitea/sessions' 2>&1 | tee .tmp/sync.log
time bin/krsync.sh -avz --progress --stats $POD@$NS:/data .tmp/gitea-data --exclude 'data/gitea/sessions' 2>&1 | tee .tmp/sync.log.2

echo
echo '## tail -n 14 sync.log'
tail -n 14 .tmp/sync.log

echo
echo '## tail -n 14 sync.log.2'
tail -n 14 .tmp/sync.log.2
