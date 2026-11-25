"""Shared setup for the Python notebooks: data paths and plotly styling."""
import os
from pathlib import Path

import plotly.graph_objects as go
import plotly.io as pio

# Analysis repositories are cloned next to the website repository (see _common.R)
DATA_ROOT = Path(os.environ.get("PORTFOLIO_DATA", Path("../..").resolve()))


def repo_path(repo, *parts):
    return DATA_ROOT.joinpath(repo, *parts)


# Site palette (matches aaronoliver.dev and assets/portfolio.scss)
SITE_BG, SITE_TEXT, SITE_GRID, SITE_TEAL = "#252a34", "#eaeaea", "#3d4452", "#8cd2d5"

pio.templates["portfolio"] = go.layout.Template(
    layout=dict(
        paper_bgcolor=SITE_BG, plot_bgcolor=SITE_BG,
        font=dict(color=SITE_TEXT, size=12, family="-apple-system, Roboto, 'Segoe UI', 'Helvetica Neue', Arial, sans-serif"),
        xaxis=dict(gridcolor=SITE_GRID, zerolinecolor=SITE_GRID, linecolor="#51555d"),
        yaxis=dict(gridcolor=SITE_GRID, zerolinecolor=SITE_GRID, linecolor="#51555d"),
        legend=dict(bgcolor="rgba(0,0,0,0)"),
        colorway=["#8cd2d5", "#ee5f5b", "#f89406", "#62c462", "#b38bd6", "#52adc8",
                  "#ffdf4d", "#e377c2", "#9aa3b2", "#2a9d8f"],
        margin=dict(l=60, r=20, t=40, b=50),
    )
)
pio.templates.default = "plotly_dark+portfolio"
PLOTLY_CONFIG = {"displaylogo": False, "modeBarButtonsToRemove": ["lasso2d", "select2d"]}


def show(fig):
    fig.show(config=PLOTLY_CONFIG)
