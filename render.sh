set -euo pipefail

mkdir -p output output/assets

# Make HTML assets resolvable when opening output/output.html
cp -r assets/* output/assets/ || true

# HTML (use CDN MathJax so it works on Windows/macOS too)
pandoc content.md \
  -o output/output.html \
  --standalone \
  --toc \
  --mathjax=https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js

# PDF (XeLaTeX)
pandoc content.md \
  -o output/output.pdf \
  --pdf-engine=xelatex \
  -M lang=en-US \
  -V geometry:margin=1in \
  -V mainfont="Noto Sans CJK TC" \
  -V CJKmainfont="Noto Sans CJK TC"