#!/usr/bin/env python3
"""Phase-1 extractor for gfx_data_bg: replaces `.incbin "baserom.gba"` in asm/gfx_data_bg.s
with committed, byte-verified graphics source assets in this directory.

Re-runnable / idempotent. Uses the shared byte-typed extractor
graphics/_lib/extract_frontier_gfx.py (LZ77 -> decompressed .bin + gbagfx %.lz:%,
raw palette -> .pal + %.gbapal:%.pal, other raw -> verbatim .bin). The only oracle
is byte-exactness; run `make compare` (and `make clean && make compare`) after.

Usage:  graphics/gfx_data_bg/extract.py            # dry-run / verify
        graphics/gfx_data_bg/extract.py --apply    # commit assets + rewrite .s + .mk
"""
import os, sys
ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
sys.path.insert(0, os.path.join(ROOT, "graphics", "_lib"))
import extract_frontier_gfx as efg  # noqa: E402

HEADER = (
    "gfx_data_bg -- region-DIFFERENT background graphics (JP 0x08926b14..0x089cd958),\nthe largest graphics file. Per blob the asset TYPE is inferred from the BYTES:\nLZ77 tiles/tilemaps -> committed decompressed .bin rebuilt via gbagfx %.lz: %;\nraw 256-byte palettes -> committed JASC .pal rebuilt via %.gbapal: %.pal;\nother raw blobs (tilemaps) -> committed verbatim .bin, incbin'd directly. Extracted\nfresh from the JP ROM (region-different). Oracle: make compare."
)

if __name__ == "__main__":
    efg.run_file(
        asm="asm/gfx_data_bg.s",
        out_dir="graphics/gfx_data_bg",
        name_prefix="data_bg",
        header=HEADER,
        apply="--apply" in sys.argv,
    )
