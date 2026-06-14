#include "global.h"

/* JP const_data_DB034 region-different graphics (JP 0x080E0044..0x080E1870).
 * Migrated from asm/dat_const_data_DB034_gf.s.
 * All symbols go into the single named rodata section dat_const_data_DB034_gf.
 */

#define SECTION_DB034 __attribute__((section(".rodata.dat_const_data_DB034_gf")))

SECTION_DB034 const u8 Img_ConstDataDB034_0[] = INCBIN_U8("graphics/misc_gfx2/Img_ConstDataDB034_0.bin.lz");
SECTION_DB034 const u8 Img_ConstDataDB034_1[] = INCBIN_U8("graphics/misc_gfx2/Img_ConstDataDB034_1.bin.lz");
SECTION_DB034 const u8 Img_ConstDataDB034_2[] = INCBIN_U8("graphics/misc_gfx2/Img_ConstDataDB034_2.bin.lz");
SECTION_DB034 const u8 Img_ConstDataDB034_3[] = INCBIN_U8("graphics/misc_gfx2/Img_ConstDataDB034_3.bin.lz");
SECTION_DB034 const u8 Img_ConstDataDB034_4[] = INCBIN_U8("graphics/misc_gfx2/Img_ConstDataDB034_4.bin.lz");
SECTION_DB034 const u16 Pal_NewEkrBaseKaiten[] = INCBIN_U16("graphics/misc_gfx2/Pal_NewEkrBaseKaiten.gbapal");
