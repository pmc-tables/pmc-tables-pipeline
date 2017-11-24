#!/bin/bash

set -ev

lftp ftp://ftp.ebi.ac.uk <<EOF
set net:socket-buffer 33554432
set ftp:sync-mode off
set cmd:parallel 24
set mirror:parallel-directories true
mirror /pub/databases/pmc/suppl/ ./ebi/pmc/suppl/
EOF
