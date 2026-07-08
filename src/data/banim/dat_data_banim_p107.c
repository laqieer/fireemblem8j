#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p107.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p107") u16 Tsa_DivineBg_19[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/00645AC8_Tsa_08645AC8.map.bin.lz");
SECTION(".rodata.dat_data_banim_p107") u16 Tsa_DivineBg_20[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/00645B64_Tsa_08645B64.map.bin.lz");
SECTION(".rodata.dat_data_banim_p107") u16 Tsa_DivineBg2_0[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/00645C00_Tsa_08645C00.map.bin.lz");
SECTION(".rodata.dat_data_banim_p107") u16 Tsa_DivineBg2_1[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/00645C9C_Tsa_08645C9C.map.bin.lz");
SECTION(".rodata.dat_data_banim_p107") u16 Tsa_DivineBg2_2[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/00645D38_Tsa_08645D38.map.bin.lz");
SECTION(".rodata.dat_data_banim_p107") u16 Img_DivineSprites[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/00645DD8_Img_DivineSprites.4bpp.lz");
SECTION(".rodata.dat_data_banim_p107") u16 Pal_DivineSprites[] = INCBIN_U16("graphics/banim/_us/banim/assets/pal/00645F44_Pal_DivineSprites.gbapal");
struct AnimSpriteData AnimSprite_EfxDevineOBJ_1[] __attribute__((section(".rodata.dat_data_banim_p107"))) =
{
    { .header = 0x40004000, .as = { .object = { 0x0023, 0, -34 } } },
    { .header = 0x50004000, .as = { .object = { 0x0023, -32, -34 } } },
    { .header = 0x00004000, .as = { .object = { 0x0027, 32, -34 } } },
    { .header = 0x00004000, .as = { .object = { 0x0007, 32, -42 } } },
    { .header = 0x10004000, .as = { .object = { 0x0027, -48, -34 } } },
    { .header = 0x10004000, .as = { .object = { 0x0007, -48, -42 } } },
    { .header = 0x00004000, .as = { .object = { 0x0004, 16, -50 } } },
    { .header = 0x00000000, .as = { .object = { 0x0006, 32, -50 } } },
    { .header = 0x10004000, .as = { .object = { 0x0004, -32, -50 } } },
    { .header = 0x10000000, .as = { .object = { 0x0006, -40, -50 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxDevineOBJ_2[] __attribute__((section(".rodata.dat_data_banim_p107"))) =
{
    { .header = 0x40004000, .as = { .object = { 0x0023, -2, -36 } } },
    { .header = 0x50004000, .as = { .object = { 0x0023, -30, -36 } } },
    { .header = 0x00004000, .as = { .object = { 0x0027, 30, -36 } } },
    { .header = 0x00004000, .as = { .object = { 0x0007, 30, -44 } } },
    { .header = 0x10004000, .as = { .object = { 0x0027, -46, -36 } } },
    { .header = 0x10004000, .as = { .object = { 0x0007, -46, -44 } } },
    { .header = 0x00004000, .as = { .object = { 0x0004, 14, -52 } } },
    { .header = 0x00000000, .as = { .object = { 0x0006, 30, -52 } } },
    { .header = 0x10004000, .as = { .object = { 0x0004, -30, -52 } } },
    { .header = 0x10000000, .as = { .object = { 0x0006, -38, -52 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxDevineOBJ_3[] __attribute__((section(".rodata.dat_data_banim_p107"))) =
{
    { .header = 0x40004000, .as = { .object = { 0x0024, 0, -40 } } },
    { .header = 0x50004000, .as = { .object = { 0x0024, -32, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0028, 32, -40 } } },
    { .header = 0x00004000, .as = { .object = { 0x0007, 24, -48 } } },
    { .header = 0x10000000, .as = { .object = { 0x0028, -40, -40 } } },
    { .header = 0x10004000, .as = { .object = { 0x0007, -40, -48 } } },
    { .header = 0x00004000, .as = { .object = { 0x0005, 16, -56 } } },
    { .header = 0x10004000, .as = { .object = { 0x0005, -32, -56 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxDevineOBJ_4[] __attribute__((section(".rodata.dat_data_banim_p107"))) =
{
    { .header = 0x40004000, .as = { .object = { 0x0024, -4, -44 } } },
    { .header = 0x50004000, .as = { .object = { 0x0024, -28, -44 } } },
    { .header = 0x00000000, .as = { .object = { 0x0028, 28, -44 } } },
    { .header = 0x00004000, .as = { .object = { 0x0007, 20, -52 } } },
    { .header = 0x10000000, .as = { .object = { 0x0028, -36, -44 } } },
    { .header = 0x10004000, .as = { .object = { 0x0007, -36, -52 } } },
    { .header = 0x00004000, .as = { .object = { 0x0005, 12, -60 } } },
    { .header = 0x10004000, .as = { .object = { 0x0005, -28, -60 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxDevineOBJ_5[] __attribute__((section(".rodata.dat_data_banim_p107"))) =
{
    { .header = 0x50004000, .as = { .object = { 0x0025, -32, -52 } } },
    { .header = 0x40004000, .as = { .object = { 0x0025, 0, -52 } } },
    { .header = 0x10004000, .as = { .object = { 0x0007, -32, -60 } } },
    { .header = 0x10000000, .as = { .object = { 0x0006, -24, -67 } } },
    { .header = 0x00004000, .as = { .object = { 0x0007, 16, -60 } } },
    { .header = 0x00000000, .as = { .object = { 0x0006, 16, -67 } } },
    { .header = 0x00000000, .as = { .object = { 0x0005, 8, -67 } } },
    { .header = 0x10000000, .as = { .object = { 0x0005, -16, -67 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxDevineOBJ_6[] __attribute__((section(".rodata.dat_data_banim_p107"))) =
{
    { .header = 0x50004000, .as = { .object = { 0x0025, -28, -60 } } },
    { .header = 0x40004000, .as = { .object = { 0x0025, -4, -60 } } },
    { .header = 0x10004000, .as = { .object = { 0x0007, -28, -68 } } },
    { .header = 0x10000000, .as = { .object = { 0x0006, -20, -75 } } },
    { .header = 0x00004000, .as = { .object = { 0x0007, 12, -68 } } },
    { .header = 0x00000000, .as = { .object = { 0x0006, 12, -75 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxDevineOBJ_7[] __attribute__((section(".rodata.dat_data_banim_p107"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x0026, 0, -65 } } },
    { .header = 0x10004000, .as = { .object = { 0x0026, -16, -65 } } },
    { .header = 0x00000000, .as = { .object = { 0x0028, 16, -65 } } },
    { .header = 0x00004000, .as = { .object = { 0x0007, 8, -73 } } },
    { .header = 0x10000000, .as = { .object = { 0x0028, -24, -65 } } },
    { .header = 0x10004000, .as = { .object = { 0x0007, -24, -73 } } },
    { .header = 0x00000000, .as = { .object = { 0x0006, 8, -81 } } },
    { .header = 0x10000000, .as = { .object = { 0x0006, -16, -81 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxDevineOBJ_8[] __attribute__((section(".rodata.dat_data_banim_p107"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0007, -2, -25 } } },
    { .header = 0x50000000, .as = { .object = { 0x0007, -14, -25 } } },
    { .header = 0x00004000, .as = { .object = { 0x0026, -4, -69 } } },
    { .header = 0x10004000, .as = { .object = { 0x0026, -12, -69 } } },
    { .header = 0x00000000, .as = { .object = { 0x0028, 12, -69 } } },
    { .header = 0x00004000, .as = { .object = { 0x0007, 4, -77 } } },
    { .header = 0x10000000, .as = { .object = { 0x0028, -20, -69 } } },
    { .header = 0x10004000, .as = { .object = { 0x0007, -20, -77 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxDevineOBJ_9[] __attribute__((section(".rodata.dat_data_banim_p107"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0007, 0, -29 } } },
    { .header = 0x50000000, .as = { .object = { 0x0007, -16, -29 } } },
    { .header = 0x40000000, .as = { .object = { 0x0007, 0, -83 } } },
    { .header = 0x50000000, .as = { .object = { 0x0007, -16, -83 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxDevineOBJ_10[] __attribute__((section(".rodata.dat_data_banim_p107"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0007, -2, -88 } } },
    { .header = 0x50000000, .as = { .object = { 0x0007, -14, -88 } } },
    { .header = 0x00004000, .as = { .object = { 0x0026, 0, -25 } } },
    { .header = 0x10004000, .as = { .object = { 0x0026, -16, -25 } } },
    { .header = 0x00000000, .as = { .object = { 0x0028, 16, -25 } } },
    { .header = 0x00004000, .as = { .object = { 0x0007, 8, -33 } } },
    { .header = 0x10000000, .as = { .object = { 0x0028, -24, -25 } } },
    { .header = 0x10004000, .as = { .object = { 0x0007, -24, -33 } } },
    { .header = 0x00000000, .as = { .object = { 0x0006, 8, -41 } } },
    { .header = 0x10000000, .as = { .object = { 0x0006, -16, -41 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxDevineOBJ_11[] __attribute__((section(".rodata.dat_data_banim_p107"))) =
{
    { .header = 0x50004000, .as = { .object = { 0x0025, -32, -31 } } },
    { .header = 0x40004000, .as = { .object = { 0x0025, 0, -31 } } },
    { .header = 0x40004000, .as = { .object = { 0x0043, -16, -96 } } },
    { .header = 0x00004000, .as = { .object = { 0x0064, -16, -88 } } },
    { .header = 0x00000000, .as = { .object = { 0x0066, 0, -88 } } },
    { .header = 0x10004000, .as = { .object = { 0x0007, -32, -39 } } },
    { .header = 0x10000000, .as = { .object = { 0x0006, -24, -46 } } },
    { .header = 0x00004000, .as = { .object = { 0x0007, 16, -39 } } },
    { .header = 0x00000000, .as = { .object = { 0x0006, 16, -46 } } },
    { .header = 0x00000000, .as = { .object = { 0x0005, 8, -46 } } },
    { .header = 0x10000000, .as = { .object = { 0x0005, -16, -46 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxDevineOBJ_12[] __attribute__((section(".rodata.dat_data_banim_p107"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x0026, 0, -36 } } },
    { .header = 0x10004000, .as = { .object = { 0x0026, -16, -36 } } },
    { .header = 0x00000000, .as = { .object = { 0x0028, 16, -36 } } },
    { .header = 0x00004000, .as = { .object = { 0x0007, 8, -44 } } },
    { .header = 0x10000000, .as = { .object = { 0x0028, -24, -36 } } },
    { .header = 0x10004000, .as = { .object = { 0x0007, -24, -44 } } },
    { .header = 0x00000000, .as = { .object = { 0x0006, 8, -52 } } },
    { .header = 0x10000000, .as = { .object = { 0x0006, -16, -52 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxDevineOBJ_13[] __attribute__((section(".rodata.dat_data_banim_p107"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0007, 0, -47 } } },
    { .header = 0x50000000, .as = { .object = { 0x0007, -16, -47 } } },
    { .header = 0x00000000, .as = { .object = { 0x0006, 0, -55 } } },
    { .header = 0x10000000, .as = { .object = { 0x0006, -8, -55 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxDevineOBJ_14[] __attribute__((section(".rodata.dat_data_banim_p107"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0007, -2, -51 } } },
    { .header = 0x50000000, .as = { .object = { 0x0007, -14, -51 } } },
    ANIM_SPRITE_END,
};
