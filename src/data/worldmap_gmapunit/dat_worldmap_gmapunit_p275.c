#include "global.h"

/* Migrated from asm/dat_worldmap_gmapunit_p275.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

extern u8 song051_agbfe3_bgm_theme_5_003[1] __attribute__((alias("song051_agbfe3_bgm_theme_5_B1")));
u8 song051_agbfe3_bgm_theme_5_B1[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p275"))) = INCBIN_U8("data/residual/song051_agbfe3_bgm_theme_5_B1.bin");
u8 song051_agbfe3_bgm_theme_5_004[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p275"))) = INCBIN_U8("data/residual/song051_agbfe3_bgm_theme_5_004.bin");
