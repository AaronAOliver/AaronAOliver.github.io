# Shared setup for the R notebooks: data paths, palettes, plot themes.

suppressPackageStartupMessages({
  library(tidyverse)
  library(plotly)
  library(DT)
})

# The analysis repositories are cloned next to the website repository:
#   science-portfolio/
#     AaronAOliver.github.io/_notebooks/   <- these .qmd files
#     KyphosusMAGs/
#     Enrichments_metatranscriptomics/
#     ...
# Override with the PORTFOLIO_DATA environment variable if they live elsewhere.
data_root <- Sys.getenv("PORTFOLIO_DATA", unset = normalizePath("../..", winslash = "/"))
repo_path <- function(repo, ...) file.path(data_root, repo, ...)

knitr::opts_chunk$set(dev = "svglite", dev.args = list(bg = "#252a34"))

# Phylum colours shared by both Kyphosus papers
tax_colors <- c(
  "Alphaproteobacteria" = "#006F6C",
  "Bacillota"           = "#BC0000",
  "Bacteroidota"        = "#006DDB",
  "Desulfovibrionales"  = "#22CF22",
  "Desulfobacterota"    = "#22CF22",
  "Fibrobacterota"      = "#8d8d8d",
  "Fusobacteriota"      = "#A7EAF7",
  "Gammaproteobacteria" = "#8453b5",
  "Spirochaetota"       = "#ffdf4d",
  "Verrucomicrobiota"   = "#d5b2f7",
  "WOR-3"               = "#db6d00",
  "Candidatus Tefagiota"= "#db6d00",
  "Eukaryota"           = "#696969",
  "Other Taxa"          = "#D3D3D3"
)

# Site palette (matches aaronoliver.dev and assets/portfolio.scss)
site_bg    <- "#252a34"
site_text  <- "#eaeaea"
site_grid  <- "#3d4452"
site_line  <- "#51555d"
site_teal  <- "#8cd2d5"

theme_portfolio <- function(base_size = 12) {
  theme_minimal(base_size = base_size) +
    theme(
      plot.background  = element_rect(fill = site_bg, colour = NA),
      panel.background = element_rect(fill = site_bg, colour = NA),
      legend.background= element_rect(fill = site_bg, colour = NA),
      legend.key       = element_rect(fill = site_bg, colour = NA),
      panel.grid.major = element_line(colour = site_grid, linewidth = .3),
      panel.grid.minor = element_blank(),
      text             = element_text(colour = site_text),
      axis.text        = element_text(colour = site_text),
      strip.text       = element_text(colour = site_text, face = "bold")
    )
}

# Shared layout for plotly figures (kept under its old name so every chunk uses it)
dark_layout <- function(p, ...) {
  p %>%
    layout(
      paper_bgcolor = site_bg, plot_bgcolor = site_bg,
      font = list(color = site_text, size = 12,
                  family = "-apple-system, Roboto, 'Segoe UI', 'Helvetica Neue', Arial, sans-serif"),
      xaxis = list(gridcolor = site_grid, zerolinecolor = site_grid, linecolor = site_line),
      yaxis = list(gridcolor = site_grid, zerolinecolor = site_grid, linecolor = site_line),
      legend = list(bgcolor = "rgba(0,0,0,0)"),
      hoverlabel = list(font = list(size = 12))
    ) %>%
    layout(...) %>%   # a second call, so axis/legend settings passed here merge with the defaults above
    config(displaylogo = FALSE,
           modeBarButtonsToRemove = c("lasso2d", "select2d", "autoScale2d"))
}

# Searchable table with consistent styling
nb_table <- function(df, page = 10, ...) {
  datatable(df, rownames = FALSE, filter = "top", class = "compact stripe",
            extensions = "Buttons",
            options = list(pageLength = page, scrollX = TRUE, dom = "Bfrtip",
                           buttons = c("copy", "csv")), ...)
}
