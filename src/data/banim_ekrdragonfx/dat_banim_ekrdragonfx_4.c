#include "global.h"
#include "anime.h"
#include "gba_sprites.h"

/* Migrated from asm/dat_banim_ekrdragonfx_4.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_banim_ekrdragonfx_4") struct AnimSpriteData AnimSprite_EfxMaohFlashThunderObj_1[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x000E, -8, -24 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x000C, -8, -56 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x000A, -8, -88 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0008, -8, -120 } } },
    { .header = (u32)(ATTR0_WIDE) | (((u32)(ATTR1_SIZE_8) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0030, -8, -128 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_4") struct AnimSpriteData AnimSprite_EfxMaohFlashThunderObj_2[] =
{
    { .header = (u32)(ATTR0_TALL) | (((u32)(ATTR1_SIZE_32) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x000E, -8, -24 } } },
    { .header = (u32)(ATTR0_TALL) | (((u32)(ATTR1_SIZE_32) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x000C, -8, -56 } } },
    { .header = (u32)(ATTR0_TALL) | (((u32)(ATTR1_SIZE_32) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x000A, -8, -88 } } },
    { .header = (u32)(ATTR0_TALL) | (((u32)(ATTR1_SIZE_32) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0008, -8, -120 } } },
    { .header = (u32)(ATTR0_WIDE) | (((u32)(ATTR1_SIZE_8) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0030, -8, -128 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_4") struct AnimSpriteData AnimSprite_EfxMaohFlashThunderObj_3[] =
{
    { .header = (u32)(ATTR0_TALL) | (((u32)(ATTR1_SIZE_32) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x000A, 0, -96 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_4") struct AnimSpriteData AnimSprite_EfxMaohFlashThunderObj_4[] =
{
    { .header = (u32)(ATTR0_TALL) | (((u32)(ATTR1_SIZE_32) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0008, 0, -128 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_4") struct AnimSpriteData AnimSprite_EfxMaohFlashThunderObj_5[] =
{
    { .header = (u32)(ATTR0_SQUARE) | (((u32)(ATTR1_SIZE_32) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0000, -16, -16 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_4") struct AnimSpriteData AnimSprite_EfxMaohFlashThunderObj_6[] =
{
    { .header = (u32)(ATTR0_SQUARE) | (((u32)(ATTR1_SIZE_32) + ATTR1_FLIP_X) << 16), .as = { .object = { 0x0004, -16, -16 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_4") struct AnimSpriteData AnimSprite_EfxMaohFlashThunderObj_7[] =
{
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_4") struct AnimSpriteData AnimSprite_EfxMaohFlashThunderObj_8[] =
{
    { .header = (u32)(1) | ((u32)0xFFFF << 16), .as = { .affine = { -0x116, 0xa0, 0xa0, 0x116 } } },
    { .header = (u32)(ATTR0_SQUARE + OBJ_ROT_SCALE_ON) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0000, -16, -16 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_4") struct AnimSpriteData AnimSprite_EfxMaohFlashThunderObj_9[] =
{
    { .header = (u32)(1) | ((u32)0xFFFF << 16), .as = { .affine = { -0xd7, 0x175, 0x175, 0xd7 } } },
    { .header = (u32)(ATTR0_SQUARE + OBJ_ROT_SCALE_ON) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0000, -16, -16 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_4") struct AnimSpriteData AnimSprite_EfxMaohFlashThunderObj_10[] =
{
    { .header = (u32)(1) | ((u32)0xFFFF << 16), .as = { .affine = { 0x0, 0x35d, 0x35d, 0x0 } } },
    { .header = (u32)(ATTR0_SQUARE + OBJ_ROT_SCALE_ON) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0000, -16, -16 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_4") struct AnimSpriteData AnimSprite_EfxMaohFlashThunderObj_11[] =
{
    { .header = (u32)(1) | ((u32)0xFFFF << 16), .as = { .affine = { -0x116, 0xa0, 0xa0, 0x116 } } },
    { .header = (u32)(ATTR0_SQUARE + OBJ_ROT_SCALE_ON) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0004, -16, -16 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_4") struct AnimSpriteData AnimSprite_EfxMaohFlashThunderObj_12[] =
{
    { .header = (u32)(1) | ((u32)0xFFFF << 16), .as = { .affine = { -0xd6, 0x172, 0x172, 0xd6 } } },
    { .header = (u32)(ATTR0_SQUARE + OBJ_ROT_SCALE_ON) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0004, -16, -16 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_4") struct AnimSpriteData AnimSprite_EfxMaohFlashThunderObj_13[] =
{
    { .header = (u32)(1) | ((u32)0xFFFF << 16), .as = { .affine = { 0x0, 0x35d, 0x35d, 0x0 } } },
    { .header = (u32)(ATTR0_SQUARE + OBJ_ROT_SCALE_ON) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0004, -16, -16 } } },
    ANIM_SPRITE_END,
};
