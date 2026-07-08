#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p66.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p66") u16 Tsa_efxFireBG_4[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/005F6FAC_Tsa_085F6FAC.map.bin.lz");
SECTION(".rodata.dat_data_banim_p66") u16 Tsa_efxFireBG_5[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/005F707C_Tsa_085F707C.map.bin.lz");
SECTION(".rodata.dat_data_banim_p66") u16 Tsa_efxFireBG_6[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/005F717C_Tsa_085F717C.map.bin.lz");
SECTION(".rodata.dat_data_banim_p66") u16 Tsa_efxFireBG_7[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/005F7284_Tsa_085F7284.map.bin.lz");
SECTION(".rodata.dat_data_banim_p66") u16 Tsa_efxFireBG_8[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/005F7398_Tsa_085F7398.map.bin.lz");
SECTION(".rodata.dat_data_banim_p66") u16 Tsa_efxFireBG_9[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/005F74D0_Tsa_085F74D0.map.bin.lz");
SECTION(".rodata.dat_data_banim_p66") u16 Tsa_efxFireBG_10[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/005F75D4_Tsa_085F75D4.map.bin.lz");
SECTION(".rodata.dat_data_banim_p66") u16 Tsa_efxFireBG_11[] = INCBIN_U16("graphics/banim/_us/banim/assets/tsa/005F76A8_Tsa_085F76A8.map.bin.lz");
SECTION(".rodata.dat_data_banim_p66") u16 Img_FireSpellSprites[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/005F7768_Img_FireSpellSprites.4bpp.lz");
SECTION(".rodata.dat_data_banim_p66") u16 Pal_FireSpellSprites[] = INCBIN_U16("graphics/banim/_us/banim/assets/pal/005F7D64_Pal_FireSpellSprites.agbpal");
struct AnimSpriteData AnimSprite_EfxFireOBJ_L_1[] __attribute__((section(".rodata.dat_data_banim_p66"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, -8, -56 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFireOBJ_L_2[] __attribute__((section(".rodata.dat_data_banim_p66"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0102, 0x0102, 0xFEFE, 0x0102 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -8, -56 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFireOBJ_L_3[] __attribute__((section(".rodata.dat_data_banim_p66"))) =
{
    { .header = 0xFFFF0001, .as = { .object = { 0x0000, 511, -511 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -8, -56 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFireOBJ_L_4[] __attribute__((section(".rodata.dat_data_banim_p66"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFDA0, 0x0262, 0xFD9E, 0xFDA0 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -8, -56 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFireOBJ_L_5[] __attribute__((section(".rodata.dat_data_banim_p66"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, -20, -47 } } },
    { .header = 0x80000000, .as = { .object = { 0x000E, -16, -64 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFireOBJ_L_6[] __attribute__((section(".rodata.dat_data_banim_p66"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0002, -40, -37 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -24, -37 } } },
    { .header = 0x00004000, .as = { .object = { 0x000B, -24, -45 } } },
    { .header = 0x00000000, .as = { .object = { 0x000D, -16, -37 } } },
    { .header = 0x80004000, .as = { .object = { 0x0016, -15, -64 } } },
    { .header = 0x80004000, .as = { .object = { 0x001A, -15, -48 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p66") u8 AnimSprite_EfxFireOBJ_L_7[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxFireOBJ_L_7.4bpp");
struct AnimSpriteData AnimSprite_EfxFireOBJ_L_8[] __attribute__((section(".rodata.dat_data_banim_p66"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0008, -60, -25 } } },
    { .header = 0x00008000, .as = { .object = { 0x000A, -44, -25 } } },
    { .header = 0x00004000, .as = { .object = { 0x002B, -44, -33 } } },
    { .header = 0x00000000, .as = { .object = { 0x000D, -36, -25 } } },
    { .header = 0x80004000, .as = { .object = { 0x0046, -13, -64 } } },
    { .header = 0x80004000, .as = { .object = { 0x004A, -13, -48 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFireOBJ_L_9[] __attribute__((section(".rodata.dat_data_banim_p66"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0012, -7, -64 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFireOBJ_L_10[] __attribute__((section(".rodata.dat_data_banim_p66"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x005F, -8, -8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFireOBJ_L_11[] __attribute__((section(".rodata.dat_data_banim_p66"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0002, -46, -44 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -30, -44 } } },
    { .header = 0x00004000, .as = { .object = { 0x000B, -30, -52 } } },
    { .header = 0x00000000, .as = { .object = { 0x000D, -22, -44 } } },
    { .header = 0x80004000, .as = { .object = { 0x0016, -15, -64 } } },
    { .header = 0x80004000, .as = { .object = { 0x001A, -15, -48 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p66") u8 AnimSprite_EfxFireOBJ_L_12[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxFireOBJ_L_12.4bpp");
struct AnimSpriteData AnimSprite_EfxFireOBJ_L_13[] __attribute__((section(".rodata.dat_data_banim_p66"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0008, -90, -24 } } },
    { .header = 0x00008000, .as = { .object = { 0x000A, -74, -24 } } },
    { .header = 0x00004000, .as = { .object = { 0x002B, -74, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x000D, -66, -24 } } },
    { .header = 0x80004000, .as = { .object = { 0x0046, -13, -64 } } },
    { .header = 0x80004000, .as = { .object = { 0x004A, -13, -48 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxFireOBJ_L_14[] __attribute__((section(".rodata.dat_data_banim_p66"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0012, -7, -64 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -113, -10 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -97, -10 } } },
    { .header = 0x00004000, .as = { .object = { 0x000B, -97, -18 } } },
    { .header = 0x00000000, .as = { .object = { 0x000D, -89, -10 } } },
    ANIM_SPRITE_END,
};
