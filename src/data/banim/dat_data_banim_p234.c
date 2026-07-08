#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p234.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p234") u16 Pal_EfxChillEffectBG[] = INCBIN_U16("graphics/banim/_us/banim/assets/pal/007456E8_Pal_EfxChillEffectBG.gbapal");
SECTION(".rodata.dat_data_banim_p234") u16 Tsa1_EfxChillEffectBG[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/007457A8_Tsa1_EfxChillEffectBG.map.bin.lz");
SECTION(".rodata.dat_data_banim_p234") u16 Tsa2_EfxChillEffectBG[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/00745B74_Tsa2_EfxChillEffectBG.map.bin.lz");
SECTION(".rodata.dat_data_banim_p234") u16 Tsa3_EfxChillEffectBG[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/00745FD0_Tsa3_EfxChillEffectBG.map.bin.lz");
struct AnimSpriteData AnimSprite_EfxChill_R_1[] __attribute__((section(".rodata.dat_data_banim_p234"))) =
{
    { .header = 0x80008000, .as = { .object = { 0x0020, -8, -16 } } },
    { .header = 0x40008000, .as = { .object = { 0x0022, 8, -16 } } },
    { .header = 0x00000000, .as = { .object = { 0x0000, -1, -24 } } },
    ANIM_SPRITE_END,
};
