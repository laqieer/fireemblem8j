#!/usr/bin/env python3
"""Phase-1 extractor for frontier_chap_title: replaces `.incbin "baserom.gba"` in asm/frontier_chap_title.s
with committed, byte-verified graphics source assets in this directory.

Re-runnable / idempotent. Uses the shared byte-typed extractor
graphics/_lib/extract_frontier_gfx.py (LZ77 -> decompressed .bin + gbagfx %.lz:%,
raw palette -> .pal + %.gbapal:%.pal, other raw -> verbatim .bin). The only oracle
is byte-exactness; run `make compare` (and `make clean && make compare`) after.

Usage:  graphics/frontier_chap_title/extract.py            # dry-run / verify
        graphics/frontier_chap_title/extract.py --apply    # commit assets + rewrite .s + .mk
"""
import os, sys
ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
sys.path.insert(0, os.path.join(ROOT, "graphics", "_lib"))
import extract_frontier_gfx as efg  # noqa: E402

HEADER = (
    "frontier_chap_title -- region-DIFFERENT chapter-title graphics (JP 0x08a7e188..0x08a92514).\nLZ77 tile/tilemap blobs: committed decompressed .bin rebuilds (gbagfx %.lz: %) byte-\nidentical to the JP ROM. Two blobs whose FE8-compressor output gbagfx cannot reproduce\nat -mindist 1/2/3 are committed as verbatim compressed .bin (incbin'd directly). All\nextracted fresh from the JP ROM (region-different). Oracle: make compare."
)

if __name__ == "__main__":
    efg.run_file(
        asm="asm/frontier_chap_title.s",
        out_dir="graphics/frontier_chap_title",
        name_prefix="chap_title",
        header=HEADER,
        apply="--apply" in sys.argv,
    )
