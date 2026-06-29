#include "global.h"

/* Migrated from asm/dat_data_titlescreen.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_titlescreen") u8 gGfx_TitleMainBackground_1[] = INCBIN_U8("graphics/misc_gfx/gGfx_TitleMainBackground_1.4bpp.lz");
SECTION(".rodata.dat_data_titlescreen") u8 gGfx_TitleMainBackground_2[] = INCBIN_U8("graphics/misc_gfx/gGfx_TitleMainBackground_2.4bpp.lz");
SECTION(".rodata.dat_data_titlescreen") u8 gTsa_TitleMainBackground[] = INCBIN_U8("graphics/misc_gfx/gTsa_TitleMainBackground.bin.lz");
SECTION(".rodata.dat_data_titlescreen") u16 gPal_TitleMainBackground[] = INCBIN_U16("graphics/misc_gfx/gPal_TitleMainBackground.gbapal");
SECTION(".rodata.dat_data_titlescreen") u8 gGfx_TitleDragonForeground[] = INCBIN_U8("graphics/misc_gfx/gGfx_TitleDragonForeground.4bpp.lz");
SECTION(".rodata.dat_data_titlescreen") u8 gTsa_TitleDragonForeground[] = INCBIN_U8("graphics/misc_gfx/gTsa_TitleDragonForeground.bin.lz");
SECTION(".rodata.dat_data_titlescreen") u16 gPal_TitleDragonForeground[] = INCBIN_U16("graphics/misc_gfx/gPal_TitleDragonForeground.gbapal");
