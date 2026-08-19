#!/bin/sh
#
# Backup data to nas

sudo rsync \
    --verbose \
    --update \
    --recursive \
    --partial \
    --exclude='.rsync.log' \
    --exclude='nas' \
    --exclude='dl' \
    --exclude='templates' \
    --exclude='vm' \
    --log-file=$HOME/.rsync.log \
    $HOME/* /nas/chris/backup
