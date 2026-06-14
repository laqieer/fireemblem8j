#include "global.h"

/* Migrated from asm/dat_const_data_chapter_maps_p4.s (region-same graphics, single section).
 * Each symbol kept in the original section in order; byte-identical via INCBIN_U8.
 */

SECTION(".rodata.dat_const_data_chapter_maps_p4") u8 MapPalette3[] = INCBIN_U8("graphics/map/MapPalette3.gbapal");
SECTION(".rodata.dat_const_data_chapter_maps_p4") u8 MapPalette2[] = INCBIN_U8("graphics/map/MapPalette2.gbapal");
SECTION(".rodata.dat_const_data_chapter_maps_p4") u8 MapPalette1[] = INCBIN_U8("graphics/map/MapPalette1.gbapal");
