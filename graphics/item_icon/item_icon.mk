# graphics/item_icon -- per-subsystem asset wiring (parallel-safe pin mechanism).
# Auto-included by the root Makefile via `-include $(GRAPHICS_MK)`. See
# graphics/misc/misc.mk for the convention.
#
# asm/dat_data_item_icon.s .incbins 224 REBUILT graphics/item_icon/*.4bpp (each
# re-encoded from a committed PNG via the generic %.4bpp:%.png rule) plus the
# committed item_icon_palette.agbpal binary. Region-SAME with US, UNCOMPRESSED 4bpp
# (no -mindist needed). The .4bpp must be regenerated from the PNGs before the asm
# is assembled, so derive the dep list from the committed PNGs.
ITEM_ICON_4BPP := $(patsubst %.png,%.4bpp,$(wildcard graphics/item_icon/*.png))
asm/dat_data_item_icon.o: $(ITEM_ICON_4BPP)
