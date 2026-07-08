#include "global.h"
#include "anime.h"

/* Migrated from asm/dat_worldmap_gmapunit_p774.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct AnimSpriteData AnimSprite_EkrBaseKaiten_2[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p774"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0009, -26, 1 } } },
    { .header = 0x00004000, .as = { .object = { 0x0002, 6, 1 } } },
    { .header = 0x00004000, .as = { .object = { 0x0022, -26, -7 } } },
    { .header = 0x80004000, .as = { .object = { 0x0004, -10, -15 } } },
    { .header = 0x00008000, .as = { .object = { 0x0008, 22, -15 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EkrBaseKaiten_3[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p774"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0010, 1, -16 } } },
    { .header = 0x80004000, .as = { .object = { 0x0010, -15, 0 } } },
    { .header = 0x60000000, .as = { .object = { 0x0012, 17, -32 } } },
    { .header = 0x70000000, .as = { .object = { 0x0012, -15, -16 } } },
    { .header = 0x70000000, .as = { .object = { 0x0012, 1, -32 } } },
    { .header = 0x40000000, .as = { .object = { 0x0012, -15, 16 } } },
    { .header = 0x50000000, .as = { .object = { 0x0012, -31, 16 } } },
    { .header = 0x70000000, .as = { .object = { 0x0012, -31, 0 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EkrBaseKaiten_4[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p774"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0014, -8, -37 } } },
    { .header = 0x80004000, .as = { .object = { 0x0018, -8, -21 } } },
    { .header = 0x80004000, .as = { .object = { 0x001C, -23, 11 } } },
    { .header = 0x00004000, .as = { .object = { 0x0040, -23, 27 } } },
    { .header = 0x00000000, .as = { .object = { 0x0042, -7, 27 } } },
    { .header = 0x80004000, .as = { .object = { 0x001C, -16, -5 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EkrBaseKaiten_5[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p774"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0000, -11, -8 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -11, -24 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -11, -40 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -11, 8 } } },
    { .header = 0x00004000, .as = { .object = { 0x000D, -11, -48 } } },
    { .header = 0x00008000, .as = { .object = { 0x000F, 5, -40 } } },
    { .header = 0x00008000, .as = { .object = { 0x000F, 5, -24 } } },
    { .header = 0x00008000, .as = { .object = { 0x000F, 5, -8 } } },
    { .header = 0x00008000, .as = { .object = { 0x000F, 5, 8 } } },
    { .header = 0x00008000, .as = { .object = { 0x000F, 5, 24 } } },
    { .header = 0x40000000, .as = { .object = { 0x0000, -11, 24 } } },
    { .header = 0x20004000, .as = { .object = { 0x000D, -11, 40 } } },
    { .header = 0x20000000, .as = { .object = { 0x002D, 5, 40 } } },
    { .header = 0x00000000, .as = { .object = { 0x002D, 5, -48 } } },
    ANIM_SPRITE_END,
};
SECTION(".rodata.dat_worldmap_gmapunit_p774") u8 AnimSprite_EkrBaseKaiten_6[] = INCBIN_U8("graphics/reuse/AnimSprite_EkrBaseKaiten_6.4bpp");
struct AnimSpriteData AnimSprite_EkrBaseKaiten_7[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p774"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x0045, -48, -32 } } },
    { .header = 0x80004000, .as = { .object = { 0x0045, -32, -16 } } },
    { .header = 0x80004000, .as = { .object = { 0x0045, -16, 0 } } },
    { .header = 0x80004000, .as = { .object = { 0x0045, 0, 16 } } },
    { .header = 0x00004000, .as = { .object = { 0x0060, -55, -40 } } },
    { .header = 0x00000000, .as = { .object = { 0x0062, -39, -40 } } },
    { .header = 0x40000000, .as = { .object = { 0x0043, -16, -32 } } },
    { .header = 0x00004000, .as = { .object = { 0x0049, -31, -40 } } },
    { .header = 0x40000000, .as = { .object = { 0x0043, 0, -16 } } },
    { .header = 0x40000000, .as = { .object = { 0x0043, 16, 0 } } },
    { .header = 0x40000000, .as = { .object = { 0x004B, 32, 16 } } },
    { .header = 0x40000000, .as = { .object = { 0x004D, 32, 40 } } },
    { .header = 0x40000000, .as = { .object = { 0x0045, 16, 32 } } },
    { .header = 0x00004000, .as = { .object = { 0x0069, 32, 32 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EkrBaseKaiten_8[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p774"))) =
{
    { .header = 0x80004000, .as = { .object = { 0x004F, -56, -17 } } },
    { .header = 0x80004000, .as = { .object = { 0x0053, -24, -17 } } },
    { .header = 0x40000000, .as = { .object = { 0x0057, 8, -17 } } },
    { .header = 0x80004000, .as = { .object = { 0x004F, 0, -1 } } },
    { .header = 0x40004000, .as = { .object = { 0x0085, -62, -25 } } },
    { .header = 0x00000000, .as = { .object = { 0x0089, -30, -25 } } },
    { .header = 0x40000000, .as = { .object = { 0x0083, -72, -17 } } },
    { .header = 0x80004000, .as = { .object = { 0x005A, -40, -1 } } },
    { .header = 0x00008000, .as = { .object = { 0x005E, -8, -1 } } },
    { .header = 0x80004000, .as = { .object = { 0x005A, 16, 15 } } },
    { .header = 0x00008000, .as = { .object = { 0x005E, 48, 15 } } },
    { .header = 0x40000000, .as = { .object = { 0x0081, 56, 15 } } },
    { .header = 0x40000000, .as = { .object = { 0x0053, 32, -1 } } },
    { .header = 0x00008000, .as = { .object = { 0x0055, 48, -1 } } },
    { .header = 0x00008000, .as = { .object = { 0x0080, 56, -1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0059, 8, 15 } } },
    { .header = 0x00000000, .as = { .object = { 0x0059, -48, -1 } } },
    { .header = 0x00000000, .as = { .object = { 0x0079, 24, -9 } } },
    ANIM_SPRITE_END,
};
struct AnimSpriteData AnimSprite_EkrBaseKaiten_9[] __attribute__((section(".rodata.dat_worldmap_gmapunit_p774"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x005F, 0, 3 } } },
    ANIM_SPRITE_END,
};
