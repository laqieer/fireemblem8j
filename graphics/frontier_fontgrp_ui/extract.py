#!/usr/bin/env python3
"""Phase-1 extractor for frontier_fontgrp_ui: replaces `.incbin "baserom.gba"` in asm/frontier_fontgrp_ui.s
with committed, byte-verified graphics source assets in this directory.

Re-runnable / idempotent. Uses the shared byte-typed extractor
graphics/_lib/extract_frontier_gfx.py (LZ77 -> decompressed .bin + gbagfx %.lz:%,
raw palette -> .pal + %.gbapal:%.pal, other raw -> verbatim .bin). The only oracle
is byte-exactness; run `make compare` (and `make clean && make compare`) after.

Usage:  graphics/frontier_fontgrp_ui/extract.py            # dry-run / verify
        graphics/frontier_fontgrp_ui/extract.py --apply    # commit assets + rewrite .s + .mk
"""
import os, sys
ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
sys.path.insert(0, os.path.join(ROOT, "graphics", "_lib"))
import extract_frontier_gfx as efg  # noqa: E402

HEADER = (
    "frontier_fontgrp_ui -- region-DIFFERENT UI font-group graphics blob (JP 0x0859d4fc,\n112608 B, uncompressed 4bpp). Committed verbatim .bin, incbin'd directly. Oracle: make compare."
)

if __name__ == "__main__":
    efg.run_file(
        asm="asm/frontier_fontgrp_ui.s",
        out_dir="graphics/frontier_fontgrp_ui",
        name_prefix="fontgrp_ui",
        header=HEADER,
        apply="--apply" in sys.argv,
    )
