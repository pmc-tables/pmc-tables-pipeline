#!/bin/bash

set -ev

lftp ftp://ftp.ncbi.nlm.nih.gov <<EOF
set net:socket-buffer 33554432
set ftp:sync-mode off
mirror -c --parallel=12 --use-pget-n=12 /pubmed/baseline/ ./ncbi/pubmed/baseline/
mirror -c --parallel=12 --use-pget-n=12 /pubmed/updatefiles/ ./ncbi/pubmed/updatefiles/
EOF
