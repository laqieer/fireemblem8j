#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p193.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p193") u16 Img_StoneSprites[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/006BD260_Img_StoneSprites.4bpp.lz");
SECTION(".rodata.dat_data_banim_p193") u16 Pal_StoneSprites[] = INCBIN_U16("graphics/banim/_us/banim/assets/pal/006BD76C_Pal_StoneSprites.gbapal");
struct AnimSpriteData AnimSprite_EfxStone_1[] __attribute__((section(".rodata.dat_data_banim_p193"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x003F, -8, -4 } } },
    { .header = 0x10000000, .as = { .object = { 0x003F, 0, -4 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxStone_2[] __attribute__((section(".rodata.dat_data_banim_p193"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x003E, -8, -4 } } },
    { .header = 0x10000000, .as = { .object = { 0x003E, 0, -4 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxStone_3[] __attribute__((section(".rodata.dat_data_banim_p193"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x003C, -16, -8 } } },
    { .header = 0x10004000, .as = { .object = { 0x003C, 0, -8 } } },
    { .header = 0x20004000, .as = { .object = { 0x003C, -16, 0 } } },
    { .header = 0x30004000, .as = { .object = { 0x003C, 0, 0 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxStone_4[] __attribute__((section(".rodata.dat_data_banim_p193"))) =
{
    { .header = 0x00004000, .as = { .object = { 0x003A, -16, -8 } } },
    { .header = 0x10004000, .as = { .object = { 0x003A, 0, -8 } } },
    { .header = 0x20004000, .as = { .object = { 0x003A, -16, 0 } } },
    { .header = 0x30004000, .as = { .object = { 0x003A, 0, 0 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxStone_5[] __attribute__((section(".rodata.dat_data_banim_p193"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0018, -16, -16 } } },
    { .header = 0x00000000, .as = { .object = { 0x0037, -24, -8 } } },
    { .header = 0x60000000, .as = { .object = { 0x0018, -16, 0 } } },
    { .header = 0x20000000, .as = { .object = { 0x0037, -24, 0 } } },
    { .header = 0x50000000, .as = { .object = { 0x0018, 0, -16 } } },
    { .header = 0x10000000, .as = { .object = { 0x0037, 16, -8 } } },
    { .header = 0x70000000, .as = { .object = { 0x0018, 0, 0 } } },
    { .header = 0x30000000, .as = { .object = { 0x0037, 16, 0 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxStone_6[] __attribute__((section(".rodata.dat_data_banim_p193"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0015, -16, -16 } } },
    { .header = 0x00000000, .as = { .object = { 0x0034, -24, -8 } } },
    { .header = 0x60000000, .as = { .object = { 0x0015, -16, 0 } } },
    { .header = 0x20000000, .as = { .object = { 0x0034, -24, 0 } } },
    { .header = 0x50000000, .as = { .object = { 0x0015, 0, -16 } } },
    { .header = 0x10000000, .as = { .object = { 0x0034, 16, -8 } } },
    { .header = 0x70000000, .as = { .object = { 0x0015, 0, 0 } } },
    { .header = 0x30000000, .as = { .object = { 0x0034, 16, 0 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxStone_7[] __attribute__((section(".rodata.dat_data_banim_p193"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0010, -32, -16 } } },
    { .header = 0x90004000, .as = { .object = { 0x0010, 0, -16 } } },
    { .header = 0xA0004000, .as = { .object = { 0x0010, -32, 0 } } },
    { .header = 0xB0004000, .as = { .object = { 0x0010, 0, 0 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxStone_8[] __attribute__((section(".rodata.dat_data_banim_p193"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0000, -32, -16 } } },
    { .header = 0x90004000, .as = { .object = { 0x0004, 0, -16 } } },
    { .header = 0xB0004000, .as = { .object = { 0x0008, 0, 0 } } },
    { .header = 0xA0004000, .as = { .object = { 0x000C, -32, 0 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxStone_9[] __attribute__((section(".rodata.dat_data_banim_p193"))) =
{
    { .header = 0x90004000, .as = { .object = { 0x0000, 0, -16 } } },
    { .header = 0xB0004000, .as = { .object = { 0x0004, 0, 0 } } },
    { .header = 0xA0004000, .as = { .object = { 0x0008, -32, 0 } } },
    { .header = 0x80004000, .as = { .object = { 0x000C, -32, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxStone_10[] __attribute__((section(".rodata.dat_data_banim_p193"))) =
{
    { .header = 0xB0004000, .as = { .object = { 0x0000, 0, 0 } } },
    { .header = 0xA0004000, .as = { .object = { 0x0004, -32, 0 } } },
    { .header = 0x80004000, .as = { .object = { 0x0008, -32, -16 } } },
    { .header = 0x90004000, .as = { .object = { 0x000C, 0, -16 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxStone_11[] __attribute__((section(".rodata.dat_data_banim_p193"))) =
{
    { .header = 0xA0004000, .as = { .object = { 0x0000, -32, 0 } } },
    { .header = 0x80004000, .as = { .object = { 0x0004, -32, -16 } } },
    { .header = 0x90004000, .as = { .object = { 0x0008, 0, -16 } } },
    { .header = 0xB0004000, .as = { .object = { 0x000C, 0, 0 } } },
    ANIM_SPRITE_END,
};
