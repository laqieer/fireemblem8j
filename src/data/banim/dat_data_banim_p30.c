#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p30.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData AnimSprite_IcebreathOBJ_Right1[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0064, 12, -20 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right2[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, -5, -16 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, 10, -13 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right3[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0002, -22, -14 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -6, -14 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -22, 2 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -6, 2 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -5, -4 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right4[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0005, -38, -15 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -15, 2 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, 1, 2 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -15, 18 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 1, 18 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 2, -18 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p30") u8 AnimSprite_IcebreathOBJ_Right5[] = INCBIN_U8("graphics/reuse/AnimSprite_IcebreathOBJ_Right5.4bpp");
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right6[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0005, -34, -14 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -69, -13 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -5, -13 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -42, 2 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, 8, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right7[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0141, 0x0000, 0x0000, 0x0141 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -44, -11 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -82, -16 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -21, -14 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -5, -14 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -21, 2 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -5, 2 } } },
    { .header = 0x80000100, .as = { .object = { 0x000D, -50, 3 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -2, -10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right8[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -18, -3 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -2, -3 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -18, 13 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -2, 13 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -98, -18 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -50, -12 } } },
    { .header = 0x80000100, .as = { .object = { 0x0011, -60, 4 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -57, -18 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -41, -18 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -57, -2 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -41, -2 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -2, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right9[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0002, -17, -13 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -1, -13 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -17, 3 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -1, 3 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -65, -9 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -27, -1 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -11, -1 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -27, 15 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -11, 15 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -106, -20 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -46, -16 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, 12, -20 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -82, 8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right10[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -41, -3 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -81, -21 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -68, 5 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -52, 5 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -68, 21 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -52, 21 } } },
    { .header = 0x80008000, .as = { .object = { 0x001D, -122, -24 } } },
    { .header = 0x40008000, .as = { .object = { 0x001F, -106, -24 } } },
    { .header = 0x00008000, .as = { .object = { 0x0040, -98, -24 } } },
    { .header = 0x00008000, .as = { .object = { 0x0041, -98, -8 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -58, -16 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -2, -17 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -30, -26 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right11[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -34, -1 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -18, -1 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -34, 15 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -18, 15 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -52, 0 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -66, -16 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -19, -15 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -3, -15 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -19, 1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -3, 1 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -82, 8 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -66, 8 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -82, 24 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -66, 24 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -98, -24 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 5, -20 } } },
    { .header = 0x82000100, .as = { .object = { 0x000D, -42, -25 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right12[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -35, -16 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -74, -6 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -58, 0 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -74, -15 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -99, 5 } } },
    { .header = 0x80000100, .as = { .object = { 0x000D, -111, -25 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, 11, -17 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -3, -6 } } },
    { .header = 0x82000100, .as = { .object = { 0x0011, -52, -27 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, -18, 16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right13[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0005, -118, 8 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, -6, -5 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -45, -17 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -98, -3 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -66, 0 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -82, -16 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 0, -16 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -10, 2 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, -28, 20 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right14[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -52, -17 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -90, -18 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -74, 0 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -114, -5 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, 11, -18 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, -13, 1 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -12, -15 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, 4, -15 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -12, 1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 4, 1 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -30, -1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, -35, 21 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right15[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -74, -18 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -58, -18 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -74, -2 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -58, -2 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -82, -4 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -58, -15 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -122, -7 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 4, -16 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -18, -9 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -2, -9 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -18, 7 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -2, 7 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, -22, 6 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -28, -23 } } },
    { .header = 0x82000100, .as = { .object = { 0x000D, -42, 6 } } },
    { .header = 0x00000000, .as = { .object = { 0x0062, -46, 24 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right16[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -98, -23 } } },
    { .header = 0x80008000, .as = { .object = { 0x001D, -94, -8 } } },
    { .header = 0x40008000, .as = { .object = { 0x001F, -78, -8 } } },
    { .header = 0x00008000, .as = { .object = { 0x0040, -70, -8 } } },
    { .header = 0x00008000, .as = { .object = { 0x0041, -70, 8 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -128, -9 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -14, -14 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, 2, -14 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -14, 2 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 2, 2 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -42, -5 } } },
    { .header = 0x00000000, .as = { .object = { 0x0062, -46, 17 } } },
    { .header = 0x80000100, .as = { .object = { 0x000D, -46, -25 } } },
    { .header = 0x82000100, .as = { .object = { 0x0011, -58, 12 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -66, -15 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right17[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -34, -18 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -66, 0 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -110, -28 } } },
    { .header = 0x80000100, .as = { .object = { 0x0015, -55, -26 } } },
    { .header = 0x82000100, .as = { .object = { 0x0011, -83, 12 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -74, -15 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right18[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -42, 2 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -42, -18 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -90, 0 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -118, -30 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, -50, -16 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -66, -27 } } },
    { .header = 0x80000100, .as = { .object = { 0x0015, -108, 11 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -82, -17 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right19[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -56, -1 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -40, -1 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -56, 15 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -40, 15 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -50, -18 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -106, 0 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -123, -34 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, -60, -19 } } },
    { .header = 0x80000100, .as = { .object = { 0x0019, -128, 8 } } },
    { .header = 0x80008000, .as = { .object = { 0x001D, -96, -20 } } },
    { .header = 0x40008000, .as = { .object = { 0x001F, -80, -20 } } },
    { .header = 0x00008000, .as = { .object = { 0x0040, -72, -20 } } },
    { .header = 0x00008000, .as = { .object = { 0x0041, -72, -4 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right20[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0005, -79, -3 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -60, -20 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -117, -4 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -126, -34 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, -74, -24 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -74, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right21[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0009, -96, -5 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -127, -13 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -127, -38 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -70, -22 } } },
    { .header = 0x00000000, .as = { .object = { 0x0062, -82, -27 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -87, -19 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right22[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -82, -24 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -112, -7 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -106, -31 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p30") u8 AnimSprite_IcebreathOBJ_Right23[] = INCBIN_U8("graphics/reuse/AnimSprite_IcebreathOBJ_Right23.4bpp");
struct AnimSpriteData AnimSprite_IcebreathOBJ_Right24[] __attribute__((section(".rodata.dat_data_banim_p30"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -120, -11 } } },
    { .header = 0x80000100, .as = { .object = { 0x0019, -122, -38 } } },
    ANIM_SPRITE_END,
};
