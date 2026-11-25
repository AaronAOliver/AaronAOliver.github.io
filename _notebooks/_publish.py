"""Quarto post-render hook: mirror the rendered site into ../notebooks for Jekyll."""
import os
import shutil
from pathlib import Path

if os.environ.get("QUARTO_PROJECT_RENDER_ALL") != "1":
    # Rendering a single file: leave /notebooks alone, run `quarto render` for the full site.
    raise SystemExit(0)

src = Path(__file__).parent / "_site"
dst = Path(__file__).parent.parent / "notebooks"
if dst.exists():
    shutil.rmtree(dst)
shutil.copytree(src, dst)
print(f"[publish] copied {src} -> {dst}")
