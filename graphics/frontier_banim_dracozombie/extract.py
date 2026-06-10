#!/usr/bin/env python3
"""Phase-1 extractor for frontier_banim_dracozombie: replaces `.incbin "baserom.gba"` in asm/frontier_banim_dracozombie.s
with committed, byte-verified graphics source assets in this directory.

Re-runnable / idempotent. Uses the shared byte-typed extractor
graphics/_lib/extract_frontier_gfx.py (LZ77 -> decompressed .bin + gbagfx %.lz:%,
raw palette -> .pal + %.gbapal:%.pal, other raw -> verbatim .bin). The only oracle
is byte-exactness; run `make compare` (and `make clean && make compare`) after.

Usage:  graphics/frontier_banim_dracozombie/extract.py            # dry-run / verify
        graphics/frontier_banim_dracozombie/extract.py --apply    # commit assets + rewrite .s + .mk
"""
import os, sys
ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
sys.path.insert(0, os.path.join(ROOT, "graphics", "_lib"))
import extract_frontier_gfx as efg  # noqa: E402

HEADER = (
    "frontier_banim_dracozombie -- region-DIFFERENT dracozombie battle-animation sheets\n(JP 0x0877bbb8..0x087961e8). LZ77 sheet/tilemap blobs -> committed decompressed .bin\nrebuilt via gbagfx %.lz: %; the rest verbatim .bin. Fresh JP-ROM extraction. Oracle: make compare."
)

if __name__ == "__main__":
    efg.run_file(
        asm="asm/frontier_banim_dracozombie.s",
        out_dir="graphics/frontier_banim_dracozombie",
        name_prefix="dracozombie",
        header=HEADER,
        apply="--apply" in sys.argv,
    )
