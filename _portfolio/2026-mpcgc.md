---
title: "mpCGCdb: polysaccharide-utilization gene clusters across the ocean"
excerpt: "A catalog of 289,962 CAZyme gene clusters from 22,607 marine genomes, built with my Nextflow pipeline mpCGC."
collection: portfolio
date: 2026-09-25
link: /notebooks/mpcgc.html
thumbnail: /notebooks/assets/thumbs/mpcgc.png
thumbnail_alt: "CAZyme gene clusters against genomes for each phylum in mpCGCdb"
paper_url: https://doi.org/10.64898/2026.09.21.753266
paper_label: bioRxiv 2026
code_url: https://github.com/AaronAOliver/mpCGC
web_url: https://mpcgcdb.com
web_label: mpCGCdb
---

mpCGC extends dbCAN with a cross-genome catalog, an enzyme-mining layer
(colocalization networks, sequence similarity networks with Leiden communities,
alignments and phylogenies) and a diversity layer (enzyme fingerprints and
Chao2 rarefaction). The database can be browsed at
[mpcgcdb.com](https://mpcgcdb.com).

## In the notebook

- The pipeline
- What the database contains, with a taxonomy browser
- Rarefaction of cluster diversity by lineage
- Phylum-specific cluster signatures
- The S1_4 sulfatase: phylogeny, taxonomy, host prevalence and colocalization network
- Enzyme colocalization
