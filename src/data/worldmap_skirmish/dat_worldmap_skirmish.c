#include "global.h"

/* Migrated from asm/dat_worldmap_skirmish.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_worldmap_skirmish") u8 Img_WorldMapPlaceDot[] = INCBIN_U8("graphics/misc_gfx2/Img_WorldMapPlaceDot.bin.lz");
SECTION(".rodata.dat_worldmap_skirmish") u16 Pal_WmPlaceDot_Highlight[] = INCBIN_U16("graphics/misc_gfx2/Pal_WmPlaceDot_Highlight.gbapal");
SECTION(".rodata.dat_worldmap_skirmish") u16 Pal_WmPlaceDot_Standard[] = INCBIN_U16("graphics/misc_gfx2/Pal_WmPlaceDot_Standard.gbapal");
SECTION(".rodata.dat_worldmap_skirmish") u8 gWorldmapSkirmish_0[] = INCBIN_U8("data/residual/gWorldmapSkirmish_0.bin");
