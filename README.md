# Test (Local)
### MacOS
* rclone - https://rclone.org/install/#macos-installation-from-precompiled-binary
* FUSE for macOS 3.10.2 (with MacFUSE compatibility layer) - https://osxfuse.github.io/

## Test
```console
$ ls -l
total 32
-rw-r--r--  1 hoon  staff   14  8 13 20:56 README.md
drwxr-xr-x  5 hoon  staff  160  8 13 18:52 bin
drwxr-xr-x  6 hoon  staff  192  8 13 18:36 resources
-rw-r--r--  1 hoon  staff    0  8 13 15:50 setenv.sh
-rw-r--r--  1 hoon  staff  220  8 13 20:56 test-rclone-mount.sh
-rw-r--r--  1 hoon  staff  494  8 13 20:49 test-rclone-rcat.sh
-rw-r--r--  1 hoon  staff  455  8 13 20:53 test-rsync.sh

$ bash -x test-rsync.sh
$ bash -x test-rclone-rcat.sh
$ bash -x test-rclone-mount.sh
```

# Test (Pod)
## Setup
```console
$ bash bin/setup-pod.sh
(create pod...)
# hostname
tools-backup-test-agent
# which kubectl rsync rclone
/usr/local/bin/kubectl
/usr/bin/rsync
/usr/bin/rclone
# git clone https://github.com/yanghoon/backup-test.git && cd backup-test
# ls -l
total 24
-rw-r--r--    1 root     root            13 Aug 13 21:06 README.md
drwxr-xr-x    2 root     root          4096 Aug 13 21:06 bin
drwxr-xr-x    2 root     root          4096 Aug 13 21:06 resources
-rw-r--r--    1 root     root             0 Aug 13 21:06 setenv.sh
-rw-r--r--    1 root     root           220 Aug 13 21:06 test-rclone-mount.sh
-rw-r--r--    1 root     root           494 Aug 13 21:06 test-rclone-rcat.sh
-rw-r--r--    1 root     root           455 Aug 13 21:06 test-rsync.sh
```

## Test
> Same with Local Test
