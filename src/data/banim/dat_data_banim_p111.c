#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p111.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p111") u8 AnimSprite_EfxHazymoonOBJ2_3_1[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxHazymoonOBJ2_3_1.4bpp");
struct AnimSpriteData AnimSprite_EfxHazymoonOBJ2_3_2[] __attribute__((section(".rodata.dat_data_banim_p111"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x0008, -24, -48 } } },
    { .header = 0x00000000, .as = { .object = { 0x000A, -8, -48 } } },
    { .header = 0x00000000, .as = { .object = { 0x0028, -24, -40 } } },
    { .header = 0x00004000, .as = { .object = { 0x002A, -8, -41 } } },
    { .header = 0x00000000, .as = { .object = { 0x0068, -24, 0 } } },
    { .header = 0x40008000, .as = { .object = { 0x000C, -24, -32 } } },
    { .header = 0x40008000, .as = { .object = { 0x000D, -16, 0 } } },
    { .header = 0x00008000, .as = { .object = { 0x000E, -8, 16 } } },
    { .header = 0x00000000, .as = { .object = { 0x004E, -8, 32 } } },
    { .header = 0x00000000, .as = { .object = { 0x006E, 0, 32 } } },
    { .header = 0x00008000, .as = { .object = { 0x000F, 16, 16 } } },
    { .header = 0x00000000, .as = { .object = { 0x004F, 16, 32 } } },
    { .header = 0x00000000, .as = { .object = { 0x006F, 8, 32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0069, 8, 40 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_data_banim_p111") u8 AnimSprite_EfxHazymoonOBJ2_3_3[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxHazymoonOBJ2_3_3.4bpp");
struct AnimSpriteData AnimSprite_EfxHazymoonOBJ2_3_4[] __attribute__((section(".rodata.dat_data_banim_p111"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x0018, -24, -48 } } },
    { .header = 0x00000000, .as = { .object = { 0x001A, -8, -48 } } },
    { .header = 0x00000000, .as = { .object = { 0x0038, -24, -40 } } },
    { .header = 0x00004000, .as = { .object = { 0x003A, -8, -40 } } },
    { .header = 0x40008000, .as = { .object = { 0x001C, -24, -32 } } },
    { .header = 0x40008000, .as = { .object = { 0x001D, -16, 0 } } },
    { .header = 0x00008000, .as = { .object = { 0x001E, -8, 16 } } },
    { .header = 0x00000000, .as = { .object = { 0x005E, -8, 32 } } },
    { .header = 0x00000000, .as = { .object = { 0x007E, 0, 32 } } },
    { .header = 0x00008000, .as = { .object = { 0x001F, 16, 16 } } },
    { .header = 0x00000000, .as = { .object = { 0x005F, 16, 32 } } },
    { .header = 0x00000000, .as = { .object = { 0x007F, 8, 32 } } },
    { .header = 0x00000000, .as = { .object = { 0x0079, 8, 40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0078, -24, 0 } } },
    ANIM_SPRITE_END,
};
