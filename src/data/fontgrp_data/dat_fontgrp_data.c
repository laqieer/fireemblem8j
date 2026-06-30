#include "global.h"

/* 2bpp->4bpp colour-conversion LUTs (gFontgrp_3..15). These were previously
 * INCBIN'd from graphics/fontgrp/gFontgrp_N.tsa.bin, but they are not tilemaps:
 * each is a 256-entry u16 table that expands a packed 2bpp source byte into four
 * 4bpp pixels via a per-table COLOR_CONVERT(). Generated from real source
 * (fe8u src/data/fonts/color_lookup_tables.h) instead of opaque binaries; the
 * macro output is byte-identical to the JP ROM (gated by `make compare`).
 *
 * FONTGRP_LUT pins each array to the named subsection the JP ldscript expects so
 * placement is byte-identical (fe8u relies on whole-object placement instead). */

#define FONTGRP_LUT SECTION(".rodata.dat_fontgrp_data")
#include "src/data/fonts/color_lookup_tables.h"
