#include "global.h"

/* Migrated from asm/dat_worldmap_minimap_p3.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_worldmap_minimap_p3") u8 Img_EventGmap[] = INCBIN_U8("graphics/misc_gfx2/Img_EventGmap.bin.lz");
SECTION(".rodata.dat_worldmap_minimap_p3") u8 Tsa_EventGmap[] = INCBIN_U8("graphics/misc_gfx2/Tsa_EventGmap.bin.lz");
SECTION(".rodata.dat_worldmap_minimap_p3") u16 Pal_EventGmap[] = INCBIN_U16("graphics/misc_gfx2/Pal_EventGmap.gbapal");
SECTION(".rodata.dat_worldmap_minimap_p3") u8 gImg_WorldmapMinimap_0[] = INCBIN_U8("graphics/misc_gfx2/gImg_WorldmapMinimap_0.bin.lz");
SECTION(".rodata.dat_worldmap_minimap_p3") u16 gPal_WorldmapMinimap_0[] = INCBIN_U16("graphics/misc_gfx2/gPal_WorldmapMinimap_0.gbapal");
SECTION(".rodata.dat_worldmap_minimap_p3") u8 gTsa_WorldmapMinimap_0[] = INCBIN_U8("data/residual/gTsa_WorldmapMinimap_0.bin");
