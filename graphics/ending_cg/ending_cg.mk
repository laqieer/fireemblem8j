# graphics/ending_cg -- per-subsystem asset wiring (parallel-safe pin mechanism).
# Auto-included by the root Makefile via `-include $(GRAPHICS_MK)`. See
# graphics/misc/misc.mk for the convention.
#
# asm/dat_ending_cg_p0.s .incbins the ending-credits CG gallery (10 CGs x 10 tile
# parts + 1 tilemap + 1 palette each). Region-SAME with US (JP 0x08ad247c ==
# US 0x08a4d1e8). Per asset class:
#   cg_N_part_M_tiles -> graphics/ending_cg/cg_N_part_M.4bpp.lz
#                        (committed PNG -> 4bpp -> LZ77 via %.4bpp:%.png + %.lz:%)
#   cg_N_palette       -> graphics/ending_cg/cg_N.gbapal
#                        (committed JASC .pal -> gbapal via %.gbapal:%.pal)
#   cg_N_map           -> graphics/ending_cg/cg_N.tsa.bin (committed binary verbatim)
#
# The 10 .tsa.bin tilemaps are JP-SPECIFIC: the JP ROM stores the US tilemap bytes
# plus 2 trailing zero-padding bytes (1204 B vs the US 1202 B), so they are
# committed here as exact JP-extracted binaries (incbin'd verbatim, no build step).
#
# All 100 LZ tile parts byte-match at gbagfx's DEFAULT -mindist 2 (verified by the
# 1/2/3 sweep), so NO per-asset -mindist pins are needed.
#
# The generated .4bpp.lz / .gbapal must be rebuilt from the committed PNG/.pal
# before the .s is assembled, so derive the dep lists from the committed sources.
ENDING_CG_TILES_LZ := $(patsubst %.png,%.4bpp.lz,$(wildcard graphics/ending_cg/cg_*_part_*.png))
ENDING_CG_PAL      := $(patsubst %.pal,%.gbapal,$(wildcard graphics/ending_cg/cg_*.pal))
src/data/ending/ending_cg.o: $(ENDING_CG_TILES_LZ) $(ENDING_CG_PAL)
