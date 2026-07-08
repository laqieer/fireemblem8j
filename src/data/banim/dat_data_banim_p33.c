#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p33.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData AnimSprite_DarkBreathOBJ_Close1[] __attribute__((section(".rodata.dat_data_banim_p33"))) =
{
    { .header = 0x10000000, .as = { .object = { 0x0064, -12, -60 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_DarkBreathOBJ_Close2[] __attribute__((section(".rodata.dat_data_banim_p33"))) =
{
    { .header = 0x50000000, .as = { .object = { 0x0000, -10, -55 } } },
    { .header = 0x10000000, .as = { .object = { 0x0063, -9, -43 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_DarkBreathOBJ_Close3[] __attribute__((section(".rodata.dat_data_banim_p33"))) =
{
    { .header = 0x50000000, .as = { .object = { 0x0002, 4, -46 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -4, -46 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 4, -30 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -4, -30 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -8, -31 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_DarkBreathOBJ_Close4[] __attribute__((section(".rodata.dat_data_banim_p33"))) =
{
    { .header = 0x90000000, .as = { .object = { 0x0005, 8, -33 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -1, -25 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -9, -25 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, -1, -9 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -9, -9 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -11, -58 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p33") u8 AnimSprite_DarkBreathOBJ_Close5[] = INCBIN_U8("graphics/reuse/AnimSprite_DarkBreathOBJ_Close5.4bpp");
struct AnimSpriteData AnimSprite_DarkBreathOBJ_Close6[] __attribute__((section(".rodata.dat_data_banim_p33"))) =
{
    { .header = 0x90000000, .as = { .object = { 0x0005, 3, -41 } } },
    { .header = 0x90000000, .as = { .object = { 0x000D, 44, -22 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -14, -49 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, 12, 3 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, -12, -59 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_DarkBreathOBJ_Close7[] __attribute__((section(".rodata.dat_data_banim_p33"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFEBF, 0x0000, 0x0000, 0x0141 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 23, -30 } } },
    { .header = 0x90000000, .as = { .object = { 0x0011, 57, -21 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 4, -45 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -4, -45 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 4, -29 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -4, -29 } } },
    { .header = 0x80000100, .as = { .object = { 0x000D, 31, 7 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -12, -59 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_DarkBreathOBJ_Close8[] __attribute__((section(".rodata.dat_data_banim_p33"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0x016E } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 62, -26 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 54, -26 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 62, -10 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 54, -10 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 5, -33 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -3, -33 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 5, -17 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -3, -17 } } },
    { .header = 0x90000000, .as = { .object = { 0x0015, 72, -20 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 33, -25 } } },
    { .header = 0x80000100, .as = { .object = { 0x0011, 42, 6 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -2, -47 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_DarkBreathOBJ_Close9[] __attribute__((section(".rodata.dat_data_banim_p33"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 11, -45 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 3, -45 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 11, -29 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 3, -29 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 60, -29 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 23, -24 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 15, -24 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 23, -8 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 15, -8 } } },
    { .header = 0x90000000, .as = { .object = { 0x0019, 82, -22 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, 45, -21 } } },
    { .header = 0x10000000, .as = { .object = { 0x0063, -13, -59 } } },
    { .header = 0x80000100, .as = { .object = { 0x0011, 58, 8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_DarkBreathOBJ_Close10[] __attribute__((section(".rodata.dat_data_banim_p33"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 18, -19 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 70, -31 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 52, 5 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 44, 5 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 52, 21 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 44, 21 } } },
    { .header = 0x90008000, .as = { .object = { 0x001D, 106, -24 } } },
    { .header = 0x50008000, .as = { .object = { 0x001F, 98, -24 } } },
    { .header = 0x10008000, .as = { .object = { 0x0040, 90, -24 } } },
    { .header = 0x10008000, .as = { .object = { 0x0041, 90, -8 } } },
    { .header = 0x90000000, .as = { .object = { 0x000D, 56, -21 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -12, -54 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, 9, -40 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_DarkBreathOBJ_Close11[] __attribute__((section(".rodata.dat_data_banim_p33"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 16, -15 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 8, -15 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 16, 1 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 8, 1 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, 27, -13 } } },
    { .header = 0x90000000, .as = { .object = { 0x0011, 62, -20 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 1, -48 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -7, -48 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 1, -32 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -7, -32 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 66, 8 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 58, 8 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 66, 24 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 58, 24 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, 81, -38 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -17, -58 } } },
    { .header = 0x82000100, .as = { .object = { 0x000D, 17, -36 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_DarkBreathOBJ_Close12[] __attribute__((section(".rodata.dat_data_banim_p33"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 1, -36 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 42, -10 } } },
    { .header = 0x90000000, .as = { .object = { 0x000D, 22, -6 } } },
    { .header = 0x90000000, .as = { .object = { 0x0015, 74, -20 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 67, 5 } } },
    { .header = 0x80000100, .as = { .object = { 0x000D, 89, -41 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, -12, -58 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -10, -47 } } },
    { .header = 0x82000100, .as = { .object = { 0x0011, 30, -29 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, 10, 7 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_DarkBreathOBJ_Close13[] __attribute__((section(".rodata.dat_data_banim_p33"))) =
{
    { .header = 0x90000000, .as = { .object = { 0x0005, 82, 6 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, 5, -11 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 18, -26 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, 62, -9 } } },
    { .header = 0x90000000, .as = { .object = { 0x0011, 44, 1 } } },
    { .header = 0x90000000, .as = { .object = { 0x0019, 50, -21 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -11, -58 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -5, -41 } } },
    { .header = 0x10000000, .as = { .object = { 0x0063, 22, 14 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_DarkBreathOBJ_Close14[] __attribute__((section(".rodata.dat_data_banim_p33"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, 29, -23 } } },
    { .header = 0x90000000, .as = { .object = { 0x0019, 72, -14 } } },
    { .header = 0x90000000, .as = { .object = { 0x0015, 51, 3 } } },
    { .header = 0x90000000, .as = { .object = { 0x000D, 88, 6 } } },
    { .header = 0x10000000, .as = { .object = { 0x0063, -11, -58 } } },
    { .header = 0x10000000, .as = { .object = { 0x0063, 6, -8 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -2, -52 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -10, -52 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, -2, -36 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -10, -36 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, 2, -9 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, 29, 20 } } },
    ANIM_SPRITE_END,
};
