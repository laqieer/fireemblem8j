#include "global.h"

/* Migrated from asm/dat_data_opanim_gfx_p5.s (region-same graphics, single section).
 * Each symbol kept in the original section in order; byte-identical via INCBIN_U8.
 */

SECTION(".rodata.dat_data_opanim_gfx_p5") u16 Pal_OpAnimSaleh[] = INCBIN_U16("graphics/opanim/OpAnimSaleh.gbapal");
SECTION(".rodata.dat_data_opanim_gfx_p5") u8 Img_OpAnimTethys[] = INCBIN_U8("graphics/opanim/OpAnimTethys.4bpp.lz");
SECTION(".rodata.dat_data_opanim_gfx_p5") u8 Img_OpAnimTethys2[] = INCBIN_U8("graphics/opanim/OpAnimTethys2.4bpp.lz");
SECTION(".rodata.dat_data_opanim_gfx_p5") u8 Tsa_OpAnimTethys[] = INCBIN_U8("graphics/opanim/OpAnimTethys.map.bin.lz");
