#!/bin/bash

set -ev

lftp ftp://ftp.ncbi.nlm.nih.gov <<EOF
set net:socket-buffer 33554432
set ftp:sync-mode off
set cmd:parallel 12
pget -c -n 12 /pub/pmc/oa_file_list.csv -o ./ncbi/pmc/oa_file_list.csv
mirror -c -n --parallel=12 --use-pget-n=12 /pub/pmc/oa_package/ ./ncbi/pmc/oa_package/
EOF
