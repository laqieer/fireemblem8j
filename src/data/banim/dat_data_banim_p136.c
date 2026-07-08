#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p136.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p136") u16 Tsa_RestoreBg_5[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/0067BA68_Tsa_0867BA68.map.bin.lz");
SECTION(".rodata.dat_data_banim_p136") u16 Tsa_RestoreBg_6[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/0067BB50_Tsa_0867BB50.map.bin.lz");
SECTION(".rodata.dat_data_banim_p136") u16 Tsa_RestoreBg_7[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/0067BC40_Tsa_0867BC40.map.bin.lz");
SECTION(".rodata.dat_data_banim_p136") u16 Tsa_RestoreBg_8[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/0067BD40_Tsa_0867BD40.map.bin.lz");
SECTION(".rodata.dat_data_banim_p136") u16 Tsa_RestoreBg_9[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/0067BE4C_Tsa_0867BE4C.map.bin.lz");
SECTION(".rodata.dat_data_banim_p136") u16 Tsa_RestoreBg_10[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/0067BF6C_Tsa_0867BF6C.map.bin.lz");
SECTION(".rodata.dat_data_banim_p136") u16 Tsa_RestoreBg_11[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/0067C09C_Tsa_0867C09C.map.bin.lz");
struct AnimSpriteData AnimSprite_EfxRestOBJ_1[] __attribute__((section(".rodata.dat_data_banim_p136"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x001C, 18, -87 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxRestOBJ_2[] __attribute__((section(".rodata.dat_data_banim_p136"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x001A, 18, -87 } } },
    { .header = 0x00000000, .as = { .object = { 0x001C, 19, -80 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxRestOBJ_3[] __attribute__((section(".rodata.dat_data_banim_p136"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x001B, -21, -90 } } },
    { .header = 0x00000000, .as = { .object = { 0x001A, 18, -87 } } },
    { .header = 0x00000000, .as = { .object = { 0x001A, 19, -80 } } },
    { .header = 0x00000000, .as = { .object = { 0x001C, 20, -74 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxRestOBJ_4[] __attribute__((section(".rodata.dat_data_banim_p136"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x001B, -20, -84 } } },
    { .header = 0x00000000, .as = { .object = { 0x001B, -21, -90 } } },
    { .header = 0x00000000, .as = { .object = { 0x001A, 18, -87 } } },
    { .header = 0x00000000, .as = { .object = { 0x001A, 19, -80 } } },
    { .header = 0x00000000, .as = { .object = { 0x001A, 20, -74 } } },
    { .header = 0x00000000, .as = { .object = { 0x001C, 19, -68 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxRestOBJ_5[] __attribute__((section(".rodata.dat_data_banim_p136"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x001B, -19, -78 } } },
    { .header = 0x00000000, .as = { .object = { 0x001B, -20, -84 } } },
    { .header = 0x00000000, .as = { .object = { 0x001B, -21, -90 } } },
    { .header = 0x00000000, .as = { .object = { 0x0019, 19, -68 } } },
    { .header = 0x00000000, .as = { .object = { 0x001A, 18, -87 } } },
    { .header = 0x00000000, .as = { .object = { 0x001A, 19, -80 } } },
    { .header = 0x00000000, .as = { .object = { 0x001A, 20, -74 } } },
    { .header = 0x00000000, .as = { .object = { 0x001C, 17, -62 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxRestOBJ_6[] __attribute__((section(".rodata.dat_data_banim_p136"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x001B, -17, -72 } } },
    { .header = 0x00000000, .as = { .object = { 0x001B, -19, -78 } } },
    { .header = 0x00000000, .as = { .object = { 0x001B, -20, -84 } } },
    { .header = 0x00000000, .as = { .object = { 0x001B, -21, -90 } } },
    { .header = 0x00000000, .as = { .object = { 0x0019, 17, -62 } } },
    { .header = 0x00000000, .as = { .object = { 0x0019, 19, -68 } } },
    { .header = 0x00000000, .as = { .object = { 0x001A, 18, -87 } } },
    { .header = 0x00000000, .as = { .object = { 0x001A, 19, -80 } } },
    { .header = 0x00000000, .as = { .object = { 0x001A, 20, -74 } } },
    { .header = 0x00000000, .as = { .object = { 0x001C, 14, -56 } } },
    ANIM_SPRITE_END,
};
