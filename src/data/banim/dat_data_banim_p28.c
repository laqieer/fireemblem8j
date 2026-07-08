#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p28.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData AnimSprite_FirebreathOBJ_Left1[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0064, 16, -8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left2[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, 0, -10 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, 16, -4 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left3[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0002, -22, -15 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -6, -15 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -22, 1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -6, 1 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -2, -10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left4[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0xA0000000, .as = { .object = { 0x0005, -54, -9 } } },
    { .header = 0x60000000, .as = { .object = { 0x0002, -27, -5 } } },
    { .header = 0x20008000, .as = { .object = { 0x0004, -11, -5 } } },
    { .header = 0x20004000, .as = { .object = { 0x0042, -27, -13 } } },
    { .header = 0x20000000, .as = { .object = { 0x0044, -11, -13 } } },
    { .header = 0x60000000, .as = { .object = { 0x0000, -10, 2 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p28") u8 AnimSprite_FirebreathOBJ_Left5[] = INCBIN_U8("graphics/reuse/AnimSprite_FirebreathOBJ_Left5.4bpp");
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left6[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0005, -41, -19 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -77, -25 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -12, -11 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -52, -8 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, 8, -2 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left7[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0141, 0x0000, 0x0000, 0x0141 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -60, -16 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -96, -25 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -33, -9 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -17, -9 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -33, 7 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -17, 7 } } },
    { .header = 0x80000100, .as = { .object = { 0x000D, -72, -3 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -4, -6 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left8[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -26, -2 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -10, -2 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -26, 14 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -10, 14 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -100, -23 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -50, -22 } } },
    { .header = 0x80000100, .as = { .object = { 0x0011, -68, -3 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -62, -26 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -46, -26 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -62, -10 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -46, -10 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -5, -3 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left9[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0002, -32, 0 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -16, 0 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -32, 16 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -16, 16 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -116, -39 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -57, -17 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -78, -24 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, 5, 1 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -100, -7 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -20, -10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left10[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -54, -7 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -70, -25 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -88, -34 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -14, -7 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -22, -2 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -81, 3 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -65, 3 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -81, 19 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -65, 19 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -43, -23 } } },
    { .header = 0xA0000000, .as = { .object = { 0x0019, -118, -15 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left11[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xA0000000, .as = { .object = { 0x0009, -71, -30 } } },
    { .header = 0xA0000000, .as = { .object = { 0x0011, -85, -8 } } },
    { .header = 0x60000000, .as = { .object = { 0x0002, -33, 2 } } },
    { .header = 0x20008000, .as = { .object = { 0x0004, -17, 2 } } },
    { .header = 0x20004000, .as = { .object = { 0x0042, -33, -6 } } },
    { .header = 0x20000000, .as = { .object = { 0x0044, -17, -6 } } },
    { .header = 0x60000000, .as = { .object = { 0x0002, -53, -6 } } },
    { .header = 0x20008000, .as = { .object = { 0x0004, -37, -6 } } },
    { .header = 0x20004000, .as = { .object = { 0x0042, -53, -14 } } },
    { .header = 0x20000000, .as = { .object = { 0x0044, -37, -14 } } },
    { .header = 0x60000000, .as = { .object = { 0x0002, -97, -24 } } },
    { .header = 0x20008000, .as = { .object = { 0x0004, -81, -24 } } },
    { .header = 0x20004000, .as = { .object = { 0x0042, -97, -32 } } },
    { .header = 0x20000000, .as = { .object = { 0x0044, -81, -32 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -115, -16 } } },
    { .header = 0x60000000, .as = { .object = { 0x0000, -12, -3 } } },
    { .header = 0x82000100, .as = { .object = { 0x000D, -61, -3 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left12[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xA0000000, .as = { .object = { 0x000D, -76, -29 } } },
    { .header = 0xA0000000, .as = { .object = { 0x0015, -92, -13 } } },
    { .header = 0xA0000000, .as = { .object = { 0x0005, -44, -13 } } },
    { .header = 0xA0000000, .as = { .object = { 0x0005, -92, -23 } } },
    { .header = 0xA0000000, .as = { .object = { 0x0005, -117, -34 } } },
    { .header = 0x80000100, .as = { .object = { 0x000D, 127, -4 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, 12, 2 } } },
    { .header = 0x60000000, .as = { .object = { 0x0000, -12, -4 } } },
    { .header = 0x82000100, .as = { .object = { 0x0011, -70, -1 } } },
    { .header = 0x20000000, .as = { .object = { 0x0064, -36, -21 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left13[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0xA0000000, .as = { .object = { 0x0005, -57, -8 } } },
    { .header = 0xA0000000, .as = { .object = { 0x0011, -81, -24 } } },
    { .header = 0xA0000000, .as = { .object = { 0x0019, -97, -7 } } },
    { .header = 0xA0000000, .as = { .object = { 0x0009, -113, -21 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, -13, 8 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -5, 0 } } },
    { .header = 0x60000000, .as = { .object = { 0x0000, -25, -3 } } },
    { .header = 0x20000000, .as = { .object = { 0x0063, -43, -20 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left14[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xA0000000, .as = { .object = { 0x0019, -106, -4 } } },
    { .header = 0xA0000000, .as = { .object = { 0x0015, -90, -33 } } },
    { .header = 0xA0000000, .as = { .object = { 0x0009, -65, -6 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, 4, 4 } } },
    { .header = 0x20000000, .as = { .object = { 0x0063, -25, 5 } } },
    { .header = 0x60000000, .as = { .object = { 0x0002, -21, 1 } } },
    { .header = 0x20008000, .as = { .object = { 0x0004, -5, 1 } } },
    { .header = 0x20004000, .as = { .object = { 0x0042, -21, -7 } } },
    { .header = 0x20000000, .as = { .object = { 0x0044, -5, -7 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -44, -20 } } },
    { .header = 0x20000000, .as = { .object = { 0x0064, -51, -23 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left15[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0xA0000000, .as = { .object = { 0x0019, -95, -31 } } },
    { .header = 0xA0000000, .as = { .object = { 0x000D, -69, -8 } } },
    { .header = 0x60000000, .as = { .object = { 0x0002, -87, 17 } } },
    { .header = 0x20008000, .as = { .object = { 0x0004, -71, 17 } } },
    { .header = 0x20004000, .as = { .object = { 0x0042, -87, 9 } } },
    { .header = 0x20000000, .as = { .object = { 0x0044, -71, 9 } } },
    { .header = 0x60000000, .as = { .object = { 0x0000, -9, 1 } } },
    { .header = 0x60000000, .as = { .object = { 0x0002, -26, -2 } } },
    { .header = 0x20008000, .as = { .object = { 0x0004, -10, -2 } } },
    { .header = 0x20004000, .as = { .object = { 0x0042, -26, -10 } } },
    { .header = 0x20000000, .as = { .object = { 0x0044, -10, -10 } } },
    { .header = 0x20000000, .as = { .object = { 0x0064, -33, -5 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -40, -4 } } },
    { .header = 0x82000100, .as = { .object = { 0x000D, -49, -29 } } },
    { .header = 0x20000000, .as = { .object = { 0x0062, -57, -27 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left16[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80008000, .as = { .object = { 0x001D, -109, -4 } } },
    { .header = 0x40008000, .as = { .object = { 0x001F, -93, -4 } } },
    { .header = 0x00008000, .as = { .object = { 0x0040, -85, -4 } } },
    { .header = 0x00008000, .as = { .object = { 0x0041, -85, 12 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -77, -19 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, 127, -9 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -113, -27 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -22, -10 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -6, -10 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -22, 6 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -6, 6 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -49, -8 } } },
    { .header = 0x00000000, .as = { .object = { 0x0062, -53, 17 } } },
    { .header = 0x80000100, .as = { .object = { 0x000D, -53, -29 } } },
    { .header = 0x82000100, .as = { .object = { 0x0011, -69, 9 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left17[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -75, -16 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -33, -16 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -65, 2 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -110, -29 } } },
    { .header = 0x80000100, .as = { .object = { 0x0015, -53, -29 } } },
    { .header = 0x82000100, .as = { .object = { 0x0011, -84, 12 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left18[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -47, 4 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -86, -22 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -44, -19 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -93, -2 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -120, -33 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, -54, -16 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -70, -33 } } },
    { .header = 0x80000100, .as = { .object = { 0x0015, -114, 8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left19[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80008000, .as = { .object = { 0x001D, -94, -20 } } },
    { .header = 0x40008000, .as = { .object = { 0x001F, -78, -20 } } },
    { .header = 0x00008000, .as = { .object = { 0x0040, -70, -20 } } },
    { .header = 0x00008000, .as = { .object = { 0x0041, -70, -4 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -54, -1 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -38, -1 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -54, 15 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -38, 15 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -48, -19 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -104, 0 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -121, -34 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, -58, -19 } } },
    { .header = 0x80000100, .as = { .object = { 0x0019, -128, 8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left20[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0005, -77, -3 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -58, -21 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -115, -4 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -120, -35 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, -72, -24 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -72, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left21[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0009, -94, -5 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -112, -13 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -120, -39 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -68, -23 } } },
    { .header = 0x00000000, .as = { .object = { 0x0062, -80, -28 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -85, -19 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left22[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -80, -25 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -110, -7 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -104, -32 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p28") u8 AnimSprite_FirebreathOBJ_Left23[] = INCBIN_U8("graphics/reuse/AnimSprite_FirebreathOBJ_Left23.4bpp");
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left24[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0015, -98, -18 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left25[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0019, -112, -21 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_FirebreathOBJ_Left26[] __attribute__((section(".rodata.dat_data_banim_p28"))) =
{
    { .header = 0x80008000, .as = { .object = { 0x001D, -120, -24 } } },
    { .header = 0x40008000, .as = { .object = { 0x001F, -104, -24 } } },
    { .header = 0x00008000, .as = { .object = { 0x0040, -96, -24 } } },
    { .header = 0x00008000, .as = { .object = { 0x0041, -96, -8 } } },
    ANIM_SPRITE_END,
};
