# graphics/portrait -- per-subsystem asset wiring (parallel-safe pin mechanism).
# Auto-included by the root Makefile via `-include $(GRAPHICS_MK)`. See
# graphics/misc/misc.mk for the convention.
#
# asm/dat_data_portrait.s .incbins 482 portrait assets (region-SAME with US,
# JP 0x08861950 == US 0x0880d3f8). Per asset class:
#   *_palette  -> committed .agbpal binary, incbin'd verbatim (no build step)
#   *_mouth    -> .4bpp  (PNG -> 4bpp, uncompressed)
#   *_chibi    -> .4bpp.lz (PNG -> 4bpp -> LZ77, gbagfx default mindist 2)
#   *_card     -> .4bpp.lz (PNG -> 4bpp -> LZ77, gbagfx default mindist 2)
#   *_tileset  -> .4bpp.fk (PNG -> 4bpp -> FE fake-comp header, %.fk rule)
# All LZ assets use gbagfx's DEFAULT -mindist 2, so NO per-asset pins are needed
# (verified byte-exact by scripts/extract_graphics.py's 1/2/3 sweep). Ported by
# scripts/extract_graphics.py; see docs/tools/gbagfx.md.
#
# The generated .4bpp[.lz/.fk] must be rebuilt from the committed PNGs before the
# .s is assembled, so derive the dep list from the committed PNGs by class.
PORTRAIT_MOUTH_4BPP  := $(patsubst %.png,%.4bpp,$(wildcard graphics/portrait/*_mouth.png))
PORTRAIT_CHIBI_LZ    := $(patsubst %.png,%.4bpp.lz,$(wildcard graphics/portrait/*_chibi.png))
PORTRAIT_CARD_LZ     := $(patsubst %.png,%.4bpp.lz,$(wildcard graphics/portrait/*_card.png))
PORTRAIT_TILESET_FK  := $(patsubst %.png,%.4bpp.fk,$(wildcard graphics/portrait/*_tileset.png))
asm/dat_data_portrait.o: $(PORTRAIT_MOUTH_4BPP) $(PORTRAIT_CHIBI_LZ) $(PORTRAIT_CARD_LZ) $(PORTRAIT_TILESET_FK)
