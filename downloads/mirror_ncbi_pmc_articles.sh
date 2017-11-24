#!/bin/bash

set -ev

lftp ftp://ftp.ncbi.nlm.nih.gov <<EOF
set net:socket-buffer 33554432
set ftp:sync-mode off
pget -c -n 12 /pub/pmc/articles.A-B.xml.tar.gz -o ./ncbi/pmc/articles.A-B.xml.tar.gz
pget -c -n 12 /pub/pmc/articles.C-H.xml.tar.gz -o ./ncbi/pmc/articles.C-H.xml.tar.gz
pget -c -n 12 /pub/pmc/articles.I-N.xml.tar.gz -o ./ncbi/pmc/articles.I-N.xml.tar.gz
pget -c -n 12 /pub/pmc/articles.O-Z.xml.tar.gz -o ./ncbi/pmc/articles.O-Z.xml.tar.gz
EOF

