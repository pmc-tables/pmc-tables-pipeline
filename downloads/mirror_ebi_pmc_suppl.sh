#!/bin/bash

set -ev

lftp --version

# set net:socket-buffer 33554432

lftp ftp://ftp.ebi.ac.uk <<EOF
set ftp:sync-mode off
set cmd:parallel 24
set mirror:parallel-transfer-count 64
set mirror:parallel-directories true
mirror -c --only-missing -P24 --log=sync.log /pub/databases/pmc/suppl/ ./ebi/pmc/suppl/
EOF
