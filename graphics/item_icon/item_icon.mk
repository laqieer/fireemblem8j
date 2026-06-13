# graphics/item_icon -- per-subsystem asset wiring (parallel-safe pin mechanism).
# Auto-included by the root Makefile via `-include $(GRAPHICS_MK)`. See
# graphics/misc/misc.mk for the convention.
#
# src/data/item_icon/data_item_icon.c INCBIN_U8s 224 item icons + palette.
# Region-SAME with US, UNCOMPRESSED 4bpp (no -mindist needed). The .4bpp must be
# regenerated from the PNGs before the .c is compiled (preproc reads them).
ITEM_ICON_4BPP := $(patsubst %.png,%.4bpp,$(wildcard graphics/item_icon/*.png))
src/data/item_icon/data_item_icon.o: $(ITEM_ICON_4BPP)
