import os
import subprocess
import sys

def run(cmd: list[str]) -> None:
    subprocess.run(cmd, check=True)

def main() -> int:
    os.makedirs("output", exist_ok=True)

    run(["pandoc", "content.md", "-o", "output/output.html", "--standalone", "--toc", "--mathjax"])
    run([
        "pandoc", "content.md", "-o", "output/output.pdf",
        "--pdf-engine=xelatex",
        "-M", "lang=en-US",
        "-V", "geometry:margin=1in",
        "-V", "mainfont=Noto Sans CJK TC",
        "-V", "CJKmainfont=Noto Sans CJK TC",
    ])
    return 0

if __name__ == "__main__":
    raise SystemExit(main())