#include "global.h"

/* Migrated from asm/dat_worldmap_gmapunit_p1621.s (region-same graphics, single section).
 * Each symbol kept in the original section in order; byte-identical via INCBIN_U8.
 */

SECTION(".rodata.dat_worldmap_gmapunit_p1621") u8 gGfx_MinimapTiles[] = INCBIN_U8("graphics/gmapunit/gGfx_MinimapTiles.bin.lz");
SECTION(".rodata.dat_worldmap_gmapunit_p1621") u16 gPal_MinimapTiles[] = INCBIN_U16("graphics/gmapunit/gPal_MinimapTiles.gbapal");
SECTION(".rodata.dat_worldmap_gmapunit_p1621") u16 gPal_Minimap_0[] = INCBIN_U16("graphics/gmapunit/gPal_Minimap_0.gbapal");
