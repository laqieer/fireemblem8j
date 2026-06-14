#include "global.h"

/* Migrated from asm/dat_data_opanim_gfx_p3.s (region-same graphics, single section).
 * Each symbol kept in the original section in order; byte-identical via INCBIN_U8.
 */

SECTION(".rodata.dat_data_opanim_gfx_p3") u16 Pal_OpAnimSeth[] = INCBIN_U16("graphics/opanim/OpAnimSeth.gbapal");
SECTION(".rodata.dat_data_opanim_gfx_p3") u8 Img_OpAnimMyrrh[] = INCBIN_U8("graphics/opanim/OpAnimMyrrh.4bpp.lz");
SECTION(".rodata.dat_data_opanim_gfx_p3") u8 Img_OpAnimMyrrh2[] = INCBIN_U8("graphics/opanim/OpAnimMyrrh2.4bpp.lz");
SECTION(".rodata.dat_data_opanim_gfx_p3") u8 Tsa_OpAnimMyrrh[] = INCBIN_U8("graphics/opanim/OpAnimMyrrh.map.bin.lz");
