---
title: "Conserved synteny across Kiritimatiellia"
excerpt: "Similarity-colocalization networks (SCoNes): a new network structure for conserved gene neighborhoods, applied to 898 genomes.<br/><img src='/notebooks/assets/thumbs/scone.png' width='500'>"
collection: portfolio
date: 2026-10-08
link: /notebooks/kiritimatiellia-scone.html
---

[Open the interactive notebook](/notebooks/kiritimatiellia-scone.html)

A SCoNe starts from a sequence similarity network, groups proteins into
homology communities with weighted Leiden clustering, and links communities
whose members share gene neighborhoods. I used SCoNes to show that
polysaccharide degradation, hydrogenases, nitrogen fixation and natural-product
biosynthesis in Kiritimatiellia fit together as one saccharolytic
lifestyle.

The notebook builds a SCoNe from a synthetic dataset, scores it with
the package's own metrics, and embeds the interactive Cytoscape networks for
the full 898-genome dataset.

- Preprint: [Oliver, Podell & Allen 2026, *bioRxiv*](https://doi.org/10.64898/2026.10.06.756941)
- Code: [github.com/AaronAOliver/KiritimatiallesSCoNe](https://github.com/AaronAOliver/KiritimatiallesSCoNe)

*Skills: network science (igraph, Leiden, Cytoscape.js), comparative genomics, Python packaging, method development.*
