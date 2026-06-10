# graphics/misc -- per-subsystem asset wiring (PARALLEL-SAFE pin mechanism, D-graphics).
#
# This file is auto-picked-up by the root Makefile via `-include $(GRAPHICS_MK)`
# (GRAPHICS_MK := $(shell find graphics -name '*.mk')). Each graphics subsystem owns
# ONE such *.mk so concurrent extraction agents add a NEW file per subsystem instead
# of editing the shared Makefile -- no merge conflicts on -mindist pins / object deps.
#
# Put here, for this subsystem only:
#   * per-asset LZ_FLAGS := -mindist N overrides (gbagfx byte-match knob), and
#   * object -> generated-asset dependencies (so the .4bpp[.lz/.fk] is rebuilt from
#     the committed PNG/.pal before the .s that .incbins it is assembled).

# --- PILOT asset (Phase 0): Img_MenuScrollBar --------------------------------
# The menu scroll-bar UI graphic (16x64, 4bpp), the FIRST FE8J region reproduced
# from a committed source asset instead of `.incbin "baserom.gba"`. LZ-compressed
# in the ROM with gbagfx's default minimum match distance of 2 (verified by
# decompress->recompress->diff against the ROM blob at 0x00A9645C).
graphics/misc/Img_MenuScrollBar.4bpp.lz: LZ_FLAGS := -mindist 2

# asm/dat_worldmap_gmapunit_p1598.o .incbins the REBUILT .4bpp.lz (not baserom), so
# it must be regenerated from the committed PNG before the asm is assembled.
asm/dat_worldmap_gmapunit_p1598.o: graphics/misc/Img_MenuScrollBar.4bpp.lz
