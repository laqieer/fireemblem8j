#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p241.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p241") u16 Img_Banim_18[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/00751808_Img_08751808.4bpp.lz");
SECTION(".rodata.dat_data_banim_p241") u16 Pal_efxSuperdruidOBJ[] = INCBIN_U16("graphics/banim/_us/banim/assets/pal/00751DB4_Pal_08751DB4.gbapal");
struct AnimSpriteData AnimSprite_efxSuperdruidOBJ_0[] __attribute__((section(".rodata.dat_data_banim_p241"))) =
{
    { .header = 0x80008000, .as = { .object = { 0x0000, -96, -88 } } },
    { .header = 0x40008000, .as = { .object = { 0x0002, -80, -88 } } },
    { .header = 0x80008000, .as = { .object = { 0x0003, -80, -56 } } },
    { .header = 0x80008000, .as = { .object = { 0x0005, -80, -24 } } },
    { .header = 0x80008000, .as = { .object = { 0x0007, -80, 8 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_efxSuperdruidOBJ_1[] __attribute__((section(".rodata.dat_data_banim_p241"))) =
{
    { .header = 0xB0008000, .as = { .object = { 0x0009, -88, 8 } } },
    { .header = 0x70008000, .as = { .object = { 0x000B, -96, 8 } } },
    { .header = 0xB0008000, .as = { .object = { 0x000C, -104, -24 } } },
    { .header = 0xB0008000, .as = { .object = { 0x000E, -104, -56 } } },
    { .header = 0xB0008000, .as = { .object = { 0x0010, -104, -88 } } },
    { .header = 0x90008000, .as = { .object = { 0x0009, -22, -88 } } },
    { .header = 0x50008000, .as = { .object = { 0x000B, -30, -88 } } },
    { .header = 0xB0008000, .as = { .object = { 0x000C, -38, 8 } } },
    { .header = 0xB0008000, .as = { .object = { 0x000E, -38, -24 } } },
    { .header = 0xB0008000, .as = { .object = { 0x0010, -38, -56 } } },
    { .header = 0x40008000, .as = { .object = { 0x0012, 48, -88 } } },
    { .header = 0x80008000, .as = { .object = { 0x0013, 48, -56 } } },
    { .header = 0x40008000, .as = { .object = { 0x0015, 64, -56 } } },
    { .header = 0x80008000, .as = { .object = { 0x0016, 56, -24 } } },
    { .header = 0x80008000, .as = { .object = { 0x0018, 56, 8 } } },
    { .header = 0xB0008000, .as = { .object = { 0x0009, 88, 8 } } },
    { .header = 0x70008000, .as = { .object = { 0x000B, 80, 8 } } },
    { .header = 0xB0008000, .as = { .object = { 0x000C, 72, -24 } } },
    { .header = 0xB0008000, .as = { .object = { 0x000E, 72, -56 } } },
    { .header = 0xB0008000, .as = { .object = { 0x0010, 72, -88 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_efxSuperdruidOBJ_2[] __attribute__((section(".rodata.dat_data_banim_p241"))) =
{
    { .header = 0x60008000, .as = { .object = { 0x0012, 8, 8 } } },
    { .header = 0xA0008000, .as = { .object = { 0x0013, 8, -24 } } },
    { .header = 0x60008000, .as = { .object = { 0x0015, 24, -24 } } },
    { .header = 0xA0008000, .as = { .object = { 0x0016, 16, -56 } } },
    { .header = 0xA0008000, .as = { .object = { 0x0018, 16, -88 } } },
    ANIM_SPRITE_END,
};
