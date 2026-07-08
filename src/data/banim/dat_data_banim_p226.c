#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p226.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p226") u16 Pal_ExcaliburSprites[] = INCBIN_U16("graphics/banim/_us/banim/assets/pal/00730780_Pal_ExcaliburSprites.gbapal");
struct AnimSpriteData AnimSprite_EfxExcalibur_1[] __attribute__((section(".rodata.dat_data_banim_p226"))) =
{
    { .header = 0xFFFF0003, .as = { .affine = { 0x006E, 0xFFC0, 0x0040, 0x006E } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x008E, 0x0000, 0x0000, 0x008E } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x0080, 0x0000, 0x0000, 0x0100 } } },
    { .header = 0x80000300, .as = { .object = { 0x0000, -41, -25 } } },
    { .header = 0x82000300, .as = { .object = { 0x0010, -18, -32 } } },
    { .header = 0x84000300, .as = { .object = { 0x000C, -32, -33 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxExcalibur_2[] __attribute__((section(".rodata.dat_data_banim_p226"))) =
{
    { .header = 0xFFFF0003, .as = { .affine = { 0x006E, 0xFFC0, 0x0040, 0x006E } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x008E, 0x0000, 0x0000, 0x008E } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x0080, 0x0000, 0x0000, 0x0100 } } },
    { .header = 0x80000300, .as = { .object = { 0x0000, -47, -19 } } },
    { .header = 0x82000300, .as = { .object = { 0x0010, -12, -35 } } },
    { .header = 0x84000300, .as = { .object = { 0x000C, -32, -35 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxExcalibur_3[] __attribute__((section(".rodata.dat_data_banim_p226"))) =
{
    { .header = 0xFFFF0003, .as = { .affine = { 0x0078, 0xFFD4, 0x002C, 0x0078 } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x008E, 0x0000, 0x0000, 0x008E } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x0080, 0x0000, 0x0000, 0x0100 } } },
    { .header = 0x80000300, .as = { .object = { 0x0000, -53, -16 } } },
    { .header = 0x82000300, .as = { .object = { 0x0010, -4, -37 } } },
    { .header = 0x84000300, .as = { .object = { 0x000C, -32, -37 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxExcalibur_4[] __attribute__((section(".rodata.dat_data_banim_p226"))) =
{
    { .header = 0xFFFF0003, .as = { .affine = { 0x007D, 0xFFEA, 0x0016, 0x007D } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x008B, 0x0018, 0xFFE8, 0x008B } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x0080, 0x0000, 0x0000, 0x00C5 } } },
    { .header = 0x80000300, .as = { .object = { 0x0000, -57, -16 } } },
    { .header = 0x82000300, .as = { .object = { 0x0010, 1, -38 } } },
    { .header = 0x84000300, .as = { .object = { 0x000C, -33, -39 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxExcalibur_5[] __attribute__((section(".rodata.dat_data_banim_p226"))) =
{
    { .header = 0xFFFF0003, .as = { .affine = { 0x007E, 0x0016, 0xFFEA, 0x007E } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x0085, 0x0030, 0xFFD0, 0x0085 } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x0080, 0x0000, 0x0000, 0x008E } } },
    { .header = 0x80000300, .as = { .object = { 0x0000, -65, -16 } } },
    { .header = 0x82000300, .as = { .object = { 0x0010, 6, -36 } } },
    { .header = 0x84000300, .as = { .object = { 0x000C, -33, -43 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxExcalibur_6[] __attribute__((section(".rodata.dat_data_banim_p226"))) =
{
    { .header = 0xFFFF0003, .as = { .affine = { 0x006E, 0x003F, 0xFFC1, 0x006E } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0x0080, 0x0000, 0x0000, 0x0080 } } },
    { .header = 0xFFFF0003, .as = { .affine = { 0xFF86, 0xFFBA, 0xFFC1, 0x006E } } },
    { .header = 0x80000300, .as = { .object = { 0x0000, -72, -22 } } },
    { .header = 0x82000300, .as = { .object = { 0x000C, -33, -49 } } },
    { .header = 0x84000300, .as = { .object = { 0x0008, 11, -34 } } },
    ANIM_SPRITE_END,
};
