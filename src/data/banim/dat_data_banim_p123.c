#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p123.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p123") u16 Pal_efxLiveBGCOL[] = INCBIN_U16("graphics/banim/_us/banim/assets/pal/00672220_Pal_08672220.gbapal");
struct AnimSpriteData AnimSprite_EfxLiveOBJ_1[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0003, 12, 11 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -19, 11 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_2[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x00F0, 0x0057, 0xFFA9, 0x00F0 } } },
    { .header = 0x00000100, .as = { .object = { 0x0003, 13, 9 } } },
    { .header = 0x00000100, .as = { .object = { 0x0003, -20, 9 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_3[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0147, 0x0112, 0xFEEE, 0x0147 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 9, 4 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -25, 4 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_4[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x00B7, 0x013C, 0xFEC4, 0x00B7 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 10, 2 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -26, 2 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_5[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0037, 0x013C, 0xFEC4, 0x0037 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 11, 0 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -27, 0 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 12, 11 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -20, 11 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_6[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFFCF, 0x0117, 0xFEE9, 0xFFCF } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 12, -2 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -28, -2 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 14, 10 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -21, 10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_7[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFFA9, 0x00F0, 0xFF10, 0xFFA9 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 12, -4 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -28, -4 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 15, 9 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -22, 9 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_8[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFF81, 0x00DD, 0xFF23, 0xFF81 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 13, -7 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -29, -7 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 16, 8 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -23, 8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_9[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFF5C, 0x00C4, 0xFF3C, 0xFF5C } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 14, -10 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -30, -10 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 16, 7 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -23, 7 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p123") u8 AnimSprite_EfxLiveOBJ_10[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxLiveOBJ_10.4bpp");
struct AnimSpriteData AnimSprite_EfxLiveOBJ_11[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFF23, 0x0080, 0xFF80, 0xFF23 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 14, -15 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -30, -15 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 18, 3 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -25, 3 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 14, 9 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -21, 9 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 17, 9 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -23, 9 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_12[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFF10, 0x0057, 0xFFA9, 0xFF10 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 14, -17 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -30, -17 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 19, 1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -26, 1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 15, 8 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -22, 8 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 19, 7 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -25, 7 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_13[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFF04, 0x002C, 0xFFD4, 0xFF04 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 13, -19 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -29, -19 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 19, -1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -26, -1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 16, 7 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -23, 7 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 20, 5 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -27, 5 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_14[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFF01, 0x0000, 0x0000, 0xFF01 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x00E9, 0x0000, 0x0000, 0x00E9 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 12, -21 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -28, -21 } } },
    { .header = 0x02000100, .as = { .object = { 0x0003, 19, -3 } } },
    { .header = 0x02000100, .as = { .object = { 0x0003, -26, -3 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 17, 6 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -24, 6 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 21, 3 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -27, 3 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_15[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFF10, 0xFFA9, 0x0057, 0xFF10 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x00C5, 0x0000, 0x0000, 0x00C5 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 11, -23 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -27, -23 } } },
    { .header = 0x02000100, .as = { .object = { 0x0003, 19, -5 } } },
    { .header = 0x02000100, .as = { .object = { 0x0003, -26, -5 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 18, 5 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -25, 5 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 21, 2 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -27, 2 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_16[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFF23, 0xFF81, 0x007F, 0xFF23 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x00D5, 0x0000, 0x0000, 0x00D5 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 10, -25 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -26, -25 } } },
    { .header = 0x02000100, .as = { .object = { 0x0003, 19, -7 } } },
    { .header = 0x02000100, .as = { .object = { 0x0003, -26, -7 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 19, 4 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -26, 4 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 21, 0 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -27, 0 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_17[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFF3C, 0xFF5C, 0x00A4, 0xFF3C } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x00E9, 0x0000, 0x0000, 0x00E9 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 9, -26 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -25, -26 } } },
    { .header = 0x02000100, .as = { .object = { 0x0003, 19, -9 } } },
    { .header = 0x02000100, .as = { .object = { 0x0003, -26, -9 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 19, 3 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -26, 3 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 21, -1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -27, -1 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_18[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFF5C, 0xFF3D, 0x00C3, 0xFF5C } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 8, -27 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -24, -27 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 18, -11 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -25, -11 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 19, 2 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -26, 2 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 21, -2 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -27, -2 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_19[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFF80, 0xFF23, 0x00DD, 0xFF80 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 6, -28 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -22, -28 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 17, -13 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -24, -13 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 19, 1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -26, 1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 21, -4 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -27, -4 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_20[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFFA8, 0xFF10, 0x00F0, 0xFFA8 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 4, -29 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -20, -29 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 16, -15 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -23, -15 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 19, 0 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -26, 0 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 21, -6 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -27, -6 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_21[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFFD3, 0xFF04, 0x00FC, 0xFFD3 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 2, -30 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -19, -30 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 15, -17 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -22, -17 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 19, -1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -26, -1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 21, -8 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -27, -8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_22[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .object = { 0x0000, -255, 255 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 0, -32 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -17, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 13, -19 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -20, -19 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 19, -2 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -26, -2 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 21, -10 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -27, -10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_23[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0002, .as = { .object = { 0x0000, -232, 232 } } },
    { .header = 0xFFFF0002, .as = { .object = { 0x0000, -283, 283 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -3, -32 } } },
    { .header = 0x42000100, .as = { .object = { 0x0000, -15, -34 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 11, -21 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -18, -21 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 19, -3 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -26, -3 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 20, -12 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -26, -12 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_24[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x0027, 0xFF1B, 0x00E5, 0x0027 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x0030, 0xFEE9, 0x0117, 0x0030 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -5, -31 } } },
    { .header = 0x42000100, .as = { .object = { 0x0000, -13, -36 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 9, -23 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -16, -23 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 19, -4 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -26, -4 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 19, -14 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -25, -14 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_25[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x0048, 0xFF38, 0x00C8, 0x0048 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x006D, 0xFED3, 0x012D, 0x006D } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -7, -31 } } },
    { .header = 0x42000100, .as = { .object = { 0x0000, -11, -37 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 7, -24 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -15, -25 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 19, -5 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -26, -5 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 18, -16 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -24, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_26[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x0062, 0xFF56, 0x00AA, 0x0062 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x00B6, 0xFEC3, 0x013D, 0x00B6 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -10, -31 } } },
    { .header = 0x42000100, .as = { .object = { 0x0000, -8, -38 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 5, -25 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -14, -27 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 19, -6 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -26, -6 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 17, -18 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -23, -18 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_27[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x0095, 0xFF4E, 0x00B2, 0x0095 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x00CD, 0xFF0A, 0x00F6, 0x00CD } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -13, -31 } } },
    { .header = 0x42000100, .as = { .object = { 0x0000, -6, -37 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 3, -26 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -12, -29 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 19, -7 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -26, -7 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 15, -20 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -21, -20 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_28[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x00B2, 0xFF6A, 0x0096, 0x00B2 } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x00D9, 0xFF49, 0x00B7, 0x00D9 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -15, -32 } } },
    { .header = 0x42000100, .as = { .object = { 0x0000, -3, -36 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, 0, -26 } } },
    { .header = 0x00000000, .as = { .object = { 0x0003, -10, -31 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 19, -8 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -26, -8 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 13, -22 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -19, -23 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_29[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x00DD, 0xFF80, 0x0080, 0x00DD } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -17, -34 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -1, -34 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, 19, -9 } } },
    { .header = 0x00000000, .as = { .object = { 0x0002, -26, -9 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 10, -23 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -17, -25 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -3, -26 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -7, -32 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_30[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x00F0, 0xFFA8, 0x0058, 0x00F0 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -16, -34 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -2, -34 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 18, -10 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -24, -10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_31[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0117, 0xFFCE, 0x0032, 0x0117 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -14, -35 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -4, -35 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 17, -12 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -23, -12 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_32[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0141, 0x0000, 0x0000, 0x0141 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -12, -39 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -6, -39 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 15, -14 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -21, -14 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_33[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0168, 0x003F, 0xFFC1, 0x0168 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -10, -42 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -8, -42 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 13, -16 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, -19, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_34[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0192, 0x0092, 0xFF6E, 0x0192 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -9, -44 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_35[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x01BB, 0x00FF, 0xFF01, 0x01BB } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -9, -47 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_36[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xC0000000, .as = { .object = { 0x3080, -32, -64 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_37[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x00DD, 0x007F, 0xFF81, 0x00DD } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -8, -39 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_38[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x00DD, 0x007F, 0xFF81, 0x00DD } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 1, -41 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -17, -41 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_39[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x00DD, 0x007F, 0xFF81, 0x00DD } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, 8, -43 } } },
    { .header = 0x40000100, .as = { .object = { 0x0000, -24, -43 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_40[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0044, -25, -42 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 17, -42 } } },
    { .header = 0x00000000, .as = { .object = { 0x0045, -4, -35 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_41[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0044, -29, -45 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 21, -45 } } },
    { .header = 0x00000000, .as = { .object = { 0x0045, -13, -37 } } },
    { .header = 0x00000000, .as = { .object = { 0x0045, 5, -37 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_42[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0045, -33, -49 } } },
    { .header = 0x00000000, .as = { .object = { 0x0045, 25, -49 } } },
    { .header = 0x00000000, .as = { .object = { 0x0045, -20, -39 } } },
    { .header = 0x00000000, .as = { .object = { 0x0045, 12, -39 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_43[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0045, -36, -53 } } },
    { .header = 0x00000000, .as = { .object = { 0x0045, 28, -53 } } },
    { .header = 0x00000000, .as = { .object = { 0x0045, 17, -42 } } },
    { .header = 0x00000000, .as = { .object = { 0x0045, -25, -42 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, -4, -35 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_44[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0046, -38, -56 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, 30, -56 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, -13, -37 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, 5, -37 } } },
    { .header = 0x00000000, .as = { .object = { 0x0045, 21, -45 } } },
    { .header = 0x00000000, .as = { .object = { 0x0045, -29, -45 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_45[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0046, -38, -58 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, 30, -58 } } },
    { .header = 0x00000000, .as = { .object = { 0x0045, -33, -49 } } },
    { .header = 0x00000000, .as = { .object = { 0x0045, 25, -49 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, 12, -39 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, -20, -39 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_46[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0046, -37, -60 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, 29, -60 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, -36, -53 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, 28, -53 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, -25, -42 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, 17, -42 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_47[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0047, -35, -61 } } },
    { .header = 0x00000000, .as = { .object = { 0x0047, 27, -61 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, -38, -56 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, 30, -56 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, -29, -45 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, 21, -45 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_48[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0047, -33, -62 } } },
    { .header = 0x00000000, .as = { .object = { 0x0047, 25, -62 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, -38, -58 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, 30, -58 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, -33, -49 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, 25, -49 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_49[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0047, -31, -62 } } },
    { .header = 0x00000000, .as = { .object = { 0x0047, 23, -62 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, -37, -60 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, 29, -60 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, -36, -53 } } },
    { .header = 0x00000000, .as = { .object = { 0x0046, 28, -53 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_50[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0047, -35, -61 } } },
    { .header = 0x00000000, .as = { .object = { 0x0047, 27, -61 } } },
    { .header = 0x00000000, .as = { .object = { 0x0047, 30, -56 } } },
    { .header = 0x00000000, .as = { .object = { 0x0047, -38, -56 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_51[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0047, -33, -62 } } },
    { .header = 0x00000000, .as = { .object = { 0x0047, 25, -62 } } },
    { .header = 0x00000000, .as = { .object = { 0x0047, -38, -58 } } },
    { .header = 0x00000000, .as = { .object = { 0x0047, 30, -58 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_52[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0047, -31, -62 } } },
    { .header = 0x00000000, .as = { .object = { 0x0047, 23, -62 } } },
    { .header = 0x00000000, .as = { .object = { 0x0047, -37, -60 } } },
    { .header = 0x00000000, .as = { .object = { 0x0047, 29, -60 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_53[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0047, -35, -61 } } },
    { .header = 0x00000000, .as = { .object = { 0x0047, 27, -61 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_54[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0047, -33, -62 } } },
    { .header = 0x00000000, .as = { .object = { 0x0047, 25, -62 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLiveOBJ_55[] __attribute__((section(".rodata.dat_data_banim_p123"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0047, -31, -62 } } },
    { .header = 0x00000000, .as = { .object = { 0x0047, 23, -62 } } },
    ANIM_SPRITE_END,
};
