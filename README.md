# PMC Tables Pipeline

## Flowchart

```mermaid
graph TD;
  statistics.ipynb --> download.ipynb;
  to_download.ipynb --> download.ipynb;
  download.ipynb --> archive_to_hdf5.ipynb;
  archive_to_hdf5.ipynb --> query_mutation_tables.ipynb;
  presentation.ipynb;
  project_report.ipynb;
```

## Description

This repository contains the pipeline for extracting and processing tables from [PubMed Central] and [Europe PMC].


[PubMed Central]: https://www.ncbi.nlm.nih.gov/pmc/
[Europe PMC]: https://europepmc.org/