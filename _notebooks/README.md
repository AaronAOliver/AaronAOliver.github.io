# Analysis notebooks

Source for the interactive notebooks served at <https://aaronoliver.dev/notebooks/>.
Jekyll ignores this folder because its name starts with `_`. The rendered HTML
is copied into `/notebooks/`, which is committed and served as-is.

| Notebook | Paper | Data repository | Engine |
|---|---|---|---|
| `kyphosus-mags.qmd` | Oliver *et al.* 2024, *mBio* | KyphosusMAGs | R |
| `enrichments-metatranscriptomics.qmd` | Plominsky, Oliver *et al.* 2026, *mBio* | Enrichments_metatranscriptomics | R |
| `kiritimatiellia-scone.qmd` | Oliver, Podell & Allen 2026, *bioRxiv* | KiritimatiallesSCoNe | Python |
| `mpcgc.qmd` | Oliver, Podell & Allen 2026, *bioRxiv* | mpCGC | Python |

## Layout expected on disk

```
science-portfolio/
    AaronAOliver.github.io/     (this repo)
        _notebooks/             .qmd sources, _common.R/.py, theme
        notebooks/              rendered output (commit this)
    KyphosusMAGs/
    Enrichments_metatranscriptomics/
    KiritimatiallesSCoNe/
    mpCGC/
```

If the four data repositories live somewhere else, set `PORTFOLIO_DATA` to the
folder that contains them.

## Rebuild

```sh
cd _notebooks
quarto render          # renders all five pages, then _publish.py copies _site/ -> ../notebooks/
```

`quarto render <file>.qmd` renders a single page into `_site/` for a quick
preview without touching `/notebooks/`.

## Requirements

- Quarto 1.5 or later
- R 4.3 or later with: tidyverse, plotly, DT, ape, phangorn, ggrepel, ggbeeswarm,
  ggnewscale, svglite, and from Bioconductor ggtree, treeio, ggtreeExtra
- Python 3.9 or later with: jupyter, pandas, numpy, scipy, plotly, python-igraph

## Look

The R notebooks are styled like R Markdown `html_document` reports (floating
table of contents, numbered sections, "Code" buttons), and the Python notebooks
like classic Jupyter notebooks (`In [n]:` / `Out[n]:` prompts, code shown). Each
page picks its style with `body-classes: nb-rmd` or `body-classes: nb-jupyter`
in its front matter. The styles are in `assets/portfolio.scss`, and the prompts
are added by `assets/notebook.html`.

The card images in `assets/thumbs/` are drawn from each notebook's own data.
The main site's home and portfolio pages also use them (through the
`thumbnail` field in `_portfolio/*.md`), so keep the file names in step.

## Notes

- The interactive Cytoscape networks in `assets/scone/` are copied from
  `KiritimatiallesSCoNe/data/cgc_scone/`. They load Cytoscape.js from cdnjs.
- The SCoNe notebook builds a SCoNe step by step with igraph instead of calling
  `scone run`, because `build_ssn_generic.py` shells out to `grep`, which
  Windows does not have. The metrics come from `scone/scone_metrics.py`.
- The metatranscriptomics notebook uses the summary tables in its repository.
  The full RSEM matrix (`data/binned_expression_fixed.tab`) is not committed
  there, so the enzyme-level area plots are shown as the published SVGs.
