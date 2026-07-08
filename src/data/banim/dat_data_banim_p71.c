#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p71.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p71") u16 Img_EfxElfireOBJ[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/00603F98_Img_EfxElfireOBJ.4bpp.lz");
SECTION(".rodata.dat_data_banim_p71") u16 Pal_EfxElfireOBJ[] = INCBIN_U16("graphics/banim/_us/banim/assets/pal/00604210_Pal_EfxElfireOBJ.agbpal");
struct AnimSpriteData AnimSprite_EfxElfireOBJ_1[] __attribute__((section(".rodata.dat_data_banim_p71"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x000A, -36, 10 } } },
    { .header = 0x40000000, .as = { .object = { 0x000A, 20, 10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxElfireOBJ_2[] __attribute__((section(".rodata.dat_data_banim_p71"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, -26, 5 } } },
    { .header = 0x40000000, .as = { .object = { 0x000C, -36, 10 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, 10, 5 } } },
    { .header = 0x50000000, .as = { .object = { 0x000C, 20, 10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxElfireOBJ_3[] __attribute__((section(".rodata.dat_data_banim_p71"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, -16, 3 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -26, 6 } } },
    { .header = 0x40000000, .as = { .object = { 0x000E, -36, 10 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, 0, 3 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 10, 6 } } },
    { .header = 0x50000000, .as = { .object = { 0x000E, 20, 10 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxElfireOBJ_4[] __attribute__((section(".rodata.dat_data_banim_p71"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, -7, 1 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -17, 4 } } },
    { .header = 0x40000000, .as = { .object = { 0x0004, -27, 6 } } },
    { .header = 0x40000000, .as = { .object = { 0x0006, -36, 8 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -9, 1 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, 1, 4 } } },
    { .header = 0x50000000, .as = { .object = { 0x0004, 11, 6 } } },
    { .header = 0x50000000, .as = { .object = { 0x0006, 20, 8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxElfireOBJ_5[] __attribute__((section(".rodata.dat_data_banim_p71"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, 3, -2 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, -7, 1 } } },
    { .header = 0x40000000, .as = { .object = { 0x0004, -17, 4 } } },
    { .header = 0x40000000, .as = { .object = { 0x0006, -26, 6 } } },
    { .header = 0x40000000, .as = { .object = { 0x0008, -36, 8 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -19, -2 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -9, 1 } } },
    { .header = 0x50000000, .as = { .object = { 0x0004, 1, 4 } } },
    { .header = 0x50000000, .as = { .object = { 0x0006, 10, 6 } } },
    { .header = 0x50000000, .as = { .object = { 0x0008, 20, 8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxElfireOBJ_6[] __attribute__((section(".rodata.dat_data_banim_p71"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, 10, -4 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, 0, -1 } } },
    { .header = 0x40000000, .as = { .object = { 0x0004, -10, 2 } } },
    { .header = 0x40000000, .as = { .object = { 0x0006, -19, 4 } } },
    { .header = 0x40000000, .as = { .object = { 0x0008, -29, 6 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -26, -4 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -16, -1 } } },
    { .header = 0x50000000, .as = { .object = { 0x0004, -6, 2 } } },
    { .header = 0x50000000, .as = { .object = { 0x0006, 3, 4 } } },
    { .header = 0x50000000, .as = { .object = { 0x0008, 13, 6 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxElfireOBJ_7[] __attribute__((section(".rodata.dat_data_banim_p71"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, 17, -6 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, 7, -3 } } },
    { .header = 0x40000000, .as = { .object = { 0x0004, -3, 0 } } },
    { .header = 0x40000000, .as = { .object = { 0x0006, -12, 2 } } },
    { .header = 0x40000000, .as = { .object = { 0x0008, -22, 4 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -33, -6 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -23, -3 } } },
    { .header = 0x50000000, .as = { .object = { 0x0004, -13, 0 } } },
    { .header = 0x50000000, .as = { .object = { 0x0006, -4, 2 } } },
    { .header = 0x50000000, .as = { .object = { 0x0008, 6, 4 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxElfireOBJ_8[] __attribute__((section(".rodata.dat_data_banim_p71"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, 23, -11 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, 13, -6 } } },
    { .header = 0x40000000, .as = { .object = { 0x0004, 2, -2 } } },
    { .header = 0x40000000, .as = { .object = { 0x0006, -7, 0 } } },
    { .header = 0x40000000, .as = { .object = { 0x0008, -17, 3 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -39, -11 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -29, -6 } } },
    { .header = 0x50000000, .as = { .object = { 0x0004, -18, -2 } } },
    { .header = 0x50000000, .as = { .object = { 0x0006, -9, 0 } } },
    { .header = 0x50000000, .as = { .object = { 0x0008, 1, 3 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxElfireOBJ_9[] __attribute__((section(".rodata.dat_data_banim_p71"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, 30, -18 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, 20, -12 } } },
    { .header = 0x40000000, .as = { .object = { 0x0004, 10, -7 } } },
    { .header = 0x40000000, .as = { .object = { 0x0006, 1, -3 } } },
    { .header = 0x40000000, .as = { .object = { 0x0008, -9, 1 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -46, -18 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -36, -12 } } },
    { .header = 0x50000000, .as = { .object = { 0x0004, -26, -7 } } },
    { .header = 0x50000000, .as = { .object = { 0x0006, -17, -3 } } },
    { .header = 0x50000000, .as = { .object = { 0x0008, -7, 1 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxElfireOBJ_10[] __attribute__((section(".rodata.dat_data_banim_p71"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, 34, -24 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, 27, -16 } } },
    { .header = 0x40000000, .as = { .object = { 0x0004, 17, -10 } } },
    { .header = 0x40000000, .as = { .object = { 0x0006, 8, -6 } } },
    { .header = 0x40000000, .as = { .object = { 0x0008, -2, -2 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -50, -23 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -43, -15 } } },
    { .header = 0x50000000, .as = { .object = { 0x0004, -33, -9 } } },
    { .header = 0x50000000, .as = { .object = { 0x0006, -24, -5 } } },
    { .header = 0x50000000, .as = { .object = { 0x0008, -14, -1 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxElfireOBJ_11[] __attribute__((section(".rodata.dat_data_banim_p71"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, 36, -32 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, 34, -24 } } },
    { .header = 0x40000000, .as = { .object = { 0x0004, 26, -16 } } },
    { .header = 0x40000000, .as = { .object = { 0x0006, 15, -10 } } },
    { .header = 0x40000000, .as = { .object = { 0x0008, 5, -6 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -52, -32 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -50, -24 } } },
    { .header = 0x50000000, .as = { .object = { 0x0004, -42, -16 } } },
    { .header = 0x50000000, .as = { .object = { 0x0006, -31, -10 } } },
    { .header = 0x50000000, .as = { .object = { 0x0008, -21, -6 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxElfireOBJ_12[] __attribute__((section(".rodata.dat_data_banim_p71"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, 35, -37 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, 36, -29 } } },
    { .header = 0x40000000, .as = { .object = { 0x0004, 30, -20 } } },
    { .header = 0x40000000, .as = { .object = { 0x0006, 19, -13 } } },
    { .header = 0x40000000, .as = { .object = { 0x0008, 9, -8 } } },
    { .header = 0x50000000, .as = { .object = { 0x0000, -51, -37 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -52, -29 } } },
    { .header = 0x50000000, .as = { .object = { 0x0004, -46, -20 } } },
    { .header = 0x50000000, .as = { .object = { 0x0006, -35, -13 } } },
    { .header = 0x50000000, .as = { .object = { 0x0008, -25, -8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxElfireOBJ_13[] __attribute__((section(".rodata.dat_data_banim_p71"))) =
{
    { .header = 0x00008000, .as = { .object = { 0x0001, 36, -43 } } },
    { .header = 0x40000000, .as = { .object = { 0x0002, 36, -38 } } },
    { .header = 0x40000000, .as = { .object = { 0x0004, 36, -27 } } },
    { .header = 0x40000000, .as = { .object = { 0x0006, 29, -19 } } },
    { .header = 0x40000000, .as = { .object = { 0x0008, 20, -13 } } },
    { .header = 0x10008000, .as = { .object = { 0x0001, -44, -43 } } },
    { .header = 0x50000000, .as = { .object = { 0x0002, -52, -38 } } },
    { .header = 0x50000000, .as = { .object = { 0x0004, -52, -27 } } },
    { .header = 0x50000000, .as = { .object = { 0x0006, -45, -19 } } },
    { .header = 0x50000000, .as = { .object = { 0x0008, -36, -13 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxElfireOBJ_14[] __attribute__((section(".rodata.dat_data_banim_p71"))) =
{
    { .header = 0x00008000, .as = { .object = { 0x0003, 36, -43 } } },
    { .header = 0x40000000, .as = { .object = { 0x0004, 36, -38 } } },
    { .header = 0x40000000, .as = { .object = { 0x0006, 36, -27 } } },
    { .header = 0x40000000, .as = { .object = { 0x0008, 29, -18 } } },
    { .header = 0x10008000, .as = { .object = { 0x0003, -44, -43 } } },
    { .header = 0x50000000, .as = { .object = { 0x0004, -52, -38 } } },
    { .header = 0x50000000, .as = { .object = { 0x0006, -52, -27 } } },
    { .header = 0x50000000, .as = { .object = { 0x0008, -45, -18 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxElfireOBJ_15[] __attribute__((section(".rodata.dat_data_banim_p71"))) =
{
    { .header = 0x00008000, .as = { .object = { 0x0005, 36, -43 } } },
    { .header = 0x40000000, .as = { .object = { 0x0006, 36, -38 } } },
    { .header = 0x40000000, .as = { .object = { 0x0008, 35, -27 } } },
    { .header = 0x10008000, .as = { .object = { 0x0005, -44, -43 } } },
    { .header = 0x50000000, .as = { .object = { 0x0006, -52, -38 } } },
    { .header = 0x50000000, .as = { .object = { 0x0008, -51, -27 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxElfireOBJ_16[] __attribute__((section(".rodata.dat_data_banim_p71"))) =
{
    { .header = 0x00008000, .as = { .object = { 0x0007, 36, -43 } } },
    { .header = 0x40000000, .as = { .object = { 0x0008, 36, -38 } } },
    { .header = 0x10008000, .as = { .object = { 0x0007, -44, -43 } } },
    { .header = 0x50000000, .as = { .object = { 0x0008, -52, -38 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxElfireOBJ_17[] __attribute__((section(".rodata.dat_data_banim_p71"))) =
{
    { .header = 0x00008000, .as = { .object = { 0x0009, 36, -43 } } },
    { .header = 0x10008000, .as = { .object = { 0x0009, -44, -44 } } },
    ANIM_SPRITE_END,
};
