#include "global.h"

/* Migrated from asm/dat_data_opanim_gfx_p24.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 Img_OpAnimSplitLine[] __attribute__((section(".rodata.dat_data_opanim_gfx_p24"))) = INCBIN_U8("graphics/opanim/split_line.4bpp.lz");
u16 Pal_OpAnimSplitLine[] __attribute__((section(".rodata.dat_data_opanim_gfx_p24"))) = INCBIN_U16("graphics/opanim/split_line.gbapal", 0, 32);
u8 Img_opanim_unk1[] __attribute__((section(".rodata.dat_data_opanim_gfx_p24"))) = INCBIN_U8("graphics/opanim/opanim_08AF1B38.4bpp.lz");
u16 Pal_opanim_unk1[] __attribute__((section(".rodata.dat_data_opanim_gfx_p24"))) = INCBIN_U16("graphics/opanim/opanim_08AF1B38.gbapal", 0, 32);
