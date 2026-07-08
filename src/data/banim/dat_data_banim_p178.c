#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_data_banim_p178.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_banim_p178") u16 Img_GleipnirSprites_Comet[] = INCBIN_U16("graphics/banim/_us/banim/assets/img/006A2874_Img_GleipnirSprites_Comet.4bpp.lz");
SECTION(".rodata.dat_data_banim_p178") u16 Pal_GleipnirSprites_Comet[] = INCBIN_U16("graphics/banim/_us/banim/assets/pal/006A2CE8_Pal_GleipnirSprites_Comet.gbapal");
struct AnimSpriteData AnimSprite_EfxDarkGradoOBJ02piece_R_1[] __attribute__((section(".rodata.dat_data_banim_p178"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0080, 0x0000, 0x0000, 0x0080 } } },
    { .header = 0x80000300, .as = { .object = { 0x0000, -32, -32 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxDarkGradoOBJ02piece_R_2[] __attribute__((section(".rodata.dat_data_banim_p178"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0080, 0x0000, 0x0000, 0x0080 } } },
    { .header = 0x80000300, .as = { .object = { 0x0004, -32, -32 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EfxDarkGradoOBJ02piece_R_3[] __attribute__((section(".rodata.dat_data_banim_p178"))) =
{
    { .header = 0xFFFF0001, .as = { .affine = { 0x0080, 0x0000, 0x0000, 0x0080 } } },
    { .header = 0x80000300, .as = { .object = { 0x0008, -32, -32 } } },
    ANIM_SPRITE_END,
};
