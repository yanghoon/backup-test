# gzip
# archive (not comporess)
# archive (without data/git/repositories)
du -h -d 2 .tmp/ski-gitea-data

time tar -zcvpf - .tmp/ski-gitea-data | wc -c | tee .tmp archive.log.0
time tar -cvpf  - .tmp/ski-gitea-data | wc -c | tee .tmp archive.log.1
time tar --exclude .tmp/ski-gitea-data/data/git -cvpf - .tmp/ski-gitea-data | wc -c | tee .tmp archive.log.2
