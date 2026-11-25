---
title: "mpCGC: a pipeline for marine CAZyme gene clusters"
excerpt: "A Nextflow pipeline that annotates CAZyme gene clusters across thousands of marine genomes. I used it to build mpCGCdb.<br/><img src='/notebooks/assets/thumbs/mpcgc.png' width='500'>"
collection: portfolio
date: 2026-09-25
link: /notebooks/mpcgc.html
---

[Open the interactive notebook](/notebooks/mpcgc.html)

mpCGC extends dbCAN with a cross-genome catalog, an enzyme-mining layer
(colocalization networks, sequence similarity networks with Leiden communities,
alignments and phylogenies) and a diversity layer (enzyme fingerprints and
Chao2 rarefaction). I used it to build [mpCGCdb](https://mpcgcdb.com): 289,962
CAZyme gene clusters from 22,607 marine genomes.

The notebook presents the preprint's five main figures (the pipeline,
cluster richness by lineage, phylum signatures, the S1_4 sulfatase and enzyme
colocalization), with charts built from the database statistics and
interactive views from mpCGCdb.

- Preprint: [Oliver, Podell & Allen 2026, *bioRxiv*](https://doi.org/10.64898/2026.09.21.753266)
- Code: [github.com/AaronAOliver/mpCGC](https://github.com/AaronAOliver/mpCGC)
- Database: [mpcgcdb.com](https://mpcgcdb.com)

*Skills: Nextflow DSL2, conda/Docker/Singularity, HPC (Slurm), Python, dbCAN, DIAMOND, HMMER, CI testing.*
