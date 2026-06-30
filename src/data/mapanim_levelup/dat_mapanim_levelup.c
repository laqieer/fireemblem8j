#include "global.h"

/* Migrated from asm/dat_mapanim_levelup.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_mapanim_levelup") u16 Pal_ManimLevelUpStatGainCycling[] = INCBIN_U16("graphics/misc_gfx2/Pal_ManimLevelUpStatGainCycling.gbapal");
SECTION(".rodata.dat_mapanim_levelup") u16 Img_ManimLevelUpText[] = INCBIN_U16("graphics/misc_gfx2/Img_ManimLevelUpText.4bpp.lz");
SECTION(".rodata.dat_mapanim_levelup") u16 Pal_ManimLevelUp[] = INCBIN_U16("graphics/misc_gfx2/Pal_ManimLevelUp.gbapal");
SECTION(".rodata.dat_mapanim_levelup") u16 Img_ManimLevelUpStatGain[] = INCBIN_U16("graphics/misc_gfx2/Img_ManimLevelUpStatGain.4bpp.lz");
SECTION(".rodata.dat_mapanim_levelup") u8 Img_ManimLevelUpStatGainDigits[] = INCBIN_U8("graphics/misc_gfx2/Img_ManimLevelUpStatGainDigits.4bpp");
/* Map-anim level-up sprite-frame script, ported from ../fireemblem8u
 * src/data/mapanim/mapanim_levelup.c (region-same). Byte-identical to the former
 * INCBIN of data/residual/gMapanimLevelup_0.bin. */
SECTION(".rodata.dat_mapanim_levelup") u16 gMapanimLevelup_0[] =
{
    0x0210, 0x0006, 0x0007, 0x0007, 0x0007, 0x0007, 0x0007, 0x0007,
    0x0007, 0x0007, 0x0007, 0x0007, 0x0007, 0x0007, 0x0007, 0x0007,
    0x0007, 0x0008, 0x0003, 0x0004, 0x0004, 0x0004, 0x0004, 0x0004,
    0x0004, 0x0004, 0x0004, 0x0004, 0x0004, 0x0004, 0x0004, 0x0004,
    0x0004, 0x0004, 0x0005, 0x0000, 0x0009, 0x000A, 0x000B, 0x000C,
    0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001,
    0x0001, 0x0001, 0x0001, 0x0002,
};
