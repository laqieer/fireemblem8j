#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p50.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData AnimSprite_EfxMantBatabata1_L_1[] __attribute__((section(".rodata.dat_data_banim_p50"))) =
{
    { .header = 0x90004000, .as = { .object = { 0x0088, -41, -17 } } },
    { .header = 0x10008000, .as = { .object = { 0x008C, -49, -17 } } },
    { .header = 0x50000000, .as = { .object = { 0x00C8, -25, -1 } } },
    { .header = 0x10008000, .as = { .object = { 0x00CA, -33, -1 } } },
    { .header = 0x10000000, .as = { .object = { 0x00CB, -25, -25 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p50") u8 AnimSprite_EfxMantBatabata1_L_2[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxMantBatabata1_L_2.4bpp");
struct AnimSpriteData AnimSprite_EfxMantBatabata1_L_3[] __attribute__((section(".rodata.dat_data_banim_p50"))) =
{
    { .header = 0x90004000, .as = { .object = { 0x0092, -41, -17 } } },
    { .header = 0x10008000, .as = { .object = { 0x0096, -49, -17 } } },
    { .header = 0x10004000, .as = { .object = { 0x00D2, -25, -1 } } },
    { .header = 0x10000000, .as = { .object = { 0x00D4, -33, -1 } } },
    { .header = 0x10004000, .as = { .object = { 0x00D5, -49, -1 } } },
    { .header = 0x10004000, .as = { .object = { 0x00E8, -25, 7 } } },
    { .header = 0x10000000, .as = { .object = { 0x00EA, -33, 7 } } },
    { .header = 0x10000000, .as = { .object = { 0x00CB, -25, -25 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxMantBatabata1_L_4[] __attribute__((section(".rodata.dat_data_banim_p50"))) =
{
    { .header = 0x90004000, .as = { .object = { 0x0097, -41, -17 } } },
    { .header = 0x10008000, .as = { .object = { 0x009B, -49, -17 } } },
    { .header = 0x10004000, .as = { .object = { 0x00D7, -25, -1 } } },
    { .header = 0x10000000, .as = { .object = { 0x00D9, -33, -1 } } },
    { .header = 0x10004000, .as = { .object = { 0x00E8, -25, 7 } } },
    { .header = 0x10000000, .as = { .object = { 0x00EA, -33, 7 } } },
    { .header = 0x10000000, .as = { .object = { 0x00CB, -25, -25 } } },
    { .header = 0x10004000, .as = { .object = { 0x00DA, -49, -1 } } },
    ANIM_SPRITE_END,
};
