#include "global.h"

/* Migrated from asm/dat_worldmap_gmap_p1.s (region-same graphics, single section).
 * Each symbol kept in the original section in order; byte-identical via INCBIN_U8.
 */

SECTION(".rodata.dat_worldmap_gmap_p1") u16 gPal_GMapPI_ShopIcons[] = INCBIN_U16("graphics/misc_gfx2/gPal_GMapPI_ShopIcons.gbapal");
SECTION(".rodata.dat_worldmap_gmap_p1") u8 gGfx_GMapPI_ShopIcons[] = INCBIN_U8("graphics/misc_gfx2/gGfx_GMapPI_ShopIcons.bin.lz");
SECTION(".rodata.dat_worldmap_gmap_p1") u16 gPal_WorldmapGmap_0[] = INCBIN_U16("graphics/misc_gfx2/gPal_WorldmapGmap_0.gbapal");
