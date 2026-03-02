set -euo pipefail

mkdir -p output

pandoc content.md \
  -o output/output.html \
  --standalone \
  --toc \
  --mathjax

pandoc content.md \
  -o output/output.pdf \
  --pdf-engine=xelatex \
  -M lang=en-US \
  -V geometry:margin=1in \
  -V mainfont="Noto Sans CJK TC" \
  -V CJKmainfont="Noto Sans CJK TC"