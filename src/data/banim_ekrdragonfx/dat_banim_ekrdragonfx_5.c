#include "global.h"
#include "anime.h"
#include "gba_sprites.h"

/* Migrated from asm/dat_banim_ekrdragonfx_5.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_banim_ekrdragonfx_5") u16 Img_DemonLightSprites_efxMaohFlashEyeFire1OBJ[] = INCBIN_U16("graphics/banim/_us/banim/dragonfx/Img_DemonLightSprites_087A5BA4.4bpp.lz");
SECTION(".rodata.dat_banim_ekrdragonfx_5") u16 Img_DemonLightSprites_efxMaohFlashEyeFire2OBJ[] = INCBIN_U16("graphics/banim/_us/banim/dragonfx/Img_DemonLightSprites_087A5E9C.4bpp.lz");
SECTION(".rodata.dat_banim_ekrdragonfx_5") u16 Pal_DemonLightSprites_efxMaohFlashEyeFire[] = INCBIN_U16("graphics/banim/_us/banim/dragonfx/Pal_DemonLightSprites_087A61EC.gbapal");
SECTION(".rodata.dat_banim_ekrdragonfx_5") struct AnimSpriteData AnimSprite_EfxMaohFlashEyeFire1Obj_1[] =
{
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0002, 0, 0 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0006, 32, 0 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0008, 48, 0 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0022, 0, 40 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0000, 8, 8 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0000, 8, 24 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0000, 24, 8 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0000, 24, 24 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 40, 8 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0001, 40, 24 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0026, 32, 40 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0020, 16, 40 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0044, 16, 48 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0062, 48, 8 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0063, 48, 16 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0065, 48, 24 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0009, 0, 8 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0043, 8, 48 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0042, 48, 32 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0040, 22, 12 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0040, 22, 28 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0040, 38, 12 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0040, 38, 28 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0060, 30, 44 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0041, 54, 12 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0041, 54, 28 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0010, 14, 4 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0014, 46, 4 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0016, 62, 4 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0017, 14, 12 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0071, 62, 20 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0073, 62, 28 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0050, 62, 36 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0051, 22, 52 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0030, 14, 44 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0034, 46, 44 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_5") struct AnimSpriteData AnimSprite_EfxMaohFlashEyeFire1Obj_2[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x000A, 0, 0 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x004A, 0, 16 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x006A, 8, 24 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x000C, 16, 8 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x004C, 16, 32 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x002B, 24, 24 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0047, 40, 16 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0028, 8, 32 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x006E, 24, 48 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x004E, 32, 32 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x006F, 40, 40 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000E, 32, 16 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0055, 54, 20 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0018, 14, 4 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0058, 14, 20 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0078, 22, 28 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x001A, 30, 12 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x001C, 46, 20 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x005C, 46, 36 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x007D, 54, 44 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0039, 38, 28 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x005A, 30, 36 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0036, 22, 36 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x007C, 38, 52 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_5") struct AnimSpriteData AnimSprite_EfxMaohFlashEyeFire1Obj_3[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0000, 0, 0 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0002, 16, 0 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0040, 8, 16 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0044, 40, 16 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0005, 32, 32 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0007, 48, 32 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0003, 16, 32 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x006C, 48, 48 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0010, 14, 4 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0012, 30, 4 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0050, 22, 20 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0054, 54, 20 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0015, 46, 36 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x0017, 62, 36 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0013, 30, 36 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x007C, 62, 52 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_5") struct AnimSpriteData AnimSprite_EfxMaohFlashEyeFire1Obj_4[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0008, 0, 0 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0046, 8, 16 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x004A, 48, 40 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000A, 32, 32 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000C, 48, 16 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0018, 14, 4 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0056, 22, 20 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x005A, 62, 44 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x001A, 46, 36 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x001C, 62, 20 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_5") struct AnimSpriteData AnimSprite_EfxMaohFlashEyeFire1Obj_5[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x000D, 0, 0 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x001D, 14, 4 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_5") struct AnimSpriteData AnimSprite_EfxMaohFlashEyeFire1Obj_6[] =
{
    ANIM_SPRITE_END,
};
