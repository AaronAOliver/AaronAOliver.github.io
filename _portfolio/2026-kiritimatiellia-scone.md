---
title: "Conserved synteny across Kiritimatiellia"
excerpt: "Similarity-colocalization networks (SCoNes): a new network structure for conserved gene neighborhoods, applied to 898 genomes."
collection: portfolio
date: 2026-10-08
link: /notebooks/kiritimatiellia-scone.html
thumbnail: /notebooks/assets/thumbs/scone.png
thumbnail_alt: "Colocalization network of CAZyme gene clusters across Kiritimatiellia genomes"
paper_url: https://doi.org/10.64898/2026.10.06.756941
paper_label: bioRxiv 2026
code_url: https://github.com/AaronAOliver/KiritimatiallesSCoNe
---

A SCoNe starts from a sequence similarity network, groups proteins into
homology communities with weighted Leiden clustering, and links communities
whose members share gene neighborhoods. I used SCoNes to show that
polysaccharide degradation, hydrogenases, nitrogen fixation and natural-product
biosynthesis in Kiritimatiellia fit together as one saccharolytic lifestyle.

## In the notebook

- Building a SCoNe step by step from a synthetic dataset
- Scoring it with the package's own metrics
- Interactive Cytoscape networks of the CAZyme gene clusters
- A survey of 898 genomes
- Hydrogenase, nitrogen fixation and natural-product networks
- The six manuscript figures
