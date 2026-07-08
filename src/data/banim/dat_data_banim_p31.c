#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p31.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData AnimSprite_IcebreathOBJ_Left1[] __attribute__((section(".rodata.dat_data_banim_p31"))) =
{
    { .header = 0x10000000, .as = { .object = { 0x0064, -20, -20 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Left2[] __attribute__((section(".rodata.dat_data_banim_p31"))) =
{
    { .header = 0x50000000, .as = { .object = { 0x0000, -11, -16 } } },
    { .header = 0x10000000, .as = { .object = { 0x0063, -18, -13 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Left3[] __attribute__((section(".rodata.dat_data_banim_p31"))) =
{
    { .header = 0x50000000, .as = { .object = { 0x0002, 6, -14 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -2, -14 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 6, 2 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -2, 2 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -11, -4 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Left4[] __attribute__((section(".rodata.dat_data_banim_p31"))) =
{
    { .header = 0x90000000, .as = { .object = { 0x0005, 6, -15 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -1, 2 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -9, 2 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, -1, 18 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -9, 18 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -18, -18 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p31") u8 AnimSprite_IcebreathOBJ_Left5[] = INCBIN_U8("graphics/reuse/AnimSprite_IcebreathOBJ_Left5.4bpp");
struct AnimSpriteData AnimSprite_IcebreathOBJ_Left6[] __attribute__((section(".rodata.dat_data_banim_p31"))) =
{
    { .header = 0x90000000, .as = { .object = { 0x0005, 2, -14 } } },
    { .header = 0x90000000, .as = { .object = { 0x000D, 37, -13 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -11, -13 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, 10, 2 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, -16, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Left7[] __attribute__((section(".rodata.dat_data_banim_p31"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFEBF, 0x0000, 0x0000, 0x0141 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 12, -11 } } },
    { .header = 0x90000000, .as = { .object = { 0x0011, 50, -16 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 5, -14 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -3, -14 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 5, 2 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -3, 2 } } },
    { .header = 0x80000100, .as = { .object = { 0x000D, 18, 3 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -14, -10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Left8[] __attribute__((section(".rodata.dat_data_banim_p31"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0x016E } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 2, -3 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -6, -3 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 2, 13 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -6, 13 } } },
    { .header = 0x90000000, .as = { .object = { 0x0015, 66, -18 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 18, -12 } } },
    { .header = 0x80000100, .as = { .object = { 0x0011, 28, 4 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 41, -18 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 33, -18 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 41, -2 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 33, -2 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -14, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Left9[] __attribute__((section(".rodata.dat_data_banim_p31"))) =
{
    { .header = 0x50000000, .as = { .object = { 0x0002, 1, -13 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -7, -13 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 1, 3 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -7, 3 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 33, -9 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 11, -1 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 3, -1 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 11, 15 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 3, 15 } } },
    { .header = 0x90000000, .as = { .object = { 0x0019, 74, -20 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, 14, -16 } } },
    { .header = 0x10000000, .as = { .object = { 0x0063, -20, -20 } } },
    { .header = 0x90000000, .as = { .object = { 0x0011, 50, 8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Left10[] __attribute__((section(".rodata.dat_data_banim_p31"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 9, -3 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 49, -21 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 52, 5 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 44, 5 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 52, 21 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 44, 21 } } },
    { .header = 0x90008000, .as = { .object = { 0x001D, 106, -24 } } },
    { .header = 0x50008000, .as = { .object = { 0x001F, 98, -24 } } },
    { .header = 0x10008000, .as = { .object = { 0x0040, 90, -24 } } },
    { .header = 0x10008000, .as = { .object = { 0x0041, 90, -8 } } },
    { .header = 0x90000000, .as = { .object = { 0x000D, 26, -16 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -14, -17 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -2, -26 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Left11[] __attribute__((section(".rodata.dat_data_banim_p31"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 18, -1 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 10, -1 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 18, 15 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 10, 15 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, 20, 0 } } },
    { .header = 0x90000000, .as = { .object = { 0x0011, 34, -16 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 3, -15 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -5, -15 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 3, 1 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -5, 1 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 66, 8 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 58, 8 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 66, 24 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 58, 24 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, 66, -24 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -21, -20 } } },
    { .header = 0x82000100, .as = { .object = { 0x000D, 10, -25 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Left12[] __attribute__((section(".rodata.dat_data_banim_p31"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 3, -16 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 42, -6 } } },
    { .header = 0x90000000, .as = { .object = { 0x000D, 26, 0 } } },
    { .header = 0x90000000, .as = { .object = { 0x0015, 42, -15 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 67, 5 } } },
    { .header = 0x80000100, .as = { .object = { 0x000D, 79, -25 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, -19, -17 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -13, -6 } } },
    { .header = 0x82000100, .as = { .object = { 0x0011, 20, -27 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, 10, 16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Left13[] __attribute__((section(".rodata.dat_data_banim_p31"))) =
{
    { .header = 0x90000000, .as = { .object = { 0x0005, 86, 8 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, -2, -5 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 13, -17 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, 66, -3 } } },
    { .header = 0x90000000, .as = { .object = { 0x0011, 34, 0 } } },
    { .header = 0x90000000, .as = { .object = { 0x0019, 50, -16 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -16, -16 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -6, 2 } } },
    { .header = 0x10000000, .as = { .object = { 0x0063, 20, 20 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_IcebreathOBJ_Left14[] __attribute__((section(".rodata.dat_data_banim_p31"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, 20, -17 } } },
    { .header = 0x90000000, .as = { .object = { 0x0019, 58, -18 } } },
    { .header = 0x90000000, .as = { .object = { 0x0015, 42, 0 } } },
    { .header = 0x90000000, .as = { .object = { 0x000D, 82, -5 } } },
    { .header = 0x10000000, .as = { .object = { 0x0063, -19, -18 } } },
    { .header = 0x10000000, .as = { .object = { 0x0063, 5, 1 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -4, -15 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -12, -15 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, -4, 1 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -12, 1 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -2, -1 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, 27, 21 } } },
    ANIM_SPRITE_END,
};
