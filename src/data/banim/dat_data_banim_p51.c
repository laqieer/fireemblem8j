#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p51.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p51") u8 AnimSprite_EfxMantBatabata2_R_1[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxMantBatabata2_R_1.4bpp");
SECTION(".rodata.dat_data_banim_p51") u8 AnimSprite_EfxMantBatabata2_R_2[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxMantBatabata2_R_2.4bpp");
struct AnimSpriteData AnimSprite_EfxMantBatabata2_R_3[] __attribute__((section(".rodata.dat_data_banim_p51"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0009, 12, -17 } } },
    { .header = 0x40000000, .as = { .object = { 0x0049, 12, -1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0068, 4, 7 } } },
    { .header = 0x00000000, .as = { .object = { 0x006B, 28, 7 } } },
    { .header = 0x00000000, .as = { .object = { 0x0040, 14, -25 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -4, -17 } } },
    { .header = 0x00008000, .as = { .object = { 0x0000, 4, -17 } } },
    { .header = 0x00000000, .as = { .object = { 0x0043, 28, -1 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxMantBatabata2_R_4[] __attribute__((section(".rodata.dat_data_banim_p51"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x000D, 12, -17 } } },
    { .header = 0x40000000, .as = { .object = { 0x004D, 12, -1 } } },
    { .header = 0x00000000, .as = { .object = { 0x006C, 4, 7 } } },
    { .header = 0x00000000, .as = { .object = { 0x0063, 28, 7 } } },
    { .header = 0x00008000, .as = { .object = { 0x0000, 4, -17 } } },
    { .header = 0x00000000, .as = { .object = { 0x0044, -4, -17 } } },
    { .header = 0x00000000, .as = { .object = { 0x0040, 14, -25 } } },
    { .header = 0x00000000, .as = { .object = { 0x0043, 28, -1 } } },
    ANIM_SPRITE_END,
};
