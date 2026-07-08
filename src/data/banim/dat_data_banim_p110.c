#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p110.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p110") u8 AnimSprite_EfxHazymoonOBJ2_2_1[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxHazymoonOBJ2_2_1.4bpp");
SECTION(".rodata.dat_data_banim_p110") u8 AnimSprite_EfxHazymoonOBJ2_2_2[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxHazymoonOBJ2_2_2.4bpp");
SECTION(".rodata.dat_data_banim_p110") u8 AnimSprite_EfxHazymoonOBJ2_2_3[] = INCBIN_U8("graphics/reuse/AnimSprite_EfxHazymoonOBJ2_2_3.4bpp");
struct AnimSpriteData AnimSprite_EfxHazymoonOBJ2_2_4[] __attribute__((section(".rodata.dat_data_banim_p110"))) =
{
    { .header = 0x40004000, .as = { .object = { 0x0018, -48, -32 } } },
    { .header = 0x00000000, .as = { .object = { 0x001C, -16, -32 } } },
    { .header = 0x00008000, .as = { .object = { 0x0038, -48, -24 } } },
    { .header = 0x40000000, .as = { .object = { 0x001E, -48, -8 } } },
    { .header = 0x00004000, .as = { .object = { 0x003A, -32, 8 } } },
    { .header = 0x00000000, .as = { .object = { 0x001D, -32, 0 } } },
    { .header = 0x00000000, .as = { .object = { 0x0059, -40, 8 } } },
    { .header = 0x40004000, .as = { .object = { 0x007B, -8, 19 } } },
    { .header = 0x00000000, .as = { .object = { 0x007F, 24, 19 } } },
    { .header = 0x00004000, .as = { .object = { 0x003C, -24, 16 } } },
    { .header = 0x00004000, .as = { .object = { 0x0078, 32, 16 } } },
    { .header = 0x00008000, .as = { .object = { 0x005A, 40, 0 } } },
    { .header = 0x00004000, .as = { .object = { 0x005B, 32, -8 } } },
    { .header = 0x00004000, .as = { .object = { 0x005D, 24, -16 } } },
    ANIM_SPRITE_END,
};
