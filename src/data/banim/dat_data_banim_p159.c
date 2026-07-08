#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p159.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p159") u16 Pal_BerserkBg[] = INCBIN_U16("graphics/banim/_us/banim/assets/pal/0068C338_Pal_BerserkBg.gbapal");
SECTION(".rodata.dat_data_banim_p159") u16 Img_BerserkSprites_A[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/0068C358_Img_BerserkSprites_A.4bpp.lz");
SECTION(".rodata.dat_data_banim_p159") u16 Img_BerserkSprites_B[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/0068C7F0_Img_BerserkSprites_B.4bpp.lz");
SECTION(".rodata.dat_data_banim_p159") u16 Pal_BerserkSprites[] = INCBIN_U16("graphics/banim/_us/banim/assets/pal/0068CC10_Pal_BerserkSprites.gbapal");
struct AnimSpriteData AnimSprite_EfxBerserk1_1[] __attribute__((section(".rodata.dat_data_banim_p159"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, -40, -14 } } },
    { .header = 0x00000000, .as = { .object = { 0x0040, -24, -14 } } },
    { .header = 0x00000000, .as = { .object = { 0x0060, -48, -6 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBerserk1_2[] __attribute__((section(".rodata.dat_data_banim_p159"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0002, -44, -11 } } },
    { .header = 0x00008000, .as = { .object = { 0x0046, -12, 5 } } },
    { .header = 0x00008000, .as = { .object = { 0x0006, -4, 5 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBerserk1_3[] __attribute__((section(".rodata.dat_data_banim_p159"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0007, -47, -13 } } },
    { .header = 0x80004000, .as = { .object = { 0x004B, -15, 3 } } },
    { .header = 0x40000000, .as = { .object = { 0x004F, 17, 3 } } },
    { .header = 0x80004000, .as = { .object = { 0x000B, 17, -13 } } },
    { .header = 0x00000000, .as = { .object = { 0x000F, -13, 19 } } },
    { .header = 0x00000000, .as = { .object = { 0x002F, 1, 19 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p159") u8 AnimSprite_EfxBerserk1_4[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBerserk1_4.4bpp");
struct AnimSpriteData AnimSprite_EfxBerserk1_5[] __attribute__((section(".rodata.dat_data_banim_p159"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, -40, -22 } } },
    { .header = 0x00000000, .as = { .object = { 0x0040, -24, -22 } } },
    { .header = 0x00000000, .as = { .object = { 0x0060, -48, -14 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBerserk1_6[] __attribute__((section(".rodata.dat_data_banim_p159"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0002, -44, -19 } } },
    { .header = 0x00008000, .as = { .object = { 0x0046, -12, -3 } } },
    { .header = 0x00008000, .as = { .object = { 0x0006, -4, -3 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBerserk1_7[] __attribute__((section(".rodata.dat_data_banim_p159"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0007, -47, -21 } } },
    { .header = 0x80004000, .as = { .object = { 0x004B, -15, -5 } } },
    { .header = 0x40000000, .as = { .object = { 0x004F, 17, -5 } } },
    { .header = 0x80004000, .as = { .object = { 0x000B, 17, -21 } } },
    { .header = 0x00000000, .as = { .object = { 0x000F, -13, 11 } } },
    { .header = 0x00000000, .as = { .object = { 0x002F, 1, 11 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p159") u8 AnimSprite_EfxBerserk1_8[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBerserk1_8.4bpp");
struct AnimSpriteData AnimSprite_EfxBerserk1_9[] __attribute__((section(".rodata.dat_data_banim_p159"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, -40, -30 } } },
    { .header = 0x00000000, .as = { .object = { 0x0040, -24, -30 } } },
    { .header = 0x00000000, .as = { .object = { 0x0060, -48, -22 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBerserk1_10[] __attribute__((section(".rodata.dat_data_banim_p159"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0002, -44, -27 } } },
    { .header = 0x00008000, .as = { .object = { 0x0046, -12, -11 } } },
    { .header = 0x00008000, .as = { .object = { 0x0006, -4, -11 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBerserk1_11[] __attribute__((section(".rodata.dat_data_banim_p159"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0007, -47, -29 } } },
    { .header = 0x80004000, .as = { .object = { 0x004B, -15, -13 } } },
    { .header = 0x40000000, .as = { .object = { 0x004F, 17, -13 } } },
    { .header = 0x80004000, .as = { .object = { 0x000B, 17, -29 } } },
    { .header = 0x00000000, .as = { .object = { 0x000F, -13, 3 } } },
    { .header = 0x00000000, .as = { .object = { 0x002F, 1, 3 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p159") u8 AnimSprite_EfxBerserk1_12[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBerserk1_12.4bpp");
struct AnimSpriteData AnimSprite_EfxBerserk1_13[] __attribute__((section(".rodata.dat_data_banim_p159"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, -40, -38 } } },
    { .header = 0x00000000, .as = { .object = { 0x0040, -24, -38 } } },
    { .header = 0x00000000, .as = { .object = { 0x0060, -48, -30 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBerserk1_14[] __attribute__((section(".rodata.dat_data_banim_p159"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0002, -44, -35 } } },
    { .header = 0x00008000, .as = { .object = { 0x0046, -12, -19 } } },
    { .header = 0x00008000, .as = { .object = { 0x0006, -4, -19 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBerserk1_15[] __attribute__((section(".rodata.dat_data_banim_p159"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0007, -47, -37 } } },
    { .header = 0x80004000, .as = { .object = { 0x004B, -15, -21 } } },
    { .header = 0x40000000, .as = { .object = { 0x004F, 17, -21 } } },
    { .header = 0x80004000, .as = { .object = { 0x000B, 17, -37 } } },
    { .header = 0x00000000, .as = { .object = { 0x000F, -13, -5 } } },
    { .header = 0x00000000, .as = { .object = { 0x002F, 1, -5 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p159") u8 AnimSprite_EfxBerserk1_16[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBerserk1_16.4bpp");
struct AnimSpriteData AnimSprite_EfxBerserk1_17[] __attribute__((section(".rodata.dat_data_banim_p159"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, -40, -46 } } },
    { .header = 0x00000000, .as = { .object = { 0x0040, -24, -46 } } },
    { .header = 0x00000000, .as = { .object = { 0x0060, -48, -38 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBerserk1_18[] __attribute__((section(".rodata.dat_data_banim_p159"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0002, -44, -43 } } },
    { .header = 0x00008000, .as = { .object = { 0x0046, -12, -27 } } },
    { .header = 0x00008000, .as = { .object = { 0x0006, -4, -27 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxBerserk1_19[] __attribute__((section(".rodata.dat_data_banim_p159"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0007, -47, -45 } } },
    { .header = 0x80004000, .as = { .object = { 0x004B, -15, -29 } } },
    { .header = 0x40000000, .as = { .object = { 0x004F, 17, -29 } } },
    { .header = 0x80004000, .as = { .object = { 0x000B, 17, -45 } } },
    { .header = 0x00000000, .as = { .object = { 0x000F, -13, -13 } } },
    { .header = 0x00000000, .as = { .object = { 0x002F, 1, -13 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p159") u8 AnimSprite_EfxBerserk1_20[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxBerserk1_20.4bpp");
