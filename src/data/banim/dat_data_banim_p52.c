#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p52.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p52") u8 AnimSprite_EfxMantBatabata2_L_1[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxMantBatabata2_L_1.4bpp");
SECTION(".rodata.dat_data_banim_p52") u8 AnimSprite_EfxMantBatabata2_L_2[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxMantBatabata2_L_2.4bpp");
struct AnimSpriteData AnimSprite_EfxMantBatabata2_L_3[] __attribute__((section(".rodata.dat_data_banim_p52"))) =
{
    { .header = 0x90004000, .as = { .object = { 0x0009, -44, -17 } } },
    { .header = 0x50000000, .as = { .object = { 0x0049, -28, -1 } } },
    { .header = 0x10000000, .as = { .object = { 0x0068, -12, 7 } } },
    { .header = 0x10000000, .as = { .object = { 0x006B, -36, 7 } } },
    { .header = 0x10000000, .as = { .object = { 0x0040, -22, -25 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -4, -17 } } },
    { .header = 0x10008000, .as = { .object = { 0x0000, -12, -17 } } },
    { .header = 0x10000000, .as = { .object = { 0x0043, -36, -1 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxMantBatabata2_L_4[] __attribute__((section(".rodata.dat_data_banim_p52"))) =
{
    { .header = 0x90004000, .as = { .object = { 0x000D, -44, -17 } } },
    { .header = 0x50000000, .as = { .object = { 0x004D, -28, -1 } } },
    { .header = 0x10000000, .as = { .object = { 0x006C, -12, 7 } } },
    { .header = 0x10000000, .as = { .object = { 0x0063, -36, 7 } } },
    { .header = 0x10008000, .as = { .object = { 0x0000, -12, -17 } } },
    { .header = 0x10000000, .as = { .object = { 0x0044, -4, -17 } } },
    { .header = 0x10000000, .as = { .object = { 0x0040, -22, -25 } } },
    { .header = 0x10000000, .as = { .object = { 0x0043, -36, -1 } } },
    ANIM_SPRITE_END,
};
