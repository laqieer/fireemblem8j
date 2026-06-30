#include "global.h"
#include "anime.h"
#include "gba_sprites.h"

/* Migrated from asm/dat_banim_ekrdragonfx_2.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_banim_ekrdragonfx_2") struct AnimSpriteData AnimSprite_Ekrdragonfx1_0[] =
{
    { .header = (u32)(ATTR0_WIDE) | (((u32)(ATTR1_SIZE_8) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0000, -16, 0 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_2") struct AnimSpriteData AnimSprite_Ekrdragonfx1_1[] =
{
    { .header = (u32)(ATTR0_TALL) | (((u32)(ATTR1_SIZE_8) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0002, -16, 0 } } },
    { .header = (u32)(ATTR0_SQUARE) | (((u32)(ATTR1_SIZE_8) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0023, -8, 16 } } },
    { .header = (u32)(ATTR0_SQUARE) | (((u32)(ATTR1_SIZE_8) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0003, -24, 0 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_2") struct AnimSpriteData AnimSprite_Ekrdragonfx1_2[] =
{
    { .header = (u32)(ATTR0_SQUARE) | (((u32)(ATTR1_SIZE_16) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0004, -24, 0 } } },
    { .header = (u32)(ATTR0_SQUARE) | (((u32)(ATTR1_SIZE_8) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0006, -8, 16 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_2") struct AnimSpriteData AnimSprite_Ekrdragonfx1_3[] =
{
    { .header = (u32)(ATTR0_SQUARE) | (((u32)(ATTR1_SIZE_8) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0026, -8, 16 } } },
    { .header = (u32)(ATTR0_SQUARE) | (((u32)(ATTR1_SIZE_16) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0007, -24, 0 } } },
    { .header = (u32)(ATTR0_SQUARE) | (((u32)(ATTR1_SIZE_8) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0009, -32, 8 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_2") struct AnimSpriteData AnimSprite_Ekrdragonfx1_4[] =
{
    { .header = (u32)(ATTR0_TALL) | (((u32)(ATTR1_SIZE_8) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x000A, -16, 8 } } },
    { .header = (u32)(ATTR0_SQUARE) | (((u32)(ATTR1_SIZE_16) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x000B, -32, 16 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_2") struct AnimSpriteData AnimSprite_Ekrdragonfx1_5[] =
{
    { .header = (u32)(ATTR0_SQUARE) | (((u32)(ATTR1_SIZE_8) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0029, -16, 8 } } },
    { .header = (u32)(ATTR0_SQUARE) | (((u32)(ATTR1_SIZE_16) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x000D, -32, 16 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_2") struct AnimSpriteData AnimSprite_Ekrdragonfx1_6[] =
{
    { .header = (u32)(ATTR0_TALL) | (((u32)(ATTR1_SIZE_8) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x000F, -32, 16 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_2") struct AnimSpriteData AnimSprite_Ekrdragonfx1_7[] =
{
    ANIM_SPRITE_END,
};
