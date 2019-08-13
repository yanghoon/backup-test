#!/bin/bash

POD=zcp-gitea-gitea-67ddcb6779-trkmp
NS=zcp-system

time ../bin/krsync.sh -avz --progress --stats $POD@$NS:/data gitea-data 2>&1 | tee sync.log
time ../bin/krsync.sh -avz --progress --stats $POD@$NS:/data gitea-data 2>&1 | tee sync.log.2

echo
echo '## tail -n 14 sync.log'
tail -n 14 sync.log

echo
echo '## tail -n 14 sync.log.2'
tail -n 14 sync.log.2
