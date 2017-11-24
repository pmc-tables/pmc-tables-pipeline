#!/bin/bash

set -ev

lftp ftp://ftp.ncbi.nlm.nih.gov <<EOF
set net:socket-buffer 33554432
set ftp:sync-mode off
set cmd:parallel 12
pget -c -n 12 /pub/pmc/manuscript/filelist.csv -o ./ncbi/pmc/manuscript/filelist.csv
mirror -c --parallel=12 --use-pget-n=12 --include-glob='*.xml.tar.gz' \
    /pub/pmc/manuscript/ ./ncbi/pmc/manuscript/
EOF
