#include "global.h"

/* Migrated from asm/dat_mapanim_levelup.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_mapanim_levelup") u16 Pal_ManimLevelUpStatGainCycling[] = INCBIN_U16("graphics/misc_gfx2/Pal_ManimLevelUpStatGainCycling.gbapal");
SECTION(".rodata.dat_mapanim_levelup") u16 Img_ManimLevelUpText[] = INCBIN_U16("graphics/misc_gfx2/Img_ManimLevelUpText.bin.lz");
SECTION(".rodata.dat_mapanim_levelup") u16 Pal_ManimLevelUp[] = INCBIN_U16("graphics/misc_gfx2/Pal_ManimLevelUp.gbapal");
SECTION(".rodata.dat_mapanim_levelup") u16 Img_ManimLevelUpStatGain[] = INCBIN_U16("graphics/misc_gfx2/Img_ManimLevelUpStatGain.bin.lz");
SECTION(".rodata.dat_mapanim_levelup") u8 Img_ManimLevelUpStatGainDigits[] = INCBIN_U8("graphics/misc_gfx2/Img_ManimLevelUpStatGainDigits.bin");
SECTION(".rodata.dat_mapanim_levelup") u16 gMapanimLevelup_0[] = INCBIN_U16("data/residual/gMapanimLevelup_0.bin");
