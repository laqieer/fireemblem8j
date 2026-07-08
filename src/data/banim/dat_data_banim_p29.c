#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p29.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData AnimSprite_FirebreathOBJ_Right1[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0x10000000, .as = { .object = { 0x0064, -24, -8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right2[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0x50000000, .as = { .object = { 0x0000, -16, -10 } } },
    { .header = 0x10000000, .as = { .object = { 0x0063, -24, -4 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right3[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0x50000000, .as = { .object = { 0x0002, 6, -15 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -2, -15 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 6, 1 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -2, 1 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -14, -10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right4[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0xB0000000, .as = { .object = { 0x0005, 22, -9 } } },
    { .header = 0x70000000, .as = { .object = { 0x0002, 11, -5 } } },
    { .header = 0x30008000, .as = { .object = { 0x0004, 3, -5 } } },
    { .header = 0x30004000, .as = { .object = { 0x0042, 11, -13 } } },
    { .header = 0x30000000, .as = { .object = { 0x0044, 3, -13 } } },
    { .header = 0x70000000, .as = { .object = { 0x0000, -6, 2 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p29") u8 AnimSprite_FirebreathOBJ_Right5[] = INCBIN_U8("graphics/reuse/AnimSprite_FirebreathOBJ_Right5.4bpp");
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right6[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0x90000000, .as = { .object = { 0x0005, 9, -19 } } },
    { .header = 0x90000000, .as = { .object = { 0x000D, 45, -25 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -4, -11 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, 20, -8 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, -16, -2 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right7[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFEBF, 0x0000, 0x0000, 0x0141 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 28, -16 } } },
    { .header = 0x90000000, .as = { .object = { 0x0011, 64, -25 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 17, -9 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 9, -9 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 17, 7 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 9, 7 } } },
    { .header = 0x80000100, .as = { .object = { 0x000D, 40, -3 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -12, -6 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right8[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0x016E } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 10, -2 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 2, -2 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 10, 14 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 2, 14 } } },
    { .header = 0x90000000, .as = { .object = { 0x0015, 68, -23 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 18, -22 } } },
    { .header = 0x80000100, .as = { .object = { 0x0011, 36, -3 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 46, -26 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 38, -26 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 46, -10 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 38, -10 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -11, -3 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right9[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0x50000000, .as = { .object = { 0x0002, 16, 0 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 8, 0 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 16, 16 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 8, 16 } } },
    { .header = 0x90000000, .as = { .object = { 0x0019, 84, -39 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, 25, -17 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 46, -24 } } },
    { .header = 0x10000000, .as = { .object = { 0x0063, -13, 1 } } },
    { .header = 0x90000000, .as = { .object = { 0x0011, 68, -7 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, 4, -10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right10[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 22, -7 } } },
    { .header = 0x90000000, .as = { .object = { 0x000D, 38, -25 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 56, -34 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -2, -7 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, 6, -2 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 65, 3 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 57, 3 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 65, 19 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 57, 19 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, 11, -23 } } },
    { .header = 0xB0000000, .as = { .object = { 0x0019, 86, -15 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right11[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xB0000000, .as = { .object = { 0x0009, 39, -30 } } },
    { .header = 0xB0000000, .as = { .object = { 0x0011, 53, -8 } } },
    { .header = 0x70000000, .as = { .object = { 0x0002, 17, 2 } } },
    { .header = 0x30008000, .as = { .object = { 0x0004, 9, 2 } } },
    { .header = 0x30004000, .as = { .object = { 0x0042, 17, -6 } } },
    { .header = 0x30000000, .as = { .object = { 0x0044, 9, -6 } } },
    { .header = 0x70000000, .as = { .object = { 0x0002, 37, -6 } } },
    { .header = 0x30008000, .as = { .object = { 0x0004, 29, -6 } } },
    { .header = 0x30004000, .as = { .object = { 0x0042, 37, -14 } } },
    { .header = 0x30000000, .as = { .object = { 0x0044, 29, -14 } } },
    { .header = 0x70000000, .as = { .object = { 0x0002, 81, -24 } } },
    { .header = 0x30008000, .as = { .object = { 0x0004, 73, -24 } } },
    { .header = 0x30004000, .as = { .object = { 0x0042, 81, -32 } } },
    { .header = 0x30000000, .as = { .object = { 0x0044, 73, -32 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, 83, -16 } } },
    { .header = 0x70000000, .as = { .object = { 0x0000, -4, -3 } } },
    { .header = 0x82000100, .as = { .object = { 0x000D, 29, -3 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right12[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xB0000000, .as = { .object = { 0x000D, 44, -29 } } },
    { .header = 0xB0000000, .as = { .object = { 0x0015, 60, -13 } } },
    { .header = 0xB0000000, .as = { .object = { 0x0005, 12, -13 } } },
    { .header = 0xB0000000, .as = { .object = { 0x0005, 60, -23 } } },
    { .header = 0xB0000000, .as = { .object = { 0x0005, 85, -34 } } },
    { .header = 0x80000100, .as = { .object = { 0x000D, -159, -4 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, -20, 2 } } },
    { .header = 0x70000000, .as = { .object = { 0x0000, -4, -4 } } },
    { .header = 0x82000100, .as = { .object = { 0x0011, 38, -1 } } },
    { .header = 0x30000000, .as = { .object = { 0x0064, 28, -21 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right13[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0xB0000000, .as = { .object = { 0x0005, 25, -8 } } },
    { .header = 0xB0000000, .as = { .object = { 0x0011, 49, -24 } } },
    { .header = 0xB0000000, .as = { .object = { 0x0019, 65, -7 } } },
    { .header = 0xB0000000, .as = { .object = { 0x0009, 81, -21 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, 5, 8 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -11, 0 } } },
    { .header = 0x70000000, .as = { .object = { 0x0000, 9, -3 } } },
    { .header = 0x30000000, .as = { .object = { 0x0063, 35, -20 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right14[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xB0000000, .as = { .object = { 0x0019, 74, -4 } } },
    { .header = 0xB0000000, .as = { .object = { 0x0015, 58, -33 } } },
    { .header = 0xB0000000, .as = { .object = { 0x0009, 33, -6 } } },
    { .header = 0x10000000, .as = { .object = { 0x0063, -12, 4 } } },
    { .header = 0x30000000, .as = { .object = { 0x0063, 17, 5 } } },
    { .header = 0x70000000, .as = { .object = { 0x0002, 5, 1 } } },
    { .header = 0x30008000, .as = { .object = { 0x0004, -3, 1 } } },
    { .header = 0x30004000, .as = { .object = { 0x0042, 5, -7 } } },
    { .header = 0x30000000, .as = { .object = { 0x0044, -3, -7 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, 12, -20 } } },
    { .header = 0x30000000, .as = { .object = { 0x0064, 43, -23 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right15[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xB0000000, .as = { .object = { 0x0019, 63, -31 } } },
    { .header = 0xB0000000, .as = { .object = { 0x000D, 37, -8 } } },
    { .header = 0x70000000, .as = { .object = { 0x0002, 71, 17 } } },
    { .header = 0x30008000, .as = { .object = { 0x0004, 63, 17 } } },
    { .header = 0x30004000, .as = { .object = { 0x0042, 71, 9 } } },
    { .header = 0x30000000, .as = { .object = { 0x0044, 63, 9 } } },
    { .header = 0x70000000, .as = { .object = { 0x0000, -7, 1 } } },
    { .header = 0x70000000, .as = { .object = { 0x0002, 10, -2 } } },
    { .header = 0x30008000, .as = { .object = { 0x0004, 2, -2 } } },
    { .header = 0x30004000, .as = { .object = { 0x0042, 10, -10 } } },
    { .header = 0x30000000, .as = { .object = { 0x0044, 2, -10 } } },
    { .header = 0x30000000, .as = { .object = { 0x0064, 25, -5 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, 8, -4 } } },
    { .header = 0x82000100, .as = { .object = { 0x000D, 17, -29 } } },
    { .header = 0x30000000, .as = { .object = { 0x0062, 49, -27 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right16[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x90008000, .as = { .object = { 0x001D, 93, -4 } } },
    { .header = 0x50008000, .as = { .object = { 0x001F, 85, -4 } } },
    { .header = 0x10008000, .as = { .object = { 0x0040, 77, -4 } } },
    { .header = 0x10008000, .as = { .object = { 0x0041, 77, 12 } } },
    { .header = 0x90000000, .as = { .object = { 0x0011, 45, -19 } } },
    { .header = 0x90000000, .as = { .object = { 0x0015, -159, -9 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 81, -27 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 6, -10 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, -2, -10 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 6, 6 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -2, 6 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 17, -8 } } },
    { .header = 0x10000000, .as = { .object = { 0x0062, 45, 17 } } },
    { .header = 0x80000100, .as = { .object = { 0x000D, 21, -29 } } },
    { .header = 0x82000100, .as = { .object = { 0x0011, 37, 9 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right17[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE92, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x90000000, .as = { .object = { 0x0015, 43, -16 } } },
    { .header = 0x90000000, .as = { .object = { 0x0005, 1, -16 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, 33, 2 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, 78, -29 } } },
    { .header = 0x80000100, .as = { .object = { 0x0015, 21, -29 } } },
    { .header = 0x82000100, .as = { .object = { 0x0011, 52, 12 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right18[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, 31, 4 } } },
    { .header = 0x90000000, .as = { .object = { 0x0019, 54, -22 } } },
    { .header = 0x90000000, .as = { .object = { 0x0009, 12, -19 } } },
    { .header = 0x90000000, .as = { .object = { 0x000D, 61, -2 } } },
    { .header = 0x90000000, .as = { .object = { 0x000D, 88, -33 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, 46, -16 } } },
    { .header = 0x90000000, .as = { .object = { 0x0019, 38, -33 } } },
    { .header = 0x80000100, .as = { .object = { 0x0015, 82, 8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right19[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x90008000, .as = { .object = { 0x001D, 78, -20 } } },
    { .header = 0x50008000, .as = { .object = { 0x001F, 70, -20 } } },
    { .header = 0x10008000, .as = { .object = { 0x0040, 62, -20 } } },
    { .header = 0x10008000, .as = { .object = { 0x0041, 62, -4 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 38, -1 } } },
    { .header = 0x10008000, .as = { .object = { 0x0004, 30, -1 } } },
    { .header = 0x10004000, .as = { .object = { 0x0042, 38, 15 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, 30, 15 } } },
    { .header = 0x90000000, .as = { .object = { 0x000D, 16, -19 } } },
    { .header = 0x90000000, .as = { .object = { 0x0011, 72, 0 } } },
    { .header = 0x90000000, .as = { .object = { 0x0011, 89, -34 } } },
    { .header = 0x10000000, .as = { .object = { 0x0063, 50, -19 } } },
    { .header = 0x80000100, .as = { .object = { 0x0019, 96, 8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right20[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0x90000000, .as = { .object = { 0x0005, 45, -3 } } },
    { .header = 0x90000000, .as = { .object = { 0x0011, 26, -21 } } },
    { .header = 0x90000000, .as = { .object = { 0x0015, 83, -4 } } },
    { .header = 0x90000000, .as = { .object = { 0x0015, 88, -35 } } },
    { .header = 0x10000000, .as = { .object = { 0x0064, 64, -24 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, 56, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right21[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0x90000000, .as = { .object = { 0x0009, 62, -5 } } },
    { .header = 0x90000000, .as = { .object = { 0x0019, 80, -13 } } },
    { .header = 0x90000000, .as = { .object = { 0x0019, 88, -39 } } },
    { .header = 0x90000000, .as = { .object = { 0x0015, 36, -23 } } },
    { .header = 0x10000000, .as = { .object = { 0x0062, 72, -28 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, 69, -19 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right22[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0xFE00, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x90000000, .as = { .object = { 0x0019, 48, -25 } } },
    { .header = 0x90000000, .as = { .object = { 0x000D, 78, -7 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, 72, -32 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p29") u8 AnimSprite_FirebreathOBJ_Right23[] = INCBIN_U8("graphics/reuse/AnimSprite_FirebreathOBJ_Right23.4bpp");
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right24[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0x90000000, .as = { .object = { 0x0015, 66, -18 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right25[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0x90000000, .as = { .object = { 0x0019, 80, -21 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Right26[] __attribute__((section(".rodata.dat_data_banim_p29"))) =
{
    { .header = 0x90008000, .as = { .object = { 0x001D, 104, -24 } } },
    { .header = 0x50008000, .as = { .object = { 0x001F, 96, -24 } } },
    { .header = 0x10008000, .as = { .object = { 0x0040, 88, -24 } } },
    { .header = 0x10008000, .as = { .object = { 0x0041, 88, -8 } } },
    ANIM_SPRITE_END,
};
