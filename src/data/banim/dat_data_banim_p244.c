#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p244.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p244") u16 Img_EfxLokmsunaObj[] = INCBIN_U16("graphics/reuse/Img_EfxLokmsunaObj.4bpp.lz");
struct AnimSpriteData AnimSprite_EfxLokmsunaObj_L_1[] __attribute__((section(".rodata.dat_data_banim_p244"))) =
{
    { .header = 0x40004000, .as = { .object = { 0x0000, -18, 9 } } },
    { .header = 0x00000000, .as = { .object = { 0x0004, 14, 9 } } },
    { .header = 0x40004000, .as = { .object = { 0x0005, -10, 1 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLokmsunaObj_L_2[] __attribute__((section(".rodata.dat_data_banim_p244"))) =
{
    { .header = 0x40004000, .as = { .object = { 0x0009, -11, 8 } } },
    { .header = 0x00000000, .as = { .object = { 0x000D, 21, 8 } } },
    { .header = 0x00004000, .as = { .object = { 0x000E, 5, 0 } } },
    { .header = 0x00000000, .as = { .object = { 0x0010, 21, 0 } } },
    { .header = 0x00000000, .as = { .object = { 0x0011, 13, 16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLokmsunaObj_L_3[] __attribute__((section(".rodata.dat_data_banim_p244"))) =
{
    { .header = 0x40004000, .as = { .object = { 0x0012, 4, 7 } } },
    { .header = 0x00000000, .as = { .object = { 0x0019, 30, -1 } } },
    { .header = 0x00004000, .as = { .object = { 0x0016, 4, 15 } } },
    { .header = 0x00000000, .as = { .object = { 0x0018, 20, 15 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLokmsunaObj_L_4[] __attribute__((section(".rodata.dat_data_banim_p244"))) =
{
    { .header = 0x40004000, .as = { .object = { 0x001A, 0, 11 } } },
    { .header = 0x00004000, .as = { .object = { 0x001E, 17, 3 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLokmsunaObj_L_5[] __attribute__((section(".rodata.dat_data_banim_p244"))) =
{
    { .header = 0x40004000, .as = { .object = { 0x0020, -5, 12 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxLokmsunaObj_L_6[] __attribute__((section(".rodata.dat_data_banim_p244"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x0024, -5, 14 } } },
    ANIM_SPRITE_END,
};
