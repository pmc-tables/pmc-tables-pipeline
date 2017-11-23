# README

## NCBI

Download `pubmed`:

```bash
lftp ftp://ftp.ncbi.nlm.nih.gov <<EOF
mirror -c --parallel=8 /pubmed/baseline/ ./pubmed/baseline/
mirror -c --parallel=8 /pubmed/updatefiles/ ./pubmed/updatefiles/
EOF
```

Download `oa_package`:

```bash
lftp ftp://ftp.ncbi.nlm.nih.gov <<EOF
set net:socket-buffer 33554432
get -c /pub/pmc/oa_file_list.csv -o ./pmc/oa_file_list.csv
mirror -c --parallel=8 /pub/pmc/oa_package/ ./pmc/oa_package/
EOF
```

Download `manuscript`:

```bash
lftp ftp://ftp.ncbi.nlm.nih.gov <<EOF
set net:socket-buffer 33554432
get -c /pub/pmc/manuscript/filelist.csv -o ./pmc/manuscript/filelist.csv
mirror -c --parallel=8 /pub/pmc/manuscript/ ./pmc/manuscript/ --include-glob='*.xml.tar.gz'
EOF
```

Download `xml` files:

```bash
lftp ftp://ftp.ncbi.nlm.nih.gov <<EOF
set net:socket-buffer 33554432
set cmd:parallel 4
get -c /pub/pmc/articles.A-B.xml.tar.gz -o ./pmc/articles.A-B.xml.tar.gz
get -c /pub/pmc/articles.C-H.xml.tar.gz -o ./pmc/articles.C-H.xml.tar.gz
get -c /pub/pmc/articles.I-N.xml.tar.gz -o ./pmc/articles.I-N.xml.tar.gz
get -c /pub/pmc/articles.O-Z.xml.tar.gz -o ./pmc/articles.O-Z.xml.tar.gz
EOF
```

## EBI

Download supplemental information:

```bash
lftp ftp://ftp.ebi.ac.uk <<EOF
set net:socket-buffer 33554432
mirror -c --parallel=8 /pub/databases/pmc/suppl/ ./pmc/suppl/
EOF
```
