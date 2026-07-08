#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p49.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData AnimSprite_EfxMantBatabata1_R_1[] __attribute__((section(".rodata.dat_data_banim_p49"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0088, 9, -17 } } },
    { .header = 0x00008000, .as = { .object = { 0x008C, 41, -17 } } },
    { .header = 0x40000000, .as = { .object = { 0x00C8, 9, -1 } } },
    { .header = 0x00008000, .as = { .object = { 0x00CA, 25, -1 } } },
    { .header = 0x00000000, .as = { .object = { 0x00CB, 17, -25 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p49") u8 AnimSprite_EfxMantBatabata1_R_2[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxMantBatabata1_R_2.4bpp");
struct AnimSpriteData AnimSprite_EfxMantBatabata1_R_3[] __attribute__((section(".rodata.dat_data_banim_p49"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0092, 9, -17 } } },
    { .header = 0x00008000, .as = { .object = { 0x0096, 41, -17 } } },
    { .header = 0x00004000, .as = { .object = { 0x00D2, 9, -1 } } },
    { .header = 0x00000000, .as = { .object = { 0x00D4, 25, -1 } } },
    { .header = 0x00004000, .as = { .object = { 0x00D5, 33, -1 } } },
    { .header = 0x00004000, .as = { .object = { 0x00E8, 9, 7 } } },
    { .header = 0x00000000, .as = { .object = { 0x00EA, 25, 7 } } },
    { .header = 0x00000000, .as = { .object = { 0x00CB, 17, -25 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxMantBatabata1_R_4[] __attribute__((section(".rodata.dat_data_banim_p49"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0097, 9, -17 } } },
    { .header = 0x00008000, .as = { .object = { 0x009B, 41, -17 } } },
    { .header = 0x00004000, .as = { .object = { 0x00D7, 9, -1 } } },
    { .header = 0x00000000, .as = { .object = { 0x00D9, 25, -1 } } },
    { .header = 0x00004000, .as = { .object = { 0x00E8, 9, 7 } } },
    { .header = 0x00000000, .as = { .object = { 0x00EA, 25, 7 } } },
    { .header = 0x00000000, .as = { .object = { 0x00CB, 17, -25 } } },
    { .header = 0x00004000, .as = { .object = { 0x00DA, 33, -1 } } },
    ANIM_SPRITE_END,
};
