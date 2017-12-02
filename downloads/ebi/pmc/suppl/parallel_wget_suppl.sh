#!/bin/bash

set -ev

N_JOBS=64

echo "Downloading NON-OA subset..."
rm -f .listing index.html*
wget --no-remove-listing ftp://ftp.ebi.ac.uk/pub/databases/pmc/suppl/NON-OA/
awk '{print $9}' .listing | tail -n+3 | tr -d '\r' | parallel -j ${N_JOBS} --joblog non-oa-joblob.txt wget --no-verbose -m -nH --cut-dirs=4 ftp://ftp.ebi.ac.uk/pub/databases/pmc/suppl/NON-OA/{}/ || true
echo "Done downloading NON-OA subset!"

echo "Downloading OA subset..."
rm -f .listing index.html*
wget --no-remove-listing ftp://ftp.ebi.ac.uk/pub/databases/pmc/suppl/OA/
awk '{print $9}' .listing | tail -n+3 | tr -d '\r' | parallel -j ${N_JOBS} --joblog oa-joblog.txt wget --no-verbose -m -nH --cut-dirs=4 ftp://ftp.ebi.ac.uk/pub/databases/pmc/suppl/OA/{}/ || true
echo "Done downloading OA subset!"

