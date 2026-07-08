#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p215.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* AnimScr_NaglfarBG4: JP-only background anim script (6 ANFMT .4byte words, no
 * fe8u counterpart). Made source-editable as raw .4byte ANFMT words (the OBJ
 * sprite frames in this file already use the inline-asm form). Each word's
 * high bit (ANFMT_NOT_FORCESPRITE, 0x80000000) is clear, so these are
 * force-sprite / sprite-data words; the leading 0 + trailing 0,0 bracket the run.
 * Byte-identical to the former data/residual/AnimScr_NaglfarBG4.bin, verified by
 * `make compare`. */
const u32 AnimScr_NaglfarBG4[] __attribute__((section(".rodata.dat_data_banim_p215"))) = {
    0x00000000,
    0x001C0064,
    0x0000FFC4,
    0x00000001,
    0x00000000,
    0x00000000,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_0[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, -2, -59 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, 14, -47 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_1[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0002, -23, -55 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -7, -55 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -23, -39 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -7, -39 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 1, -38 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_2[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0005, -45, -51 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -12, -31 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, 4, -31 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -12, -15 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 4, -15 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 4, -64 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p215") u8 AnimSpr_NaglfarOBJ_3[] = INCBIN_U8("graphics/reuse/AnimSpr_NaglfarOBJ_3.4bpp");
struct AnimSpriteData AnimSpr_NaglfarOBJ_4[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0005, -39, -41 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -82, -34 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -8, -49 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -54, -5 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, 6, -59 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_5[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0141, 0x0000, 0x0000, 0x0141 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -57, -34 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -99, -25 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -24, -45 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -8, -45 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -24, -29 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -8, -29 } } },
    { .header = 0x80000100, .as = { .object = { 0x000D, -66, -1 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 2, -59 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_6[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -93, -26 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -77, -26 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -93, -10 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -77, -10 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -29, -33 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -13, -33 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -29, -17 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -13, -17 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -121, -20 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -61, -25 } } },
    { .header = 0x80000100, .as = { .object = { 0x0011, -80, 6 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -2, -47 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_7[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -16, -45 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, 0, -45 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -16, -29 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 0, -29 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -98, -29 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -33, -24 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -17, -24 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -33, -8 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -17, -8 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -126, -22 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -73, -21 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, 29, -59 } } },
    { .header = 0x80000100, .as = { .object = { 0x0011, -70, 8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_8[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -30, -19 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -102, -31 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -48, 5 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -32, 5 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -48, 21 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -32, 21 } } },
    { .header = 0x80008000, .as = { .object = { 0x001D, -128, -24 } } },
    { .header = 0x40008000, .as = { .object = { 0x001F, -112, -24 } } },
    { .header = 0x00008000, .as = { .object = { 0x0040, -104, -24 } } },
    { .header = 0x00008000, .as = { .object = { 0x0041, -104, -8 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -76, -21 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 20, -54 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -17, -40 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_9[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -12, -15 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, 4, -15 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -12, 1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 4, 1 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -50, -13 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -96, -20 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, 0, -48 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, 16, -48 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, 0, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 16, -32 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -75, 8 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -59, 8 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -75, 24 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -59, 24 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -120, -38 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 25, -58 } } },
    { .header = 0x82000100, .as = { .object = { 0x000D, -39, -36 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_10[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -19, -36 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -64, -10 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -39, -6 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -102, -20 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -87, 5 } } },
    { .header = 0x80000100, .as = { .object = { 0x000D, -123, -41 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, 28, -58 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 11, -47 } } },
    { .header = 0x82000100, .as = { .object = { 0x0011, -45, -29 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, -1, 7 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_11[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0005, -123, 6 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, 3, -11 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -39, -26 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -103, -9 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -68, 1 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -85, -21 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 19, -58 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 2, -41 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, -19, 14 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_12[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -54, -23 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -105, -14 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -82, 3 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -125, 6 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, 27, -58 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, 10, -8 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -7, -52 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, 9, -52 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -7, -36 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 9, -36 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -23, -9 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, -33, 20 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_13[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -75, -18 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -59, -18 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -75, -2 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -59, -2 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -95, -4 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -63, -21 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -125, 4 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, 20, -59 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, 0, -16 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, 16, -16 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, 0, 0 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 16, 0 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, 2, 6 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -32, -39 } } },
    { .header = 0x82000100, .as = { .object = { 0x000D, -29, 1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0062, -34, 24 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_14[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -96, -23 } } },
    { .header = 0x80008000, .as = { .object = { 0x001D, -82, -8 } } },
    { .header = 0x40008000, .as = { .object = { 0x001F, -66, -8 } } },
    { .header = 0x00008000, .as = { .object = { 0x0040, -58, -8 } } },
    { .header = 0x00008000, .as = { .object = { 0x0041, -58, 8 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -126, -1 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, 8, -50 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, 24, -50 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, 8, -34 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, 24, -34 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -28, -5 } } },
    { .header = 0x00000000, .as = { .object = { 0x0062, -22, 17 } } },
    { .header = 0x80000100, .as = { .object = { 0x000D, -29, -25 } } },
    { .header = 0x82000100, .as = { .object = { 0x0011, -48, 12 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -66, -21 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_15[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0xFFFF0002, .as = { .affine = { 0x016E, 0x0000, 0x0000, 0x016E } } },
    { .header = 0xFFFF0002, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x0005, -8, -47 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -53, 0 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -104, -28 } } },
    { .header = 0x80000100, .as = { .object = { 0x0015, -37, -31 } } },
    { .header = 0x82000100, .as = { .object = { 0x0011, -72, 12 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -76, -20 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_16[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -28, -8 } } },
    { .header = 0x80000000, .as = { .object = { 0x0009, -18, -42 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -75, 0 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -121, -30 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, -26, -22 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -53, -28 } } },
    { .header = 0x80000100, .as = { .object = { 0x0015, -103, 11 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -92, -22 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_17[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -48, -17 } } },
    { .header = 0x00008000, .as = { .object = { 0x0004, -32, -17 } } },
    { .header = 0x00004000, .as = { .object = { 0x0042, -48, -1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -32, -1 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -26, -41 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -93, 0 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -110, -34 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, -36, -35 } } },
    { .header = 0x80000100, .as = { .object = { 0x0019, -119, 8 } } },
    { .header = 0x80008000, .as = { .object = { 0x001D, -82, -20 } } },
    { .header = 0x40008000, .as = { .object = { 0x001F, -66, -20 } } },
    { .header = 0x00008000, .as = { .object = { 0x0040, -58, -20 } } },
    { .header = 0x00008000, .as = { .object = { 0x0041, -58, -4 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_18[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0005, -72, -9 } } },
    { .header = 0x80000000, .as = { .object = { 0x0011, -42, -40 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -109, -4 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -121, -34 } } },
    { .header = 0x00000000, .as = { .object = { 0x0064, -65, -36 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -68, -28 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_19[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0009, -80, -5 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -111, -13 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -124, -38 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -54, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0062, -66, -31 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -75, -23 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSpr_NaglfarOBJ_20[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x0019, -76, -26 } } },
    { .header = 0x80000000, .as = { .object = { 0x000D, -110, -7 } } },
    { .header = 0x80000100, .as = { .object = { 0x0009, -100, -35 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p215") u8 AnimSpr_NaglfarOBJ_21[] = INCBIN_U8("graphics/reuse/AnimSpr_NaglfarOBJ_21.4bpp");
struct AnimSpriteData AnimSpr_NaglfarOBJ_22[] __attribute__((section(".rodata.dat_data_banim_p215"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0200, 0x0000, 0x0000, 0x0200 } } },
    { .header = 0x80000000, .as = { .object = { 0x0015, -116, -11 } } },
    { .header = 0x80000100, .as = { .object = { 0x0019, -118, -38 } } },
    ANIM_SPRITE_END,
};
