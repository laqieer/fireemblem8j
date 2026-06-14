#include "global.h"

/* Migrated from asm/dat_data_banim_p19.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

extern u8 Tsa_BreathBgBase[1] __attribute__((alias("gUnk_EfxSongObj2")));
u8 gUnk_EfxSongObj2[] __attribute__((section(".rodata.dat_data_banim_p19"))) = INCBIN_U8("graphics/banim/_us/banim/assets/tsa/005DD518_Tsa_BreathBgBase.map.bin.lz");
u8 Pal_BreathBgBase[] __attribute__((section(".rodata.dat_data_banim_p19"))) = INCBIN_U8("graphics/banim/_us/banim/assets/pal/005DD734_Pal_BreathBgBase.agbpal");
u8 Tsa_BreathBgBase_1[] __attribute__((section(".rodata.dat_data_banim_p19"))) = INCBIN_U8("graphics/banim/_us/banim/assets/tsa/005DDAF4_Tsa_085DDAF4.map.bin.lz");
