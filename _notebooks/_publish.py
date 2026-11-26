"""Quarto post-render hook: mirror the rendered site into ../notebooks for Jekyll."""
import os
import shutil
from pathlib import Path

if os.environ.get("QUARTO_PROJECT_RENDER_ALL") != "1":
    # Rendering a single file: leave /notebooks alone, run `quarto render` for the full site.
    raise SystemExit(0)

src = Path(__file__).parent / "_site"
dst = Path(__file__).parent.parent / "notebooks"
dst.mkdir(exist_ok=True)
# Empty the folder rather than deleting it, so a local preview server that has
# /notebooks open does not make the copy fail.
for child in dst.iterdir():
    if child.is_dir():
        shutil.rmtree(child)
    else:
        child.unlink()
shutil.copytree(src, dst, dirs_exist_ok=True)
print(f"[publish] copied {src} -> {dst}")
