/* Restyle Plotly figures embedded in mpCGCdb pages: site font and text
 * colours, light hover labels, and figures sized to their frame instead
 * of a fixed pixel width (which caused sideways scrolling). Linked by
 * scripts/apply_theme.py. */
(function () {
  var FONT = "'Source Sans 3', 'Segoe UI', -apple-system, Roboto, sans-serif";

  function theme(gd) {
    if (!window.Plotly || !gd || !gd.layout || gd.__mpcgcThemed) return;
    gd.__mpcgcThemed = true;
    var upd = {
      'font.family': FONT,
      'font.color': '#3a4754',
      'hoverlabel.bgcolor': '#ffffff',
      'hoverlabel.bordercolor': '#c9d0d7',
      'hoverlabel.font.family': FONT,
      'hoverlabel.font.color': '#17212b',
      'hoverlabel.font.size': 13
    };
    if (gd.layout.title) upd['title.font.family'] = FONT;
    // Some trees were saved with the plot box sized for every leaf (e.g.
    // 2,198 px) but the figure capped at 1,100 px, leaving a blank band
    // below the tree. Shrink the box to the figure.
    var lh = gd.layout.height;
    if (lh && gd.offsetHeight > lh + 2) gd.style.height = lh + 'px';
    // Figures meant to fill their frame (style height:100%, no fixed height)
    // sit inside a wrapper <div> with no height of its own, so they fell back
    // to Plotly's 450 px default and left a blank band below (the sunbursts).
    // Give the wrappers the frame's height so the figure can fill it.
    if (!lh && /height:\s*100%/.test(gd.getAttribute('style') || '')) {
      for (var el = gd.parentElement; el && el !== document.body; el = el.parentElement) {
        el.style.height = '100%';
      }
      gd.__mpcgcFill = true;
    }
    if (gd.layout.width) {               // fixed-width figure: fit it to the frame instead
      gd.__mpcgcFit = true;
      gd.style.width = '100%';
      upd.width = frameWidth(gd);
    }
    Plotly.relayout(gd, upd);
    if (gd.__mpcgcFill) Plotly.Plots.resize(gd);
  }

  function frameWidth(gd) {
    return Math.max(320, (gd.parentElement || document.body).clientWidth);
  }

  function all() { return document.querySelectorAll('.js-plotly-plot'); }

  function refit() {
    all().forEach(function (gd) {
      if (gd.__mpcgcFit) Plotly.relayout(gd, { width: frameWidth(gd) });
      else Plotly.Plots.resize(gd);
    });
  }

  function run() {
    all().forEach(theme);
    var t;
    window.addEventListener('resize', function () {
      clearTimeout(t);
      t = setTimeout(refit, 120);
    });
  }

  // Restyle as soon as the figures exist (DOMContentLoaded, after the inline
  // newPlot calls) rather than on 'load', which waits for fonts and every
  // other resource: the figures were visibly drawn once and then resized.
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', run);
  else run();
})();
