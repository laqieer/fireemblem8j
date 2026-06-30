#include "global.h"
#include "anime.h"
#include "gba_sprites.h"

/* Migrated from asm/dat_banim_ekrdragonfx_10.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_banim_ekrdragonfx_10") struct AnimSpriteData AnimSprite_DemoKingTunkFace_3[] =
{
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_64) << 16), .as = { .object = { 0x0000, -20, -72 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0004, 12, -72 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0084, 12, -40 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0025, -60, -96 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0029, -28, -96 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x00A5, -60, -64 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x00A9, -28, -64 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x00E5, -60, -48 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x00E9, -28, -48 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x000A, -20, -88 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x000C, -4, -88 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x004A, 20, -80 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x004E, 52, -80 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x00CA, 20, -48 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x00CE, 52, -48 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_banim_ekrdragonfx_10") struct AnimSpriteData AnimSprite_DemoKingTunkFace_4[] =
{
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x003B, -4, -8 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_64) << 16), .as = { .object = { 0x000F, -20, -72 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0013, 12, -72 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0093, 12, -40 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0034, -60, -96 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0038, -28, -96 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x00B4, -60, -64 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x00B8, -28, -64 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x00F4, -60, -48 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x00F8, -28, -48 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x0019, -20, -88 } } },
    { .header = (u32)(ATTR0_SQUARE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x0059, 20, -80 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_16) << 16), .as = { .object = { 0x005D, 52, -80 } } },
    { .header = (u32)(ATTR0_WIDE) | ((u32)(ATTR1_SIZE_32) << 16), .as = { .object = { 0x00D9, 20, -48 } } },
    { .header = (u32)(ATTR0_TALL) | ((u32)(ATTR1_SIZE_8) << 16), .as = { .object = { 0x00DD, 52, -48 } } },
    ANIM_SPRITE_END,
};
